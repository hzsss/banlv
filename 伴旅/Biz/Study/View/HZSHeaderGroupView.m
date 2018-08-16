//
//  HZSHeaderGroupView.m
//  伴旅
//
//  Created by 灿灿 on 2018/1/2.
//  Copyright © 2018年 灿灿. All rights reserved.
//

#import "HZSHeaderGroupView.h"
#import "HZSDynamicGroup.h"
#import "masonry.h"

@interface HZSHeaderGroupView()
@property (nonatomic, weak) UIButton *clickView;
@property (nonatomic, weak) UIImageView *iconView;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *subTitleLabel;
@end

@implementation HZSHeaderGroupView
+ (instancetype)headerViewWithTableView:(UITableView *)tableView {
    static NSString *ID = @"header";
    
    HZSHeaderGroupView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    
    if (!header) {
        header = [[HZSHeaderGroupView alloc] initWithReuseIdentifier:ID];
    }
    
    return header;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        // 添加按钮
        UIButton *clickView = [UIButton buttonWithType:UIButtonTypeCustom];
        // 设置背景图片
        [clickView setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        [clickView setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
        // 设置按钮点击事件
        [clickView addTarget:self action:@selector(nameViewClick) forControlEvents:UIControlEventTouchUpInside];
        // 设置内容左对齐
        clickView.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        // 设置内边距
        clickView.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        clickView.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        // 设置内容模式为居中
        clickView.imageView.contentMode = UIViewContentModeCenter;
        // 不要剪裁
        clickView.imageView.clipsToBounds = NO;
        [self.contentView addSubview:clickView];
        self.clickView = clickView;
        
        // 添加头像
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        
        // 添加姓名
        UILabel *nameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        // 添加类别
        UILabel *subTitleLabel = [[UILabel alloc] init];
        subTitleLabel.font = [UIFont systemFontOfSize:12.0];
        [self.contentView addSubview:subTitleLabel];
        self.subTitleLabel = subTitleLabel;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.nameLabel sizeToFit];
    [self.subTitleLabel sizeToFit];
    
    [self.clickView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.size.equalTo(self);
    }];
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(48, 48));
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.iconView.right).with.offset(15);
    }];
    
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self);
        make.top.equalTo(self).with.offset(30);
        make.right.equalTo(self).with.offset(-30);
    }];
}

- (void)setGroup:(HZSDynamicGroup *)group {
    _group = group;
    self.iconView.image = [UIImage imageNamed:group.icon];
    self.nameLabel.text = group.name;
    self.subTitleLabel.text = group.subTitle;
}

- (void)nameViewClick {
    self.group.opened = !self.group.isOpened;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(headerViewDidClick:)]) {
        [self.delegate headerViewDidClick:self];
    }
}

@end
