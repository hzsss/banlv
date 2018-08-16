//
//  HZSLanguage.m
//  伴旅
//
//  Created by 灿灿 on 2017/12/17.
//  Copyright © 2017年 灿灿. All rights reserved.
//

#import "HZSLanguage.h"

@implementation HZSLanguage
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)languageWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
