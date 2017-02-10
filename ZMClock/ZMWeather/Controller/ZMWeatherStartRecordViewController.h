//
//  ZMWeatherStartRecordViewController.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/22.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//
//  录音操作视图控制器
//
//
//

#import "ZMBaseViewController.h"
#import "WeatherRecordModel.h"

@interface ZMWeatherStartRecordViewController : ZMBaseViewController

/**
 传递数组
 */
@property (nonnull,nonatomic,strong) NSMutableArray *transferArray;

/**
 传递表视图
 */
@property (nonnull,nonatomic,strong) UITableView *transferTableView;

@property (nonatomic,assign) NSInteger indexPath;

@property (nonnull,strong) WeatherRecordModel *recordModel;



@end
