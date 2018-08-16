//
//  HZSDynamicGroup.h
//  伴旅
//
//  Created by 灿灿 on 2018/1/2.
//  Copyright © 2018年 灿灿. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZSDynamicGroup : NSObject
@property (nonatomic, strong) NSArray *dynamicArray;
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, assign, getter=isOpened) BOOL opened;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)groupWithDict:(NSDictionary *)dict;

@end
