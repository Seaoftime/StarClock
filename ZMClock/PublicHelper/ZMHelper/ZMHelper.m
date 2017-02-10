//
//  ZMHelper.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/3.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMHelper.h"


@implementation ZMHelper




static ZMHelper *sharedObject = nil; //第一步：静态实例，并初始化。

+(ZMHelper*)sharedHelp
{
    static dispatch_once_t once;
    dispatch_once(&once,^{
        sharedObject = [[self alloc]init];
    });
    return sharedObject;
}



-(NSString *)localdDateAndTime
{
    // 实例化NSDateFormatter
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 设置日期格式
    [formatter setDateFormat:@"yyyy-MM-dd"];
    // 获取当前日期
    NSDate *localeDate = [NSDate date];
    
    NSString *localString = [formatter stringFromDate:localeDate];
    
    NSLog(@"%@", localString);
    
    
    
    //或者这样写
    //    NSDate *date = [NSDate date];
    //
    //    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    //
    //    NSInteger interval = [zone secondsFromGMTForDate:date];
    //
    //    NSDate *localeDate = [date dateByAddingTimeInterval:interval];
    //
    //    localString = [formatter stringFromDate:localeDate];
    return localString;
}



-(NSString *)localdDateAndTime_year_month_day
{
    // 实例化NSDateFormatter
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 设置日期格式
    [formatter setDateFormat:@"yyyy年MM月dd日"];
    // 获取当前日期
    NSDate *localeDate = [NSDate date];
    
    NSString *localString = [formatter stringFromDate:localeDate];
    
    NSLog(@"%@", localString);
    
    
    
    //或者这样写
    //    NSDate *date = [NSDate date];
    //
    //    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    //
    //    NSInteger interval = [zone secondsFromGMTForDate:date];
    //
    //    NSDate *localeDate = [date dateByAddingTimeInterval:interval];
    //
    //    localString = [formatter stringFromDate:localeDate];
    return localString;
}



-(NSString *)localdDateAndTime_year
{
    // 实例化NSDateFormatter
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 设置日期格式
    [formatter setDateFormat:@"yyyy"];
    // 获取当前日期
    NSDate *localeDate = [NSDate date];
    
    NSString *localString = [formatter stringFromDate:localeDate];
    
    NSLog(@"%@", localString);
    
    
    
    //或者这样写
    //    NSDate *date = [NSDate date];
    //
    //    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    //
    //    NSInteger interval = [zone secondsFromGMTForDate:date];
    //
    //    NSDate *localeDate = [date dateByAddingTimeInterval:interval];
    //
    //    localString = [formatter stringFromDate:localeDate];
    return localString;
}



-(NSString *)localdDateAndTime_month
{
    // 实例化NSDateFormatter
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 设置日期格式
    [formatter setDateFormat:@"MM"];
    // 获取当前日期
    NSDate *localeDate = [NSDate date];
    
    NSString *localString = [formatter stringFromDate:localeDate];
    
    NSLog(@"%@", localString);
    
    
    
    //或者这样写
    //    NSDate *date = [NSDate date];
    //
    //    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    //
    //    NSInteger interval = [zone secondsFromGMTForDate:date];
    //
    //    NSDate *localeDate = [date dateByAddingTimeInterval:interval];
    //
    //    localString = [formatter stringFromDate:localeDate];
    return localString;
}




-(NSString *)localdDateAndTime_day
{
    // 实例化NSDateFormatter
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 设置日期格式
    [formatter setDateFormat:@"dd"];
    // 获取当前日期
    NSDate *localeDate = [NSDate date];
    
    NSString *localString = [formatter stringFromDate:localeDate];
    
    NSLog(@"%@", localString);
    
    
    
    //或者这样写
    //    NSDate *date = [NSDate date];
    //
    //    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    //
    //    NSInteger interval = [zone secondsFromGMTForDate:date];
    //
    //    NSDate *localeDate = [date dateByAddingTimeInterval:interval];
    //
    //    localString = [formatter stringFromDate:localeDate];
    return localString;
}



