//
//  HZSWeather.h
//  伴旅
//
//  Created by 灿灿 on 2017/12/26.
//  Copyright © 2017年 灿灿. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZSWeather : NSObject
@property (nonatomic, strong) NSString *weatherStr;

+ (instancetype)shareWeather;
- (void)getWeather:(NSString *)location;
@end
