//
//  HZSLoginController.m
//  伴旅
//
//  Created by 灿灿 on 2017/12/2.
//  Copyright © 2017年 灿灿. All rights reserved.
//

#import "HZSLoginController.h"
#import "HZSRegisterController.h"

@interface HZSLoginController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;

@end

@implementation HZSLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)login:(id)sender {
    EMError *error = [[EMClient sharedClient] logout:YES];
    if (!error) {
        NSLog(@"退出之前的用户成功");
    }
    
    if (self.nameTextField.text.length == 0) {
        [[TKAlertCenter defaultCenter] postAlertWithMessage:@"用户名不能为空"];
        return ;
    }
    
    if (self.pwdTextField.text.length == 0) {
        [[TKAlertCenter defaultCenter] postAlertWithMessage:@"密码不能为空"];
        return ;
    }
    
    [[EMClient sharedClient] loginWithUsername:self.nameTextField.text password:self.pwdTextField.text completion:^(NSString *aUsername, EMError *aError) {
        if (!aError) {
            [self.app loginSuccess];
            
            if ([EMClient sharedClient].options.isAutoLogin == NO) {
                [EMClient sharedClient].options.isAutoLogin = YES;
            }
        } else {
            [[TKAlertCenter defaultCenter] postAlertWithMessage:@"帐号或密码错误"];
        }
    }];
}

- (IBAction)jumpToRegister {
    HZSRegisterController *registerCtr = [[HZSRegisterController alloc] init];
    
    [self presentViewController:registerCtr animated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
@end
