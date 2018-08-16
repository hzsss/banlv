//
//  HZSPublishController.m
//  伴旅
//
//  Created by 灿灿 on 2017/12/24.
//  Copyright © 2017年 灿灿. All rights reserved.
//

#import "HZSPublishController.h"
#import "Masonry.h"
#import <pop/POP.h>
#import <CoreLocation/CoreLocation.h>
#import "HZSIntance.h"
#import "HZSWeather.h"

#define ScreenH [UIScreen mainScreen].bounds.size.height
#define ScreenW [UIScreen mainScreen].bounds.size.width

@interface HZSPublishController () {
    BOOL flag;
}
@property (nonatomic, weak) UILabel *timeLabel;
@property (nonatomic, weak) UIButton *closeBtn;
@property (nonatomic, weak) UILabel *weekLabel;
@property (nonatomic, weak) UIView *timeView;
@property (nonatomic, weak) UIView *addressView;
@property (nonatomic, weak) UILabel *addressLabel;
@property (nonatomic, strong) HZSIntance *instance;
@property (nonatomic, weak) UILabel *weatherLabel;
@property (nonatomic, strong) HZSWeather *weather;
@property (nonatomic, weak) HZSButton *publishBtn;
@property (nonatomic, weak) HZSButton *pictureBtn;
@property (nonatomic, weak) HZSButton *emailBtn;
@property (nonatomic, weak) HZSButton *smailBtn;
@property (nonatomic, weak) HZSButton *aiteBtn;

@property (nonatomic, weak) UITextView *textView;
@end

@implementation HZSPublishController

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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSubviews];
}

- (void)setupSubviews {
    // 背景图片
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"publish_bg"]];
    bgView.bounds = self.view.bounds;
    bgView.hzs_centerX = self.view.hzs_centerX;
    bgView.hzs_centerY = self.view.hzs_centerY;
    [self.view addSubview:bgView];
    
    // 定位Label
    UILabel *addressLabel = [[UILabel alloc] init];
    addressLabel.text = self.instance.addressStr;
    addressLabel.textColor = [UIColor colorWithRed:87 / 255.0 green:87 / 255.0 blue:87 / 255.0 alpha:1.0];
    addressLabel.font = [UIFont systemFontOfSize:12.0];
    self.addressLabel = addressLabel;
    
    // 天气Label
    UILabel *weatherLabel = [[UILabel alloc] init];
    weatherLabel.text = self.weather.weatherStr;
    weatherLabel.textColor = [UIColor colorWithRed:87 / 255.0 green:87 / 255.0 blue:87 / 255.0 alpha:1.0];
    weatherLabel.font = [UIFont systemFontOfSize:12.0];
    self.weatherLabel = weatherLabel;
    
    // 定位view
    UIView *addressView = [[UIView alloc] init];
    [addressView addSubview:addressLabel];
    [addressView addSubview:weatherLabel];
    [self.view addSubview:addressView];
    self.addressView = addressView;
    
    // 时间lable
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.attributedText = [self currentDateStr];
    timeLabel.textColor = [UIColor colorWithRed:87 / 255.0 green:87 / 255.0 blue:87 / 255.0 alpha:1.0];
    self.timeLabel = timeLabel;
    
    [self.timeLabel sizeToFit];
    CGRect frame = self.timeLabel.frame;
    frame.origin = CGPointMake(0, 0);
    self.timeLabel.frame = frame;
    
    // 星期lebel
    UILabel *weekLabel = [[UILabel alloc] init];
    weekLabel.text = [self currentWeekStr];
    weekLabel.textColor = [UIColor colorWithRed:87 / 255.0 green:87 / 255.0 blue:87 / 255.0 alpha:1.0];
    weekLabel.font = [UIFont systemFontOfSize:12.0];
    self.weekLabel = weekLabel;
    
    [self.weekLabel sizeToFit];
    CGRect frame1 = self.weekLabel.frame;
    frame1.origin = CGPointMake(62, 11);
    self.weekLabel.frame = frame1;
    
    // 时间view
    UIView *timeView = [[UIView alloc] init];
    [timeView addSubview:timeLabel];
    [timeView addSubview:weekLabel];
    [self.view addSubview:timeView];
    self.timeView = timeView;
    
    // 发送按钮
    HZSButton *publishBtn = [[HZSButton alloc] init];
    [publishBtn setTitle:@"发布" forState:UIControlStateNormal];
    [publishBtn setTintColor:[UIColor whiteColor]];
    [publishBtn setBackgroundImage:[UIImage imageNamed:@"test_btn"] forState:UIControlStateNormal];
    [publishBtn setBackgroundImage:[UIImage imageNamed:@"test_btnHL"] forState:UIControlStateHighlighted];
    [publishBtn addTarget:self action:@selector(publishString) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:publishBtn];
    self.publishBtn = publishBtn;
    
    // 关闭按钮
    flag = YES;
    UIButton *closeBtn = [[UIButton alloc] init];
    [closeBtn setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [self.view addSubview:closeBtn];
    self.closeBtn = closeBtn;
    
    [closeBtn addTarget:self action:@selector(rotate) forControlEvents:UIControlEventTouchUpInside];
    
    // 四个小按钮
    NSArray *images = @[@"publish_picture", @"publish_email", @"publish_smile", @"publish_aite"];
    CGFloat btnW = 24;
    CGFloat btnH = 24;
    
    for (int i=0; i<images.count; i++) {
        HZSButton *btn = [[HZSButton alloc] init];
        btn.tag = i;
        [self.view addSubview:btn];
        
        [btn setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        
        CGFloat space = (ScreenW - images.count * btnW) / (images.count + 1);
        CGFloat btnX = i * btnW + (i + 1) * space;
        CGFloat btnEndY = 500;
        CGFloat btnBeginY = 500 + ScreenW;
        
        [self popView:btn fromRect:CGRectMake(btnX, btnBeginY, btnW, btnH) toRect:CGRectMake(btnX, btnEndY, btnW, btnH)];
    }
    
    // 输入框
    UITextView *textView = [[UITextView alloc] init];
    [self.view addSubview:textView];
    self.textView = textView;
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
//    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self.view);
//        make.top.equalTo(self.view).with.offset(170);
//        make.width.equalTo(self.view);
//        make.height.equalTo(@250);
//    }];
    
    self.textView.hzs_centerX = self.view.hzs_centerX;
    self.textView.hzs_height = 250;
    self.textView.hzs_width = self.view.hzs_width;
    
    [self popView:self.textView fromRect:CGRectMake(self.textView.hzs_x, 170 - ScreenH, self.textView.hzs_width, self.textView.hzs_height) toRect:CGRectMake(self.textView.hzs_x, 170, self.textView.hzs_width, self.textView.hzs_height)];
    
    [self.addressLabel sizeToFit];
    CGRect frame0 = self.addressLabel.frame;
    frame0.origin = CGPointMake(0, 11);
    self.addressLabel.frame = frame0;
    
    [self.weatherLabel sizeToFit];
    CGRect frame3 = self.weatherLabel.frame;
    frame3.origin = CGPointMake(0, 36);
    self.weatherLabel.frame = frame3;
    
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@20);
        make.height.equalTo(@20);
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view.bottom).with.offset(-30);
    }];
    
    CGFloat timeX = 30;
    CGFloat timeW = self.timeLabel.hzs_width;
    
    [self popView:self.timeView fromRect:CGRectMake(timeX, 100 - ScreenH, timeW, 0) toRect:CGRectMake(timeX, 100, timeW, 50)];
    
    CGFloat addressX = ScreenW - timeX - self.addressLabel.hzs_width;
    CGFloat addressW = self.addressLabel.hzs_width;
    
    [self popView:self.addressView fromRect:CGRectMake(addressX, 100 - ScreenH, addressW, 0) toRect:CGRectMake(addressX, 100, addressW, 50)];
    
    self.publishBtn.hzs_size = CGSizeMake(300, 48);
    self.publishBtn.hzs_centerX = self.view.hzs_centerX;
    
    [self popView:self.publishBtn fromRect:CGRectMake(self.publishBtn.hzs_x, 550 + ScreenH, self.publishBtn.hzs_width, self.publishBtn.hzs_height) toRect:CGRectMake(self.publishBtn.hzs_x, 550, self.publishBtn.hzs_width, self.publishBtn.hzs_height)];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (flag) {
        [UIView animateWithDuration:0.3 animations:^{
            self.closeBtn.transform = CGAffineTransformMakeRotation(M_PI_4);
        } completion:^(BOOL finished) {
            flag = NO;
        }];
    }
}

