//
//  HZSDynamic.m
//  伴旅
//
//  Created by 灿灿 on 2018/1/2.
//  Copyright © 2018年 灿灿. All rights reserved.
//

#import "HZSDynamic.h"

@implementation HZSDynamic
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)dynamicWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
