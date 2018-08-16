//
//  HZSDynamicCell.m
//  伴旅
//
//  Created by 灿灿 on 2018/1/2.
//  Copyright © 2018年 灿灿. All rights reserved.
//

#import "HZSDynamicCell.h"

@implementation HZSDynamicCell

- (void)setDynamic:(HZSDynamic *)dynamic {
    _dynamic = dynamic;
    
    self.contentLabel.text = dynamic.content;
}

@end
