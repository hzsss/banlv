//
//  HZSExam.m
//  伴旅
//
//  Created by 灿灿 on 2018/3/31.
//  Copyright © 2018年 灿灿. All rights reserved.
//

#import "HZSExam.h"

@implementation HZSExam
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)examWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
