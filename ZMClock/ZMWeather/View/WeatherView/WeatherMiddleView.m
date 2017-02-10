//
//  WeatherMiddleView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/14.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "WeatherMiddleView.h"

@implementation WeatherMiddleView


#pragma mark - 创建天气上面视图中部分视图
/**
 创建天气上面视图中部分控件,包括元素为
 1.当前日期
 2.天气图标
 3.显示温度
 4.风向风力
 */
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addSubview:self.weatherMiddleScrollView];
    }
    return self;
}


-(WeatherMiddleScrollView*)weatherMiddleScrollView
{
    if (_weatherMiddleScrollView == nil)
    {
        _weatherMiddleScrollView = [[WeatherMiddleScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 150)];
    }
    return _weatherMiddleScrollView;
}


@end
