//
//  HZSDynamicGroup.m
//  伴旅
//
//  Created by 灿灿 on 2018/1/2.
//  Copyright © 2018年 灿灿. All rights reserved.
//

#import "HZSDynamicGroup.h"
#import "HZSDynamic.h"

@implementation HZSDynamicGroup
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        
        NSMutableArray *dynamicArray = [NSMutableArray array];
        for (NSDictionary *dict in self.dynamicArray) {
            HZSDynamic *dynamic = [HZSDynamic dynamicWithDict:dict];
            
            [dynamicArray addObject:dynamic];
        }
        self.dynamicArray = dynamicArray;
    }
    return self;
}

+ (instancetype)groupWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
