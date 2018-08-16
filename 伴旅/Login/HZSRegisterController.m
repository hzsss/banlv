//
//  HZSRegisterController.m
//  伴旅
//
//  Created by 灿灿 on 2017/12/4.
//  Copyright © 2017年 灿灿. All rights reserved.
//

#import "HZSRegisterController.h"

@interface HZSRegisterController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (nonatomic, assign) CGPoint prePoint;
@property (nonatomic, assign) CGPoint point;


@end

@implementation HZSRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)register:(id)sender {
    if (self.usernameField.text.length == 0) {
        [[TKAlertCenter defaultCenter] postAlertWithMessage:@"用户名不能为空"];
        return ;
    }
    
    if (self.pwdField.text.length == 0) {
        [[TKAlertCenter defaultCenter] postAlertWithMessage:@"密码不能为空"];
        return ;
    }
    
    [[EMClient sharedClient] registerWithUsername:self.usernameField.text password:self.pwdField.text completion:^(NSString *aUsername, EMError *aError) {
        if (!aError) {
            [[TKAlertCenter defaultCenter] postAlertWithMessage:@"注册成功"];
            
            dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC));
            
            dispatch_after(delayTime, dispatch_get_main_queue(), ^{
                [self dismissViewControllerAnimated:YES completion:nil];
            });
            
            
        } else {
            [[TKAlertCenter defaultCenter] postAlertWithMessage:@"注册失败"];
        }
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (IBAction)jumpToLogin {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
