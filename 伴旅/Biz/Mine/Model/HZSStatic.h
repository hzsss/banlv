//
//  HZSStatic.h
//  伴旅
//
//  Created by 灿灿 on 2017/12/10.
//  Copyright © 2017年 灿灿. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZSStatic : NSObject
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *titleName;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)staticWithDict:(NSDictionary *)dict;
@end
