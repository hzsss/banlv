//
//  HZSSpecButton.m
//  伴旅
//
//  Created by 灿灿 on 2017/12/7.
//  Copyright © 2017年 灿灿. All rights reserved.
//

#import "HZSSpecButton.h"

@implementation HZSSpecButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:13.0];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageView.hzs_y = 0;
    self.imageView.hzs_centerX = self.hzs_width * 0.5;
//    self.imageView.hzs_height = 16;
//    self.imageView.hzs_width = 16;
    [self.imageView sizeToFit];
    
    self.titleLabel.hzs_x = 0;
    self.titleLabel.hzs_y = self.imageView.hzs_bottom;
    self.titleLabel.hzs_height = self.hzs_height - self.titleLabel.hzs_y;
    self.titleLabel.hzs_width = self.hzs_width;
    self.titleLabel.textColor = [UIColor blackColor];
}

@end
