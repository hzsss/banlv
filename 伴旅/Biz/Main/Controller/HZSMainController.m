//
//  HZSMainController.m
//  伴旅
//
//  Created by 灿灿 on 2017/12/6.
//  Copyright © 2017年 灿灿. All rights reserved.
//

#import "HZSMainController.h"
#import "HZSMainHeaderView.h"
#import <CoreLocation/CoreLocation.h>
#import "HZSIntance.h"
#import "HZSWeather.h"
#import "HZSAdvice.h"
#import "HZSMainViewCell.h"
#import "Masonry.h"
#import "HZSWebController.h"

static NSString * const ID = @"cell";
@interface HZSMainController ()<CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) HZSIntance *instance;
@property (nonatomic, strong) HZSWeather *weather;
@property (nonatomic, strong) NSMutableDictionary *heightArray;
@property (nonatomic, strong) NSMutableArray *adviceArray;
@end

@implementation HZSMainController

- (NSMutableArray *)adviceArray {
    if (!_adviceArray) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"HZSAdvice.plist" ofType:nil];
        _adviceArray = [NSMutableArray arrayWithContentsOfFile:path];
        
        NSMutableArray *dictArray = [NSMutableArray array];
        for (NSDictionary *dict in _adviceArray) {
            HZSAdvice *advice = [HZSAdvice adviceWithDict:dict];
            [dictArray addObject:advice];
        }
        _adviceArray = dictArray;
    }
    return _adviceArray;
}

- (HZSIntance *)instance {
    if (_instance == nil) {
        _instance = [HZSIntance sharedInstance];
    }
    return _instance;
}

- (HZSWeather *)weather {
    if (_weather == nil) {
        _weather = [HZSWeather shareWeather];
    }
    return _weather;
}

- (NSMutableDictionary *)heightArray {
    if (!_heightArray) {
        _heightArray = [NSMutableDictionary dictionary];
    }
    return _heightArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initLocation];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HZSMainViewCell class]) bundle:nil] forCellReuseIdentifier:ID];
    
    HZSMainHeaderView *headerView = [[HZSMainHeaderView alloc] init];
    
    self.tableView.tableHeaderView = headerView;
    
    headerView.hzs_height = 220;
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSNumber *height = [self.heightArray objectForKey:indexPath];
    if (height) {
        return height.floatValue;
    } else {
        return 150;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSNumber *height = @(cell.frame.size.height);
    [self.heightArray setObject:height forKey:indexPath];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.adviceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HZSMainViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.advice = self.adviceArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HZSWebController *webVc = [[HZSWebController alloc] init];
    HZSAdvice *advice = self.adviceArray[indexPath.row];
    webVc.webUrl = [NSURL URLWithString:advice.webStr];
    [self.navigationController pushViewController:webVc animated:YES];
    

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)initLocation {
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = kCLHeadingFilterNone;
    [self.locationManager requestAlwaysAuthorization];
    [self.locationManager startUpdatingLocation];
    
    [self findMe];
}

- (void)findMe {
    if ([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        NSLog(@"requestAlwaysAuthorization");
        [self.locationManager requestAlwaysAuthorization];
    }
    
    [self.locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    //当前所在城市的坐标值
    CLLocation *currLocation = [locations lastObject];
    
    NSLog(@"经度=%f 纬度=%f 高度=%f", currLocation.coordinate.latitude, currLocation.coordinate.longitude, currLocation.altitude);
    
    //根据经纬度反向地理编译出地址信息
    CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
    
    [geoCoder reverseGeocodeLocation:currLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        if (placemarks.count > 0) {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            
            NSString *city = placemark.locality;
            if (!city) {
                city = placemark.administrativeArea;
            }
            
            self.navigationItem.title = [NSString stringWithFormat:@"%@ · %@", city, placemark.name];
            self.instance.addressStr = [NSString stringWithFormat:@"%@ · %@", city, placemark.name];
            self.instance.address = city;
            
            NSString *weStr = [NSString stringWithFormat:@"%@", city];
            
            [self.weather getWeather:weStr];
            
        } else if (error == nil && [placemarks count] == 0) {
            NSLog(@"No results were returned.");
        } else if (error != nil) {
            NSLog(@"An error occurred = %@", error);
        }
        
    }];
    [self.locationManager stopUpdatingLocation];
}

@end
