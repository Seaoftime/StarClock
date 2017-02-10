//
//  ZMStartRecordViewController.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/12.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//  开始录音界面
//

#import "ZMBaseViewController.h"

@interface ZMClockStartRecordViewController : ZMBaseViewController

/**
 传递数组
 */
@property (nonatomic,strong) NSMutableArray *transferArray;


/**
 传递表视图
 */
@property (nonatomic,strong) UITableView *transferTableView;

@property (nonatomic,assign) NSInteger indexPath;

/**
 录音数据模型
 */
@property (nonatomic,strong) WeatherRecordModel *recordModel;


@end
