//
//  HZSMineHeaderView.m
//  伴旅
//
//  Created by 灿灿 on 2017/12/7.
//  Copyright © 2017年 灿灿. All rights reserved.
//

#import "HZSMineHeaderView.h"
#import "Masonry.h"
#import "HZSSpecButton.h"

@interface HZSMineHeaderView()

@property (nonatomic, weak) UIImageView *bgView;
@property (nonatomic, weak) HZSSpecButton *setBtn;
@property (nonatomic, weak) HZSSpecButton *collectBtn;
@property (nonatomic, weak) UIView *mView;
@end


@implementation HZSMineHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"myBg"]];
        [self addSubview:bgView];
        self.bgView = bgView;
        
        HZSButton *iconView = [[HZSButton alloc] init];
        [iconView setBackgroundImage:[UIImage imageNamed:@"tx"] forState:UIControlStateNormal];
        [self addSubview:iconView];
        self.iconView = iconView;
        
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.textColor = [UIColor whiteColor];
        nameLabel.text = @"SunJia";
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        HZSSpecButton *setBtn = [[HZSSpecButton alloc] init];
        [setBtn setTitle:@"设置" forState:UIControlStateNormal];
        [setBtn setImage:[UIImage imageNamed:@"setting"] forState:UIControlStateNormal];
        [setBtn setImage:[UIImage imageNamed:@"settingHL"] forState:UIControlStateHighlighted];
        setBtn.block = ^(HZSButton *btn) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(setBtnClick:)]) {
                [self.delegate setBtnClick:btn];
            }
        };
        [self addSubview:setBtn];
        self.setBtn = setBtn;
        
        HZSSpecButton *collectBtn = [[HZSSpecButton alloc] init];
        [collectBtn setTitle:@"收藏" forState:UIControlStateNormal];
        [collectBtn setImage:[UIImage imageNamed:@"collection"] forState:UIControlStateNormal];
        [collectBtn setImage:[UIImage imageNamed:@"collectionHL"] forState:UIControlStateHighlighted];
        collectBtn.block = ^(HZSButton *btn) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(collecteBtnClick:)]) {
                [self.delegate collecteBtnClick:btn];
            }
        };
        [self addSubview:collectBtn];
        self.collectBtn = collectBtn;
        
        UIView *mView = [[UIView alloc] init];
        mView.backgroundColor = [UIColor colorWithRed:242 / 255.0 green:242 / 255.0 blue:242 / 255.0 alpha:1.0];
        [self addSubview:mView];
        self.mView = mView;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 背景约束
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(-20);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.mas_equalTo(@246);
    }];
    
    // 头像约束
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).with.offset(72);
        make.width.mas_equalTo(@100);
        make.height.mas_equalTo(@100);
    }];
    
    // 昵称约束
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.iconView.mas_bottom).with.offset(10);
    }];
    
    // 设置按钮约束
    [self.setBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@48);
        make.height.mas_equalTo(@48);
        make.top.equalTo(self).with.offset(200);
        make.left.equalTo(self).with.offset(40);
    }];
    
    // 收藏按钮约束
    [self.collectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@48);
        make.height.mas_equalTo(@48);
        make.top.equalTo(self).with.offset(200);
        make.right.equalTo(self).with.offset(-40);
    }];
    
    // 间隔约束
    [self.mView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.hzs_width);
        make.height.mas_equalTo(@6);
        make.bottom.equalTo(self.bottom);
        make.centerX.equalTo(self);
        
    }];
}

@end
