//
//  WeatherRecordModel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/22.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//


typedef NS_ENUM(NSInteger,WeatherRecordType)
{
    /**
     未录音
     */
    WeatherNoRecordType = 0,
    
    /**
     可以录音
     */
    WeatherCanRecordType = 1,
    
    /**
     已经录音完成
     */
    WeatherRecordDoneType = 2,
};

#import <Foundation/Foundation.h>

@interface WeatherRecordModel : NSObject

/**
 一定先填充当前个数，然后在填充总共个数
 */
@property (nonatomic,strong) NSString *number;
@property (nonatomic,strong) NSString *total;
@property (nonatomic,strong) NSString *numberRatio;
@property (nonatomic,strong) NSString *recordContent;

/**
 根据不同的状态显示不同的背景颜色
 */
@property (nonatomic,strong) UIColor *backGroundcolor;

/**
 根据不同的状态显示不同的录音状态图片
 */
@property (nonatomic,strong) NSString *recordStateTypeImage;

@property (nonatomic,assign) WeatherRecordType weatherRecordType;

@end
