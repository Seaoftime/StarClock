//
//  WeatherHelper.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/15.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MemberWeatherModel.h"

@interface WeatherHelper : NSObject

+(WeatherHelper*)sharedWeatherHelper;




#pragma mark - ----- 获取当前小时时间
/**
 获取当前日期和时间
 */
-(NSString*)getHourTime;


#pragma mark - ----- 获取当前日期
/**
 获取当前日期和时间
 */
-(NSString*)getDate;

-(UIImage *)getWeatherImageWithWeatherModel:(MemberWeatherModel*)model;


@end