- (void)publishString {
    NSLog(@"发布%@", self.textView.text);
}

- (void)rotate {
    if (flag == NO) {
        [UIView animateWithDuration:0.3 animations:^{
            self.closeBtn.transform = CGAffineTransformMakeRotation(0);
        } completion:^(BOOL finished) {
            flag = YES;
            [self dismissViewControllerAnimated:NO completion:nil];
        }];
    }
}

- (void)popView:(UIView *)view fromRect:(CGRect)fromRect toRect:(CGRect)toRect {
    POPSpringAnimation * anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    anim.fromValue = [NSValue valueWithCGRect:fromRect];
    anim.toValue = [NSValue valueWithCGRect:toRect];
    anim.springBounciness = 8; //springBounciness为弹簧弹力 取值范围为【0，20】， 默认为4
    anim.springSpeed = 10; //springSpeed为弹簧速度 速度越快 动画时间越短 取值范围[0,20], 默认为12 和springBounciness一起决定弹簧动画效果
    anim.beginTime = CACurrentMediaTime(); // 动画开始的时间 每个按钮的时间不同 通过这个时间来设置按钮出现的顺序
    [view pop_addAnimation:anim forKey:nil];
    [anim setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        // 动画执行完毕 恢复点击事件
        self.view.userInteractionEnabled = YES;
    }];
}

- (NSMutableAttributedString *)currentDateStr{
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];// 创建一个时间格式化对象
    [dateFormatter setDateFormat:@"dd MM/YYYY"];//设定时间格式,这里可以设置成自己需要的格式
    NSString *dateString = [dateFormatter stringFromDate:currentDate];//将时间转化成字符串
    
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:dateString];
    [attributeStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:50.0] range:NSMakeRange(0, 2)];
    [attributeStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12.0] range:NSMakeRange(2, 8)];
  
    return attributeStr;
}

- (NSString *)currentWeekStr {
    NSDateComponents *comps = [[NSCalendar autoupdatingCurrentCalendar] components:NSCalendarUnitWeekday fromDate:[NSDate date]];
    NSInteger weekday = [comps weekday];
    NSString *dateStr = [[NSString alloc] init];
    
    switch (weekday) {
        case 1:
            dateStr = @"星期天";
            break;
        case 2:
            dateStr = @"星期一";
            break;
        case 3:
            dateStr = @"星期二";
            break;
        case 4:
            dateStr = @"星期三";
            break;
        case 5:
            dateStr = @"星期四";
            break;
        case 6:
            dateStr = @"星期五";
            break;
        case 7:
            dateStr = @"星期六";
            break;
        default:
            break;
    }
    
    return dateStr;
}


@end
