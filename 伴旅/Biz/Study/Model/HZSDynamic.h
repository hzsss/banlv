//
//  HZSDynamic.h
//  伴旅
//
//  Created by 灿灿 on 2018/1/2.
//  Copyright © 2018年 灿灿. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZSDynamic : NSObject
@property (nonatomic, copy) NSString *content;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)dynamicWithDict:(NSDictionary *)dict;
@end
