//
//  HZSExamController.m
//  伴旅
//
//  Created by 灿灿 on 2018/3/31.
//  Copyright © 2018年 灿灿. All rights reserved.
//

#import "HZSExamController.h"
#import "HZSExam.h"
@interface HZSExamController ()
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *labelA;
@property (weak, nonatomic) IBOutlet UILabel *labelB;
@property (weak, nonatomic) IBOutlet UILabel *labelC;
@property (weak, nonatomic) IBOutlet UILabel *lableD;
@property (weak, nonatomic) IBOutlet UIButton *btnA;
@property (weak, nonatomic) IBOutlet UIButton *btnB;
@property (weak, nonatomic) IBOutlet UIButton *btnC;
@property (weak, nonatomic) IBOutlet UIButton *btnD;
@property (nonatomic, strong) NSArray *examArray;
@end

@implementation HZSExamController {
    int i;
}

- (NSArray *)examArray {
    if (!_examArray) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"HZSExam.plist" ofType:nil];
        _examArray = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *dictArray = [NSMutableArray array];
        for (NSDictionary *dict in _examArray) {
            HZSExam *exam = [HZSExam examWithDict:dict];
            [dictArray addObject:exam];
        }
        _examArray = dictArray;
    }
    return _examArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.btnA addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btnB addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btnC addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btnD addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    
    
    i = 0;
    [self setSubView:self.examArray[i]];
}

- (void)next {
    if (i < 9) {
        i++;
        [self setSubView:self.examArray[i]];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)setSubView:(HZSExam *)exam {
    self.questionLabel.text = exam.question;
    self.labelA.text = exam.labelA;
    self.labelB.text = exam.labelB;
    self.labelC.text = exam.labelC;
    self.lableD.text = exam.labelD;
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
