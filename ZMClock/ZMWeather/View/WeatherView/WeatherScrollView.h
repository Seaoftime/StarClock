//
//  WeatherScrollView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/12.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//  天气预报住视图控制器里面的天气的的滚动视图
//
//

#import <UIKit/UIKit.h>
#import "WeatherTopView.h"
#import "WeatherMiddleView.h"
#import "WeatherBottomView.h"
#import "WeatherModel.h"

@interface WeatherScrollView : UIScrollView


@property (nonatomic,strong) WeatherTopView *weatherTopView;
@property (nonatomic,strong) WeatherMiddleView *weatherMiddleView;
@property (nonatomic,strong) WeatherBottomView *weatherBottomView;


-(instancetype)initWithFrame:(CGRect)frame wtthDeletage:(id)deletage;


-(void)setweatherModel:(WeatherModel*)model;


@end
