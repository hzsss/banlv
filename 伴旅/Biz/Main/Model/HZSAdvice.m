//
//  HZSAdvice.m
//  伴旅
//
//  Created by 灿灿 on 2017/12/31.
//  Copyright © 2017年 灿灿. All rights reserved.
//

#import "HZSAdvice.h"

@implementation HZSAdvice
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)adviceWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
