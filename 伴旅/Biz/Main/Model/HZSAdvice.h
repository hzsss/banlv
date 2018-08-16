//
//  HZSAdvice.h
//  伴旅
//
//  Created by 灿灿 on 2017/12/31.
//  Copyright © 2017年 灿灿. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZSAdvice : NSObject
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *picView;
@property (nonatomic, copy) NSString *webStr;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)adviceWithDict:(NSDictionary *)dict;
@end
