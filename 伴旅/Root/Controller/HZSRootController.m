//
//  HZSRootController.m
//  伴旅
//
//  Created by 灿灿 on 2017/12/2.
//  Copyright © 2017年 灿灿. All rights reserved.
//

#import "HZSRootController.h"
#import "AppDelegate.h"

@interface HZSRootController ()

@end

@implementation HZSRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    self.app = app;
}

@end
