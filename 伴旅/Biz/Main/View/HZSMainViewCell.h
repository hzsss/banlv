//
//  HZSMainViewCell.h
//  伴旅
//
//  Created by 灿灿 on 2017/12/31.
//  Copyright © 2017年 灿灿. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HZSAdvice.h"
@interface HZSMainViewCell : UITableViewCell
@property (nonatomic, strong) HZSAdvice *advice;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UIImageView *picView;
//@property (nonatomic, copy) NSString *webStr;
@end
