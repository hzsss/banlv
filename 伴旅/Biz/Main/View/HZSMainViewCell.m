//
//  HZSMainViewCell.m
//  伴旅
//
//  Created by 灿灿 on 2017/12/31.
//  Copyright © 2017年 灿灿. All rights reserved.
//

#import "HZSMainViewCell.h"

@implementation HZSMainViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setAdvice:(HZSAdvice *)advice {
    _advice = advice;
    
    self.icon.image = [UIImage imageNamed:advice.icon];
    self.content.text = advice.content;
    self.picView.image = [UIImage imageNamed:advice.picView];
}
@end
