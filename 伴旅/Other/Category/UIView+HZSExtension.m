//
//  UIView+HZSExtension.m
//  伴旅
//
//  Created by 灿灿 on 2017/12/7.
//  Copyright © 2017年 灿灿. All rights reserved.
//

#import "UIView+HZSExtension.h"

@implementation UIView (HZSExtension)

- (CGSize)hzs_size
{
    return self.frame.size;
}

- (void)setHzs_size:(CGSize)hzs_size
{
    CGRect frame = self.frame;
    frame.size = hzs_size;
    self.frame = frame;
}

- (CGFloat)hzs_width
{
    return self.frame.size.width;
}

- (CGFloat)hzs_height
{
    return self.frame.size.height;
}

- (void)setHzs_width:(CGFloat)hzs_width
{
    CGRect frame = self.frame;
    frame.size.width = hzs_width;
    self.frame = frame;
}

- (void)setHzs_height:(CGFloat)hzs_height
{
    CGRect frame = self.frame;
    frame.size.height = hzs_height;
    self.frame = frame;
}

- (CGFloat)hzs_x
{
    return self.frame.origin.x;
}

- (void)setHzs_x:(CGFloat)hzs_x
{
    CGRect frame = self.frame;
    frame.origin.x = hzs_x;
    self.frame = frame;
}

- (CGFloat)hzs_y
{
    return self.frame.origin.y;
}

- (void)setHzs_y:(CGFloat)hzs_y
{
    CGRect frame = self.frame;
    frame.origin.y = hzs_y;
    self.frame = frame;
}

- (CGFloat)hzs_centerX
{
    return self.center.x;
}

- (void)setHzs_centerX:(CGFloat)hzs_centerX
{
    CGPoint center = self.center;
    center.x = hzs_centerX;
    self.center = center;
}

- (CGFloat)hzs_centerY
{
    return self.center.y;
}

- (void)setHzs_centerY:(CGFloat)hzs_centerY
{
    CGPoint center = self.center;
    center.y = hzs_centerY;
    self.center = center;
}

- (CGFloat)hzs_right
{
    //    return self.xmg_x + self.xmg_width;
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)hzs_bottom
{
    //    return self.xmg_y + self.xmg_height;
    return CGRectGetMaxY(self.frame);
}

- (void)setHzs_right:(CGFloat)hzs_right
{
    self.hzs_x = hzs_right - self.hzs_width;
}

- (void)setHzs_bottom:(CGFloat)hzs_bottom
{
    self.hzs_y = hzs_bottom - self.hzs_height;
}
@end
