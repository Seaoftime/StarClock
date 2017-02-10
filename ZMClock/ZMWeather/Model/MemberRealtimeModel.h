//
//  MemberRealtimeModel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/14.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark 实时天气数据模型
/**
 成员数据模型，用于存放实时天气预报
 */
@interface MemberRealtimeModel : NSObject

@property (nonatomic,strong) NSString *city_code;
@property (nonatomic,strong) NSString *city_name;
@property (nonatomic,strong) NSString *date;
@property (nonatomic,strong) NSString *time;
@property (nonatomic,strong) NSString *week;
@property (nonatomic,strong) NSString *moon;
@property (nonatomic,strong) NSString *dataUptime;


#pragma 实时天气信息 - weather
/**
 
 */
@property (nonatomic,strong) NSString *weather_temperature; //!< 当前气温
@property (nonatomic,strong) NSString *weather_humidity; //!< 空气湿度
@property (nonatomic,strong) NSString *weather_info;
@property (nonatomic,strong) NSString *weather_img;


#pragma 实时天气的风力、风向信息 - wind
@property (nonatomic,strong) NSString *wind_direct;   //!< 风向
@property (nonatomic,strong) NSString *wind_power;  //!< 风力
@property (nonatomic,strong) NSString *wind_offset;
@property (nonatomic,strong) NSString *wind_windspeed;

@end

