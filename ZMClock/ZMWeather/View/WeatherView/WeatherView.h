//
//  WeatherView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/12.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//  该视图是天气视图的子视图，主要用于拼装各种元素
//
//




typedef NS_ENUM(NSInteger,WeatherLayoutType)
{
    /**
     垂直
     */
    VerticalLayoutType = 1,
    /**
     水平
     */
    HorizontalLayoutType = 2,
};



#import <UIKit/UIKit.h>

@interface WeatherView : UIView

@property (nonatomic,strong) UILabel *topLabel;
@property (nonatomic,strong) UILabel *middleLabel;
@property (nonatomic,strong) UILabel *bottomLabel;
@property (nonatomic,strong) UILabel *bottomTwoLabel;


@property (nonatomic,strong) UIImageView *topImageView;
@property (nonatomic,strong) UIImageView *middleImageView;
@property (nonatomic,strong) UIImageView *bottomImageView;


#pragma mark - 创建天气上面视图上半部分
/**
 创建天气上面视图上半部分,包括元素为
 1.最低温度和最高温度
 2.天气图标
 3.天气说明文字
 4.当前温度
 */
-(instancetype)initWithFrame:(CGRect)frame withTopOneWeatherLayoutType:(WeatherLayoutType)type;

#pragma mark - 创建天气上面视图下半部分控件
/**
 创建天气上面视图下半部分控件,包括元素为
 1.示意图标
 2.说明文字
 3.对应数据
 */
-(instancetype)initWithFrame:(CGRect)frame withTopTwoWeatherLayoutType:(WeatherLayoutType)type;

#pragma mark - 创建天气上面视图中部分控件
/**
 创建天气上面视图中部分控件,包括元素为
 1.当前日期
 2.天气图标
 3.显示温度
 4.风向风力
 */
-(instancetype)initWithFrame:(CGRect)frame withMiddleWeatherLayoutType:(WeatherLayoutType)type;



#pragma mark - 创建天气上面视图下部分控件
/**
 创建天气上面视图下部分控件,包括元素为
 1.示意图标
 2.说明文字
 3.对应数据
 */
-(instancetype)initWithFrame:(CGRect)frame withBottomWeatherLayoutType:(WeatherLayoutType)type;



@end
