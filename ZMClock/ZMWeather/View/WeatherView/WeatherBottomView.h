//
//  WeatherBottomView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/14.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//
//  天气预报视图底部视图
//  包含下面四个生活指数
//  穿衣、运动、紫外线、感冒四个模块
//
//
//
//
//

#import <UIKit/UIKit.h>
#import "WeatherView.h"
#import "WeatherModel.h"

@interface WeatherBottomView : UIView


#pragma mark - 创建天气上面视图下部分控件视图
/**
 创建天气上面视图下部分控件,包括元素为
 1.示意图标
 2.说明文字
 3.对应数据
 */
@property (nonatomic,strong) UILabel *tipLabel;
@property (nonatomic,strong) WeatherView *topLeftWeatherView;
@property (nonatomic,strong) WeatherView *topRightWeatherView;
@property (nonatomic,strong) WeatherView *bottomLeftWeatherView;
@property (nonatomic,strong) WeatherView *bottomRightWeatherView;


-(instancetype)initWithFrame:(CGRect)frame;

-(void)setWeatherModel:(WeatherModel*)model;

@end
