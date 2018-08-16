//
//  HZSTableViewCell.m
//  伴旅
//
//  Created by 灿灿 on 2017/12/10.
//  Copyright © 2017年 灿灿. All rights reserved.
//

#import "HZSTableViewCell.h"
#import "HZSStatic.h"
@implementation HZSTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"static";
    
    HZSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[HZSTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return cell;
}

- (void)setStaticP:(HZSStatic *)staticP {
    _staticP = staticP;
    
    self.imageView.image = [UIImage imageNamed:staticP.imageName];
    self.textLabel.text = staticP.titleName;
}

@end
