//
//  ZMTabBarController.h
//  ZMClock
//
//  Created by ZhongMeng on 16/3/1.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarView.h"
#import "ZMMainViewController.h"
#import "ZMClockViewController.h"
#import "ZMCommunityViewController.h"
#import "ZMSettingViewController.h"

@interface ZMTabBarController : UITabBarController <TabBarButtonViewDeletage>

@property (nonatomic,strong) TabBarView *TabBarButtonView;
@property (nonatomic,strong) ZMMainViewController  *MainViewController;
@property (nonatomic,strong) ZMClockViewController *ClockViewController;
@property (nonatomic,strong) ZMCommunityViewController *CommunityViewController;
@property (nonatomic,strong) ZMSettingViewController *SettingViewController;


-(void)TabBarViewHidden:(BOOL)Hidden;

@end
