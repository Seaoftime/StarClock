//
//  TopHeaderControl.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/16.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TopHeaderControl : UIControl
@property (nonatomic,strong) UILabel *dateTimeLabel; //!<时间标签
@property (nonatomic,strong) UILabel *dateTimeLabel2;
@property (nonatomic,strong) UILabel *dateTimeLabel3;

@property (nonatomic,strong) UILabel *temperatureLabel; //!<天气标签
@property (nonatomic,strong) UIImageView *weatherImageView; //!<天气标签

/**
 初始化闹钟
 */
-(instancetype)initClock;
-(void)resetClockFrame:(CGRect)frame;




/**
 初始化天气
 */
-(instancetype)initWeather;
-(void)resetWeatherFrame:(CGRect)frame;


@end
