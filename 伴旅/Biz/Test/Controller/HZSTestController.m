//
//  HZSTestController.m
//  伴旅
//
//  Created by 灿灿 on 2017/12/6.
//  Copyright © 2017年 灿灿. All rights reserved.
//

#import "HZSTestController.h"
#import "HZSPopViewController.h"
#import "Masonry.h"
#import "HZSExamController.h"

@interface HZSTestController ()<UIPopoverPresentationControllerDelegate, HZSPopViewControllerDelegate>
@property (nonatomic, weak) UIButton *languageBtn;
@property (nonatomic, weak) UISegmentedControl *segment;
@property (nonatomic, weak) UIImageView *percentView;
@property (nonatomic, weak) UIButton *testBtn;
@property (nonatomic, weak) UILabel *zeroTime;
@property (nonatomic, weak) UILabel *twentyTime;
@property (nonatomic, weak) UILabel *tenTime;
@property (nonatomic, weak) UILabel *right;
@property (nonatomic, weak) UILabel *wrong;
@property (nonatomic, weak) UILabel *collection;
@property (nonatomic, weak) UILabel *pointLabel;
@property (nonatomic, weak) UILabel *swPercent;
@end

@implementation HZSTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"退出测试" style:UIBarButtonItemStyleDone target:nil action:nil];
    
    [self upset];
}

- (void)upset {
    // 语言按钮
    UIButton *languageBtn = [[UIButton alloc] init];
    [languageBtn setTitle:@"语言" forState:UIControlStateNormal];
    [languageBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [languageBtn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [self.view addSubview:languageBtn];
    self.languageBtn = languageBtn;
    [languageBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = self.languageBtn;
    
    // 难度条
    NSArray *array = [NSArray arrayWithObjects:@"简单", @"中等", @"高级", nil];
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:array];
    segment.tintColor = [UIColor colorWithRed:0 green:166 / 255.0 blue:182 / 255.0 alpha:1];
    [self.view addSubview:segment];
    self.segment = segment;
    
    // 测试按钮
    UIButton *testBtn = [[UIButton alloc] init];
    [testBtn setTitle:@"开始测评" forState:UIControlStateNormal];
    [testBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [testBtn setBackgroundImage:[UIImage imageNamed:@"test_btn"] forState:UIControlStateNormal];
    [testBtn setBackgroundImage:[UIImage imageNamed:@"test_btnHL"] forState:UIControlStateHighlighted];
    [testBtn addTarget:self action:@selector(testBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn];
    self.testBtn = testBtn;
    
    // 百分比
    UIImageView *percentView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test_circle"]];
    [self.view addSubview:percentView];
    self.percentView = percentView;
    
    UILabel *zeroTime = [[UILabel alloc] init];
    [self addLabel:zeroTime title:@"0次"];
    self.zeroTime = zeroTime;
    
    UILabel *twentyTime = [[UILabel alloc] init];
    [self addLabel:twentyTime title:@"20次"];
    self.twentyTime = twentyTime;
    
    UILabel *tenTime = [[UILabel alloc] init];
    [self addLabel:tenTime title:@"10次"];
    self.tenTime = tenTime;
    
    UILabel *right = [[UILabel alloc] init];
    [self addLabel:right title:@"正确次数"];
    self.right = right;
    
    UILabel *wrong = [[UILabel alloc] init];
    [self addLabel:wrong title:@"错误次数"];
    self.wrong = wrong;
    
    UILabel *collection = [[UILabel alloc] init];
    [self addLabel:collection title:@"收藏次数"];
    self.collection = collection;
    
    UILabel *pointLabel = [[UILabel alloc] init];
    NSMutableAttributedString *pointText = [[NSMutableAttributedString alloc] initWithString:@"您本次的评分为：0分"];
    [pointText addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:126 / 255.0 green:126 / 255.0 blue:126 / 255.0 alpha:1] range:NSMakeRange(0, 10)];
    [pointText addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0 / 255.0 green:166 / 255.0 blue:182 / 255.0 alpha:1] range:NSMakeRange(8, 1)];
    pointLabel.attributedText = pointText;
    pointLabel.textAlignment = NSTextAlignmentCenter;
    pointLabel.font = [UIFont systemFontOfSize:26.0];
    [self.view addSubview:pointLabel];
    self.pointLabel = pointLabel;
    
    
    UILabel *swPercent = [[UILabel alloc] init];
    NSMutableAttributedString *swText = [[NSMutableAttributedString alloc] initWithString:@"正确率：0 错误率：100%"];
    [swText addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:126 / 255.0 green:126 / 255.0 blue:126 / 255.0 alpha:1] range:NSMakeRange(0, 14)];
    [swText addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0 / 255.0 green:166 / 255.0 blue:182 / 255.0 alpha:1] range:NSMakeRange(4, 1)];
    [swText addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0 / 255.0 green:166 / 255.0 blue:182 / 255.0 alpha:1] range:NSMakeRange(10, 3)];
    swPercent.attributedText = swText;
    swPercent.textAlignment = NSTextAlignmentCenter;
    swPercent.font = [UIFont systemFontOfSize:18.0];
    [self.view addSubview:swPercent];
    self.swPercent = swPercent;
    
    [self setViewLayout];
}

