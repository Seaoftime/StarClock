//
//  WeatherHelper.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/15.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "WeatherHelper.h"

@implementation WeatherHelper


static WeatherHelper *sharedHelper = nil; //第一步：静态实例，并初始化。

+(WeatherHelper*)sharedWeatherHelper
{
    static dispatch_once_t once;
    
    dispatch_once(&once,^{
        
        sharedHelper = [[self alloc]init];
        
    });
    
    return sharedHelper;
}


-(UIImage *)getWeatherImageWithWeatherModel:(MemberWeatherModel*)model
{
    
    NSString *result = nil;
    NSString *bundlePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:@"Weather.bundle"];
    //如果当前时间大于18点，小于6点说明已经到了晚上了，就显示晚上的图标
    if ([[sharedHelper getHourTime]intValue] > 18 || [[sharedHelper getHourTime] intValue] < 6)
    {
        bundlePath = [bundlePath stringByAppendingPathComponent:@"night"];
        NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
        result = [bundle pathForResource:model.nightModel.weatherId ofType:@"png"];
    }
    //如果当前时间大于6点，小于18点说明已经到了白天了，就显示白天的图标
    else if ([[sharedHelper getHourTime]intValue] <= 18 || [[sharedHelper getHourTime] intValue] >= 6)
    {
        bundlePath = [bundlePath stringByAppendingPathComponent:@"day"];
        NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
        result = [bundle pathForResource:model.nightModel.weatherId ofType:@"png"];
    }
    
    UIImage *image = [UIImage imageNamed:result];
    if (!image)
    {
        image = [UIImage imageNamed:@"undefined"];
    }
    return image;
}



#pragma mark - ----- 获取当前小时时间
/**
 获取当前日期和时间
 */
-(NSString*)getHourTime
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    //指定输出的格式   这里格式必须是和上面定义字符串的格式相同，否则输出空
    [formatter setDateFormat:@"HH"];
    NSString *timeString= [formatter stringFromDate:[NSDate date]];
    return timeString;
}



#pragma mark - ----- 获取当前日期
/**
 获取当前日期和时间
 */
-(NSString*)getDate
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    //指定输出的格式   这里格式必须是和上面定义字符串的格式相同，否则输出空
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *timeString= [formatter stringFromDate:[NSDate date]];
    return timeString;
}


@end
