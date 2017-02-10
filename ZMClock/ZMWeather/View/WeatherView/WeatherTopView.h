//
//  WeatherPartView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/12.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//




#import <UIKit/UIKit.h>
#import "ZMView.h"
#import "WeatherView.h"
#import "WeatherModel.h"
#import "WeatherMiddleScrollView.h"





@interface WeatherTopView : UIView


#pragma mark - 创建天气上面视图



/**
 最低温度视图
 */
@property (nonatomic,strong) ZMView *leftTemperatureView;

/**
 当前天气清情况图片
 */
@property (nonatomic,strong) UIImageView *middleImageView;

/**
 最高温度视图
 */
@property (nonatomic,strong) ZMView *rightTemperatureView;

/**
 显示当前天气“晴转小雪”和温度视图
 */
@property (nonatomic,strong) ZMView *weatherExplainLabel;




/**
 空气湿度视图
 */
@property (nonatomic,strong) WeatherView *humidityWeatherView;
/**
 风力情况视图
 */
@property (nonatomic,strong) WeatherView *windWeatherView;
/**
 空气污染程度视图
 */
@property (nonatomic,strong) WeatherView *pm25WeatherView;

/**
 创建天气上面视图上半部分,包括元素为
 1.最低温度和最高温度
 2.天气图标
 3.天气说明文字
 4.当前温度
 */
-(instancetype)initWithFrame:(CGRect)frame;



#pragma mark 填充数据模型
-(void)setWeatherModel:(WeatherModel*)model;



@end
