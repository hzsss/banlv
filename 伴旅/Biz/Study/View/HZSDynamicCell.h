//
//  HZSDynamicCell.h
//  伴旅
//
//  Created by 灿灿 on 2018/1/2.
//  Copyright © 2018年 灿灿. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HZSDynamic.h"

@interface HZSDynamicCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (nonatomic, strong) HZSDynamic *dynamic;
@end
