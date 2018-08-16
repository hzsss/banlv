//
//  HZSWeather.m
//  伴旅
//
//  Created by 灿灿 on 2017/12/26.
//  Copyright © 2017年 灿灿. All rights reserved.
//

#import "HZSWeather.h"
static HZSWeather *weather;

@implementation HZSWeather

+ (instancetype)shareWeather {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        weather = [[[self class] alloc] init];
        weather.weatherStr = [[NSString alloc] init];
    });
    
    return weather;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        weather = [super allocWithZone:zone];
    });
    return weather;
}

- (void)getWeather:(NSString *)location {
    NSString *path = [NSString stringWithFormat:@"https://free-api.heweather.com/s6/weather/now?location=%@&key=3f770bd0e9304107a9d677648c6f389f", location];
    
    path = [path stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"#%^{}\"[]|\\<> "].invertedSet];
    
    NSURL *url = [NSURL URLWithString:path];
    NSURLSession *session = [NSURLSession sharedSession];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (!error) {
                 NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                
                NSDictionary *dict2 = dict[@"HeWeather6"][0];
                self.weatherStr = [NSString stringWithFormat:@"%@ %@℃", dict2[@"now"][@"cond_txt"], dict2[@"now"][@"tmp"]];
                
            } else {
                NSLog(@"---%@", error);
            }
            
        }];
        
        [dataTask resume];
    });
}
@end
