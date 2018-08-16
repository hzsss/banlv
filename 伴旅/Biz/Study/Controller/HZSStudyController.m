//
//  HZSStudyController.m
//  伴旅
//
//  Created by 灿灿 on 2017/12/6.
//  Copyright © 2017年 灿灿. All rights reserved.
//

#import "HZSStudyController.h"
#import "HZSDynamicGroup.h"
#import "HZSDynamicCell.h"
#import "HZSDynamic.h"
#import "HZSHeaderGroupView.h"

@interface HZSStudyController ()<HZSHeaderGroupViewDelegate>
@property (nonatomic, strong) NSArray *groups;
@end

@implementation HZSStudyController

- (NSArray *)groups {
    if (!_groups) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"HZSDynamic.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *groupArray = [NSMutableArray array];
        
        for (NSDictionary *dict in dictArray) {
            HZSDynamicGroup *group = [HZSDynamicGroup groupWithDict:dict];
            [groupArray addObject:group];
        }
        _groups = groupArray;
    }
    return _groups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.sectionHeaderHeight = 64;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"HZSDynamicCell" bundle:nil] forCellReuseIdentifier:@"cell"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    HZSDynamicGroup *group = self.groups[section];
    
    return (group.isOpened ? group.dynamicArray.count : 0);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HZSDynamicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    HZSDynamicGroup *group = self.groups[indexPath.section];
    HZSDynamic *dynamic = group.dynamicArray[indexPath.row];
    cell.dynamic = dynamic;
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    HZSHeaderGroupView *header = [HZSHeaderGroupView headerViewWithTableView:tableView];
    
    header.delegate = self;
    
    header.group = self.groups[section];
    
    return header;
}

- (void)headerViewDidClick:(HZSHeaderGroupView *)headerView {
    [self.tableView reloadData];
}
@end
