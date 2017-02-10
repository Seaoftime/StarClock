//
//  SettingTableViewCell.h
//  ZMClock
//
//  Created by ZhongMeng on 16/3/2.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMTableViewCell.h"
#import "SettingViewModel.h"
#import "SettingHeaderView.h"


@interface SettingTableViewCell : ZMTableViewCell


@property (nonatomic,strong) SettingViewModel *model;

@property (nonatomic,strong) SettingHeaderView *headerView;


@end