- (NSString *)localdTime
{
    // 实例化NSDateFormatter
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 设置日期格式
    [formatter setDateFormat:@"HH:mm"];
    // 获取当前日期
    NSDate *localeDate = [NSDate date];
    
    NSString *localString = [formatter stringFromDate:localeDate];
    
    NSLog(@"%@", localString);
    
    
    
    //或者这样写
    //    NSDate *date = [NSDate date];
    //
    //    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    //
    //    NSInteger interval = [zone secondsFromGMTForDate:date];
    //
    //    NSDate *localeDate = [date dateByAddingTimeInterval:interval];
    //
    //    localString = [formatter stringFromDate:localeDate];
    
    
    return localString;
    
    
}

#pragma mark 根据时间字符串转成格式化时间字符串
/**
 根据时间字符串转成格式化时间字符串
 */
-(NSString*)stringFromDateString:(NSString*)dateString
{
    NSDateFormatter *df = [[NSDateFormatter alloc]init];//格式化
    [df setDateFormat:@"MM/dd"];
    
    NSDateFormatter *dff = [[NSDateFormatter alloc]init];
    [dff setDateFormat:@"yyyyMMdd"];
    NSDate *date = [dff dateFromString:dateString];
    dateString = [df stringFromDate:date];
    return dateString;
}



-(NSString*)stringMMddFromDateString:(NSString*)dateString
{
    NSDateFormatter *df = [[NSDateFormatter alloc]init];//格式化
    [df setDateFormat:@"MMdd"];
    
    NSDateFormatter *dff = [[NSDateFormatter alloc]init];
    [dff setDateFormat:@"yyyyMMdd"];
    NSDate *date = [dff dateFromString:dateString];
    dateString = [df stringFromDate:date];
    return dateString;
}

-(NSString *)getLocaldDateAndTime_MMdd
{
    // 实例化NSDateFormatter
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 设置日期格式
    [formatter setDateFormat:@"MMdd"];
    // 获取当前日期
    NSDate *localeDate = [NSDate date];
    
    NSString *localString = [formatter stringFromDate:localeDate];
    
    NSLog(@"%@", localString);
    
    
    
    //或者这样写
    //    NSDate *date = [NSDate date];
    //
    //    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    //
    //    NSInteger interval = [zone secondsFromGMTForDate:date];
    //
    //    NSDate *localeDate = [date dateByAddingTimeInterval:interval];
    //
    //    localString = [formatter stringFromDate:localeDate];
    return localString;
}




#pragma mark  获取本地时间的小时
/**
 获取本地时间的小时
 */
-(NSString *)localdTime_Hour
{
    // 实例化NSDateFormatter
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 设置日期格式
    [formatter setDateFormat:@"HH"];
    // 获取当前日期
    NSDate *localeDate = [NSDate date];
    
    NSString *localString = [formatter stringFromDate:localeDate];

    
    return localString;
}


#pragma mark  获取本地时间的分钟
/**
  获取本地时间的分钟
 */
-(NSString *)localdTime_Minute
{
    // 实例化NSDateFormatter
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 设置日期格式
    [formatter setDateFormat:@"mm"];
    // 获取当前日期
    NSDate *localeDate = [NSDate date];
    
    NSString *localString = [formatter stringFromDate:localeDate];
    
    
    return localString;
}



#pragma mark - 计算“原文””的文本高度
-(CGSize)contentWidthAndHight:(NSString*)content withSpaceWidth:(CGFloat)spaceWidth withFontOfSize:(UIFont*)fontOfSize
{
    //=========得到content的内容高度===========
    NSDictionary *AttriButes = @{NSFontAttributeName:fontOfSize};
    CGSize ContentSize = [content boundingRectWithSize:CGSizeMake(kScreen_Width - spaceWidth, MAXFLOAT)
                                               options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                            attributes:AttriButes
                                               context:nil].size;
    //译文本高度
    return ContentSize;
}




#pragma mark - 
- (NSString *)getIdentifierStr
{
    NSString *identifierStr = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    
    
    return identifierStr;
}


@end
