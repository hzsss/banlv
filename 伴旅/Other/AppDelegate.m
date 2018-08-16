//
//  AppDelegate.m
//  伴旅
//
//  Created by 灿灿 on 2017/12/2.
//  Copyright © 2017年 灿灿. All rights reserved.
//

#import "AppDelegate.h"
#import "HZSRootController.h"
#import "HZSRootNavigationController.h"
#import "HZSLoginController.h"

#import "HZSMainController.h"
#import "HZSMainNavController.h"
#import "HZSTestNavController.h"
#import "HZSTestController.h"
#import "HZSStudyController.h"
#import "HZSStudyNavController.h"
#import "HZSMineController.h"
#import "HZSMineNavController.h"
#import "HZSTabBar.h"
#import "HZSPublishController.h"
#import <CoreLocation/CoreLocation.h>


@interface AppDelegate ()<EMClientDelegate,CLLocationManagerDelegate>
@property (nonatomic, strong) HZSLoginController *logCtr;
@property (nonatomic, strong) UITabBarController *tabbarCtr;
@property (nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    HZSLoginController *logCtr = [[HZSLoginController alloc] init];
    
    self.window.rootViewController = logCtr;
    [self.window makeKeyAndVisible];
    
    self.logCtr = logCtr;

    
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setBackgroundImage:[UIImage imageNamed:@"navBg"] forBarMetrics:UIBarMetricsDefault];
    
    EMOptions *options = [EMOptions optionsWithAppkey:@"1121171205115973#banlv"];

    EMError *error = [[EMClient sharedClient] initializeSDKWithOptions:options];
    
    if (!error) {
        NSLog(@"登录成功");
    } else {
        NSLog(@"登录失败");
    }
    
    [[EMClient sharedClient] addDelegate:self delegateQueue:nil];
    
    if ([[EMClient sharedClient].options isAutoLogin]) {
        [MBProgressHUD showMessag:@"自动登录" toView:self.window];
    }
    
    return YES;
}

- (void)loginSuccess {
    UITabBarController *tabbarCtr = [[UITabBarController alloc] init];
    
    self.tabbarCtr = tabbarCtr;
    
    HZSTabBar *tabBar = [[HZSTabBar alloc] init];
    
    [tabbarCtr setValue:tabBar forKey:@"tabBar"];
    
    [self setupControllers];
    
    self.window.rootViewController = tabbarCtr;
    
    [self.window makeKeyAndVisible];
    
    [[TKAlertCenter defaultCenter] postAlertWithMessage:@"登录成功"];
}

- (void)logoutSuccess {
    self.window.rootViewController = self.logCtr;
    [[TKAlertCenter defaultCenter] postAlertWithMessage:@"退出登录成功"];
    [EMClient sharedClient].options.isAutoLogin = NO;
    [self.window makeKeyAndVisible];
}


- (void)autoLoginDidCompleteWithError:(EMError *)aError {
    if (!aError) {
        [MBProgressHUD hideAllHUDsForView:self.window animated:YES];
        [self loginSuccess];
    }
}

- (void)setupControllers {
    HZSMainController *mainCtr = [[HZSMainController alloc] init];
    HZSMainNavController *mainNav = [[HZSMainNavController alloc] initWithRootViewController:mainCtr];
    [self setupChildViewController:mainNav WithTitle:@"首页" Image:@"index" SelectedImage:@"indexHL"];
    
    HZSTestController *testCtr = [[HZSTestController alloc] init];
    HZSTestNavController *testNav = [[HZSTestNavController alloc] initWithRootViewController:testCtr];
    [self setupChildViewController:testNav WithTitle:@"测试" Image:@"test" SelectedImage:@"testHL"];
    
    HZSStudyController *studyCtr = [[HZSStudyController alloc] init];
    HZSStudyNavController *studyNav = [[HZSStudyNavController alloc] initWithRootViewController:studyCtr];
    [self setupChildViewController:studyNav WithTitle:@"学习" Image:@"study" SelectedImage:@"studyHL"];
    
    HZSMineController *mineCtr = [[HZSMineController alloc] init];
    HZSMineNavController *mineNav = [[HZSMineNavController alloc] initWithRootViewController:mineCtr];
    [self setupChildViewController:mineNav WithTitle:@"我的" Image:@"my" SelectedImage:@"myHL"];
}

- (void)setupChildViewController:(UIViewController *)controller WithTitle:(NSString *)title Image:(NSString *)image SelectedImage:(NSString *)selectedImage {
    controller.tabBarItem.image = [UIImage imageNamed:image];
    controller.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    [self controller:controller Title:title];
    [self.tabbarCtr addChildViewController:controller];
}

- (void)controller:(UIViewController *)controller Title:(NSString *)title {
    controller.tabBarItem.title = title;
    
    NSDictionary *normalTitle = [NSDictionary dictionaryWithObject:[UIColor colorWithRed:219 / 255.0 green:219 / 255.0 blue:219 / 255.0 alpha:1] forKey:NSForegroundColorAttributeName];
    [controller.tabBarItem setTitleTextAttributes:normalTitle forState:UIControlStateNormal];
    
    NSDictionary *selectedTitle = [NSDictionary dictionaryWithObject:[UIColor colorWithRed:0 / 255.0 green:166 / 255.0 blue:181 / 255.0 alpha:1.0] forKey:NSForegroundColorAttributeName];
    [controller.tabBarItem setTitleTextAttributes:selectedTitle forState:UIControlStateSelected];
}

- (void)applicationWillResignActive:(UIApplication *)application {
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[EMClient sharedClient] applicationDidEnterBackground:application];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    [[EMClient sharedClient] applicationWillEnterForeground:application];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
