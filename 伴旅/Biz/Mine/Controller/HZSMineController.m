//
//  HZSMineController.m
//  伴旅
//
//  Created by 灿灿 on 2017/12/6.
//  Copyright © 2017年 灿灿. All rights reserved.
//

#import "HZSMineController.h"
#import "HZSMineHeaderView.h"
#import "HZSStatic.h"
#import "HZSTableViewCell.h"

@interface HZSMineController ()<UITableViewDelegate, UITableViewDataSource, HZSMineHeaderViewDelegate>
@property (nonatomic, strong) NSMutableArray *staticArray;
@property (nonatomic, copy) NSString *path;
@property (nonatomic, strong) AppDelegate *app;

@end

@implementation HZSMineController

- (NSMutableArray *)staticArray {
    NSMutableArray *dictArray = [NSMutableArray array];

    _staticArray = [[NSMutableArray alloc] initWithContentsOfFile:self.path];
    
    for (NSDictionary *dict in _staticArray) {
        HZSStatic *staticP = [HZSStatic staticWithDict:dict];
        [dictArray addObject:staticP];
    }
    _staticArray = dictArray;
    return _staticArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    self.app = app;
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.tableView.scrollEnabled = NO;
    
    self.path = [[NSBundle mainBundle] pathForResource:@"HZSStatic.plist" ofType:nil];
}

- (void)setBtnClick:(HZSButton *)btn {
    self.path = [[NSBundle mainBundle] pathForResource:@"HZSSetStatic.plist" ofType:nil];
    [self.tableView reloadData];
}

- (void)collecteBtnClick:(HZSButton *)btn {
    NSLog(@"%@收藏按钮被点击了", btn);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    HZSMineHeaderView *headerView = [[HZSMineHeaderView alloc] init];
    headerView.delegate = self;
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 272;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.staticArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HZSTableViewCell *cell = [HZSTableViewCell cellWithTableView:tableView];
    cell.staticP = self.staticArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HZSStatic *staticP = self.staticArray[indexPath.row];
    if ([staticP.titleName isEqualToString:@"退出登录"]) {
        [[EMClient sharedClient] logout:YES completion:^(EMError *aError) {
            [self.app logoutSuccess];
        }];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
