//
//  ZMBaseeNavigationViewController.h
//  ZMClock
//
//  Created by ZhongMeng on 16/8/30.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZMGameBaseViewController.h"

@interface ZMBaseeNavigationViewController : ZMGameBaseViewController


@property (nonatomic, strong) UIImageView *topHeadImggV;
@property (nonatomic, strong) UILabel *titleeLb;


///返回
- (void)dismissBtnnClicked;

- (void)setupTopV;

@end
