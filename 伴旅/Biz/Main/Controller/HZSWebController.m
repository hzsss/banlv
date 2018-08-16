//
//  HZSWebController.m
//  伴旅
//
//  Created by 灿灿 on 2018/3/31.
//  Copyright © 2018年 灿灿. All rights reserved.
//

#import "HZSWebController.h"

@interface HZSWebController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation HZSWebController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:self.webUrl];
    [self.webView loadRequest:request];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.tabBarController.tabBar setHidden:NO];
}

@end
