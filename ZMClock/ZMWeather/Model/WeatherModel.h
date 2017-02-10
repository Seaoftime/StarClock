//
//  WeatherModel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/14.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MemberLifeModel.h"
#import "MemberPM25Model.h"
#import "MemberWeatherModel.h"
#import "MemberRealtimeModel.h"


#pragma mark 总的数据模型
/**
 总的数据数据模型
 */
@interface WeatherModel : NSObject




/**
 生活指数 数据模型
 */
@property (nonatomic,strong) MemberLifeModel *lifeModel;


/**
 PM2.5天气数据模型
 */
@property (nonatomic,strong) MemberPM25Model *pm25Model;


/**
 实时天气数据模型
 */
@property (nonatomic,strong) MemberRealtimeModel *realtimeModel;


/**
 存放未来七天天气预报数组
 */
@property (nonatomic,strong) NSMutableArray *weatherArray;



@end
