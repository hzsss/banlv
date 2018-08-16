//
//  HZSIntance.m
//  伴旅
//
//  Created by 灿灿 on 2017/12/26.
//  Copyright © 2017年 灿灿. All rights reserved.
//

#import "HZSIntance.h"

static HZSIntance *instance = nil;

@implementation HZSIntance
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[self class] alloc] init];
        instance.addressStr = [[NSString alloc] init];
        instance.address = [[NSString alloc] init];
    });
    
    return instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone:zone];
    });
    return instance;
}
@end
