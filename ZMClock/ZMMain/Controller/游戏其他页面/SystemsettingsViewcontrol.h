//
//  SystemsettingsViewcontrol.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/30.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//以及版本号
//退出程序控制器
//
//
//
//
//
#import "ZMGameBaseViewController.h"


#import "ZMBaseeNavigationViewController.h"


@interface SystemsettingsViewcontrol : ZMBaseeNavigationViewController


@property (nonatomic,strong) UITableView *gameSettingTableView1; //!< 游戏设置表视图
@property (nonatomic,strong) NSMutableArray *gameSettingArray; //!< 游戏设置表视图
@property(nonatomic ,strong)UIButton *button;

@end
