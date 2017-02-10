//
//  MemberDayAndNightModel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/14.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>


#pragma mark 存放白天和晚上的数据模型
@interface MemberDayAndNightModel : NSObject

/**
 天气ID，主要用于存放天气图片信息
 */
@property (nonatomic,strong) NSString *weatherId;

/**
 天气信息，如“晴，多云，阴天”等等
 */
@property (nonatomic,strong) NSString *weather;

/**
 温度
 */
@property (nonatomic,strong) NSString *temperature;

/**
 风向
 */
@property (nonatomic,strong) NSString *wind;

/**
 风力
 */
@property (nonatomic,strong) NSString *windPower;



@end
