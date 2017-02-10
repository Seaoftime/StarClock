//
//  ZMHelper.h
//  ZMClock
//
//  Created by ZhongMeng on 16/3/3.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZMHelper : NSObject

+(ZMHelper*)sharedHelp;


#pragma mark - 获取本地日期和时间
/**
 获取本地日期和时间
 */
-(NSString *)localdDateAndTime;

-(NSString *)localdDateAndTime_year_month_day;

/**
 获取当前时间_年
 */
-(NSString *)localdDateAndTime_year;

/**
 获取当前时间_月
 */
-(NSString *)localdDateAndTime_month;

/**
 获取当前时间_日
 */
-(NSString *)localdDateAndTime_day;


#pragma mark  获取本地日期和时间
/**
 获取本地日期和时间
 */
-(NSString *)localdTime;


#pragma mark  获取本地时间的小时
/**
 获取本地日期和时间
 */
-(NSString *)localdTime_Hour;


#pragma mark  获取本地时间的分钟
/**
 获取本地日期和时间
 */
-(NSString *)localdTime_Minute;




#pragma mark 根据时间字符串转成格式化时间字符串
/**
 根据时间字符串转成格式化时间字符串
 */
-(NSString*)stringFromDateString:(NSString*)dateString;

-(NSString*)stringMMddFromDateString:(NSString*)dateString;

/**
 获取当前月日时间
 */
-(NSString *)getLocaldDateAndTime_MMdd;


#pragma mark - 计算“原文””的文本高度
-(CGSize)contentWidthAndHight:(NSString*)content withSpaceWidth:(CGFloat)spaceWidth withFontOfSize:(UIFont*)fontOfSize;







#pragma mark - 新加
- (NSString *)getIdentifierStr;


@end
