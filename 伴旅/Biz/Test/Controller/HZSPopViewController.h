//
//  HZSPopViewController.h
//  伴旅
//
//  Created by 灿灿 on 2017/12/15.
//  Copyright © 2017年 灿灿. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HZSPopViewControllerDelegate<NSObject>
- (void)setBtnTitle:(NSString *)title;
@end

@interface HZSPopViewController : UIViewController
@property (nonatomic, weak) id<HZSPopViewControllerDelegate> delegate;
@end
