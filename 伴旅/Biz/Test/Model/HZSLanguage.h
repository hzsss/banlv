//
//  HZSLanguage.h
//  伴旅
//
//  Created by 灿灿 on 2017/12/17.
//  Copyright © 2017年 灿灿. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZSLanguage : NSObject
@property (nonatomic, copy) NSString *language;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)languageWithDict:(NSDictionary *)dict;
@end
