//
//  HZSButton.m
//  伴旅
//
//  Created by 灿灿 on 2017/12/5.
//  Copyright © 2017年 灿灿. All rights reserved.
//

#import "HZSButton.h"

@implementation HZSButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)btnClick:(HZSButton *)btn {
    if (_block) {
        _block(btn);
    }
}

+ (instancetype)createHZSButton {
    return [HZSButton buttonWithType:UIButtonTypeCustom];
}
@end
