//
//  HZSHeaderGroupView.h
//  伴旅
//
//  Created by 灿灿 on 2018/1/2.
//  Copyright © 2018年 灿灿. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HZSDynamicGroup, HZSHeaderGroupView;
@protocol HZSHeaderGroupViewDelegate <NSObject>
@optional
- (void)headerViewDidClick:(HZSHeaderGroupView *)headerView;
@end

@interface HZSHeaderGroupView : UITableViewHeaderFooterView
@property (nonatomic, strong) HZSDynamicGroup *group;
@property (nonatomic, weak) id<HZSHeaderGroupViewDelegate> delegate;
+ (instancetype)headerViewWithTableView:(UITableView *)tableView;
@end
