//
//  HZSButton.h
//  伴旅
//
//  Created by 灿灿 on 2017/12/5.
//  Copyright © 2017年 灿灿. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HZSButton;
typedef void(^HZSButtonClickBlock)(HZSButton *);

@interface HZSButton : UIButton
@property (nonatomic, copy) HZSButtonClickBlock block;
+ (instancetype)createHZSButton;
@end
