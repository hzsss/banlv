//
//  HZSTableViewCell.h
//  伴旅
//
//  Created by 灿灿 on 2017/12/10.
//  Copyright © 2017年 灿灿. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HZSStatic;
@interface HZSTableViewCell : UITableViewCell
@property (nonatomic, strong) HZSStatic *staticP;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
