//
//  HZSMineHeaderView.h
//  伴旅
//
//  Created by 灿灿 on 2017/12/7.
//  Copyright © 2017年 灿灿. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HZSButton;
@protocol HZSMineHeaderViewDelegate <NSObject>
- (void)setBtnClick:(HZSButton *)btn;
- (void)collecteBtnClick:(HZSButton *)btn;
@end

@interface HZSMineHeaderView : UIView
@property (nonatomic, weak) HZSButton *iconView; // 头像
@property (nonatomic, weak) UILabel *nameLabel; // 昵称
@property (nonatomic, weak) id<HZSMineHeaderViewDelegate> delegate;
@end
