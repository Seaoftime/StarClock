//
//  MemberWeatherModel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/14.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MemberDayAndNightModel.h"

#pragma mark 未来七天天气数据模型
/**
 成员数据模型，用于存放未来七天的天气预报
 */
@interface MemberWeatherModel : NSObject

/**
 当前日期
 */
@property (nonatomic,strong) NSString *date;

/**
 星期
 */
@property (nonatomic,strong) NSString *week;

/**
 农历日期
 */
@property (nonatomic,strong) NSString *nongli;

/**
 白天天气情况
 */
@property (nonatomic,strong) MemberDayAndNightModel *dayModel;
/**
 晚上天气情况
 */
@property (nonatomic,strong) MemberDayAndNightModel *nightModel;


@end