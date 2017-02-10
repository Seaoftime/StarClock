//
//  WeatherMiddleScrollView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/12.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//  中部几天的天气情况滚动视图
//
#import <UIKit/UIKit.h>
#import "WeatherModel.h"

@interface WeatherMiddleScrollView : UIScrollView


-(void)setWeatherModel:(WeatherModel*)model;

@end
