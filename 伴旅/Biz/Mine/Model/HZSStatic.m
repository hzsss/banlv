//
//  HZSStatic.m
//  伴旅
//
//  Created by 灿灿 on 2017/12/10.
//  Copyright © 2017年 灿灿. All rights reserved.
//

#import "HZSStatic.h"

@implementation HZSStatic
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)staticWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
