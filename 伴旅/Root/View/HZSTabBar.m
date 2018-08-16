//
//  HZSTabBar.m
//  伴旅
//
//  Created by 灿灿 on 2017/12/6.
//  Copyright © 2017年 灿灿. All rights reserved.
//

#import "HZSTabBar.h"
#import "HZSPublishController.h"

@interface HZSTabBar()
@property (nonatomic, weak) UIButton *publishButton;
@end

@implementation HZSTabBar

- (UIButton *)publishButton
{
    if (!_publishButton) {
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
        [publishButton setImage:[UIImage imageNamed:@"add"] forState:UIControlStateHighlighted];
        [publishButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:publishButton];
        _publishButton = publishButton;
    }
    return _publishButton;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundImage = [UIImage imageNamed:@"tabbar-light"];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat buttonW = self.hzs_width / 5;
    CGFloat buttonH = self.hzs_height;
    
    CGFloat tabBarButtonY = 0;
    
    int tabBarButtonIndex = 0;
    
    for (UIView *subView in self.subviews) {
        if (subView.class != NSClassFromString(@"UITabBarButton")) continue;
        
        CGFloat tabBarButtonX = tabBarButtonIndex * buttonW;
        
        if (tabBarButtonIndex >= 2) {
            tabBarButtonX += buttonW;
        }
        subView.frame = CGRectMake(tabBarButtonX, tabBarButtonY, buttonW, buttonH);
        
        tabBarButtonIndex++;
    }
    self.publishButton.hzs_width = buttonW;
    self.publishButton.hzs_height = buttonH;
    self.publishButton.hzs_centerX = self.hzs_width * 0.5;
    self.publishButton.hzs_centerY = self.hzs_height * 0.3;
    
    
}

- (void)publishClick {
    HZSPublishController *publishCtr = [[HZSPublishController alloc] init];
    
    UIViewController *rootViewCtr = [UIApplication sharedApplication].keyWindow.rootViewController;
    
//    rootViewCtr.definesPresentationContext = YES;
//    publishCtr.view.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:4];
    publishCtr.modalTransitionStyle = UIModalPresentationNone;
    
    [rootViewCtr presentViewController:publishCtr animated:NO completion:nil];
}

@end
