//
//  HZSMainHeaderView.m
//  伴旅
//
//  Created by 灿灿 on 2017/12/13.
//  Copyright © 2017年 灿灿. All rights reserved.
//

#import "HZSMainHeaderView.h"
#import "HZSSpecButton.h"
#import "Masonry.h"

@interface HZSMainHeaderView()
@property (nonatomic, weak) HZSSpecButton *hotBtn;
@property (nonatomic, weak) HZSSpecButton *eatBtn;
@property (nonatomic, weak) HZSSpecButton *shopBtn;
@property (nonatomic, weak) HZSSpecButton *navigateBtn;
@property (nonatomic, weak) HZSSpecButton *playBtn;
@property (nonatomic, weak) HZSSpecButton *funBtn;
@property (nonatomic, weak) HZSSpecButton *talkBtn;
@property (nonatomic, weak) HZSSpecButton *lifeBtn;
@property (nonatomic, weak) UIView *mView;
@end

@implementation HZSMainHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        HZSSpecButton *hotBtn = [[HZSSpecButton alloc] init];
        [self addBtn:hotBtn Title:@"热门" Image:@"index_hot" ImageHL:@"index_hotHL"];
        self.hotBtn = hotBtn;
        
        HZSSpecButton *eatBtn = [[HZSSpecButton alloc] init];
        [self addBtn:eatBtn Title:@"饮食" Image:@"index_food" ImageHL:@"index_foodHL"];
        self.eatBtn = eatBtn;
        
        HZSSpecButton *shopBtn = [[HZSSpecButton alloc] init];
        [self addBtn:shopBtn Title:@"购物" Image:@"index_shopping" ImageHL:@"index_shoppingHL"];
        self.shopBtn = shopBtn;
        
        HZSSpecButton *navigateBtn = [[HZSSpecButton alloc] init];
        [self addBtn:navigateBtn Title:@"导航" Image:@"index_location" ImageHL:@"index_locationHL"];
        self.navigateBtn = navigateBtn;
        
        HZSSpecButton *playBtn = [[HZSSpecButton alloc] init];
        [self addBtn:playBtn Title:@"游玩" Image:@"index_play" ImageHL:@"index_playHL"];
        self.playBtn = playBtn;
        
        HZSSpecButton *funBtn = [[HZSSpecButton alloc] init];
        [self addBtn:funBtn Title:@"娱乐" Image:@"index_sing" ImageHL:@"index_singHL"];
        self.funBtn = funBtn;
        
        HZSSpecButton *talkBtn = [[HZSSpecButton alloc] init];
        [self addBtn:talkBtn Title:@"对话" Image:@"index_dialog" ImageHL:@"index_dialogHL"];
        self.talkBtn = talkBtn;
        
        HZSSpecButton *lifeBtn = [[HZSSpecButton alloc] init];
        [self addBtn:lifeBtn Title:@"生活" Image:@"index_life" ImageHL:@"index_lifeHL"];
        self.lifeBtn = lifeBtn;
        
        UIView *mView = [[UIView alloc] init];
        mView.backgroundColor = [UIColor colorWithRed:242 / 255.0 green:242 / 255.0 blue:242 / 255.0 alpha:1.0];
        [self addSubview:mView];
        self.mView = mView;
    }
    return self;
}

- (void)addBtn:(HZSSpecButton *)btn Title:(NSString *)title Image:(NSString *)imageName ImageHL:(NSString *)imageHLName {
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:imageHLName] forState:UIControlStateHighlighted];
    [self addSubview:btn];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    int padding = 26.8;
    NSArray *topArray = [self.subviews subarrayWithRange:NSMakeRange(0, 4)];
    NSArray *bottomArray = [self.subviews subarrayWithRange:NSMakeRange(4, 4)];
    
    [topArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:70 leadSpacing:padding tailSpacing:padding];
    [topArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@15);
        make.height.equalTo(@90);
    }];
    
    [bottomArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:70 leadSpacing:padding tailSpacing:padding];
    [bottomArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@120);
        make.height.equalTo(@90);
    }];
    
    [self.mView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.hzs_width);
        make.height.mas_equalTo(@2);
        make.bottom.equalTo(self.bottom);
        make.centerX.equalTo(self);
    }];
}

@end
