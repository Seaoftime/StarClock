//
//  GuanFangView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/21.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherTableViewCell.h"

@interface GuanFangView : UIView <UITableViewDelegate,UITableViewDataSource>


/**
 官方表格
 */
@property (nonatomic,strong) UITableView *guanfangTableView;

@end