- (void)testBtnClick {
    HZSExamController *examVc = [[HZSExamController alloc] init];
    [self.navigationController pushViewController:examVc animated:YES];
}

- (void)addLabel:(UILabel *)label title:(NSString *)title {
    label.text = title;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor colorWithRed:189 / 255.0 green:189 / 255.0 blue:189 / 255.0 alpha:1];
    label.font = [UIFont systemFontOfSize:14.0];
    [self.view addSubview:label];
}

- (void)setViewLayout {
    // 难度条
    [self.segment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@316);
        make.height.equalTo(@32);
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).with.offset(100);
    }];
    
    // 测试按钮
    [self.testBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@304);
        make.height.equalTo(@55);
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.swPercent.bottom).with.offset(26);
    }]; 
    
    // 百分比
    [self.percentView makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@164);
        make.height.equalTo(@164);
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.segment.bottom).with.offset(35);
    }];
    
    [self.twentyTime makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@64);
        make.height.equalTo(@15);
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.percentView.bottom).with.offset(26);
    }];
    [self.wrong makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@64);
        make.height.equalTo(@15);
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.twentyTime.bottom).with.offset(10);
    }];
    
    [self.zeroTime makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@64);
        make.height.equalTo(@15);
        make.right.equalTo(self.twentyTime.left).with.offset(-55);
        make.top.equalTo(self.percentView.bottom).with.offset(26);
    }];
    [self.right makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@64);
        make.height.equalTo(@15);
        make.top.equalTo(self.twentyTime.bottom).with.offset(10);
        make.centerX.equalTo(self.zeroTime.centerX);
    }];
    
    [self.tenTime makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@64);
        make.height.equalTo(@15);
        make.left.equalTo(self.twentyTime.right).with.offset(55);
        make.top.equalTo(self.percentView.bottom).with.offset(26);
    }];
    [self.collection makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@64);
        make.height.equalTo(@15);
        make.top.equalTo(self.twentyTime.bottom).with.offset(10);
        make.centerX.equalTo(self.tenTime.centerX);
    }];
    
    [self.pointLabel makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@300);
        make.height.equalTo(@40);
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.wrong.bottom).with.offset(52);
    }];
    
    [self.swPercent makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@240);
        make.height.equalTo(@20);
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.pointLabel.bottom).with.offset(10);
    }];
}

- (void)btnClick:(UIButton *)btn {
    HZSPopViewController *viewVc = [[HZSPopViewController alloc] init];
    viewVc.delegate = self;
    viewVc.preferredContentSize = CGSizeMake(120, 220);
    viewVc.modalPresentationStyle = UIModalPresentationPopover;
    UIPopoverPresentationController *popVc = viewVc.popoverPresentationController;
    popVc.delegate = self;
    popVc.sourceView = self.languageBtn;
    popVc.sourceRect =CGRectMake(btn.hzs_centerX, btn.hzs_height + 8,0, 0);
    popVc.permittedArrowDirections =UIPopoverArrowDirectionUp;
    
    [self presentViewController:viewVc animated:YES completion:nil];
}

-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
    return UIModalPresentationNone; //不适配
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController{
    return YES;   //点击蒙版popover消失， 默认YES
}

- (void)setBtnTitle:(NSString *)title {
    [self.languageBtn setTitle:title forState:UIControlStateNormal];
}

@end
