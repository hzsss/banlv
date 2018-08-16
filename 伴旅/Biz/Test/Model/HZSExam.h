//
//  HZSExam.h
//  伴旅
//
//  Created by 灿灿 on 2018/3/31.
//  Copyright © 2018年 灿灿. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZSExam : NSObject
@property (nonatomic, copy) NSString *question;
@property (nonatomic, copy) NSString *labelA;
@property (nonatomic, copy) NSString *labelB;
@property (nonatomic, copy) NSString *labelC;
@property (nonatomic, copy) NSString *labelD;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)examWithDict:(NSDictionary *)dict;
@end
