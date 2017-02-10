//
//  WeatherMiddleView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/14.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//  中部滚动视图，主要包含一个滚动视图，里面包含未来几天的天气情况
//
//

#import <UIKit/UIKit.h>
#import "WeatherModel.h"
#import "WeatherMiddleScrollView.h"

@interface WeatherMiddleView : UIView


#pragma mark - 创建天气上面视图中部分视图
/**
 创建天气上面视图中部分控件,包括元素为
 1.当前日期
 2.天气图标
 3.显示温度
 4.风向风力
 */


@property (nonatomic,strong) WeatherMiddleScrollView *weatherMiddleScrollView;


-(instancetype)initWithFrame:(CGRect)frame;


@end
