//
//  NSDate+convenience.m
//
//  Created by in 't Veen Tjeerd on 4/23/12.
//  Copyright (c) 2012 Vurig Media. All rights reserved.
//

#import "NSDate+convenience.h"

@implementation NSDate (Convenience)

-(int)year {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:NSYearCalendarUnit fromDate:self];
    return (int)[components year];
}


-(int)month {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:NSMonthCalendarUnit fromDate:self];
    return (int)[components month];
}

-(int)day {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:NSDayCalendarUnit fromDate:self];
    return (int)[components day];
}

-(int)firstWeekDayInMonth {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    [gregorian setFirstWeekday:2]; //monday is first day
    //[gregorian setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"nl_NL"]];
    
    //Set date to first of month
    NSDateComponents *comps = [gregorian components:NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit fromDate:self];
    [comps setDay:1];
    NSDate *newDate = [gregorian dateFromComponents:comps];

    return (int)[gregorian ordinalityOfUnit:NSWeekdayCalendarUnit inUnit:NSWeekCalendarUnit forDate:newDate];
}
-(NSDate *)offsetYear:(int)numYears{
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setYear:numYears];
    //[offsetComponents setHour:1];
    //[offsetComponents setMinute:30];
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:self options:0];
}
-(NSDate *)offsetMonth:(int)numMonths {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    [gregorian setFirstWeekday:2]; //monday is first day
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setMonth:numMonths];
    //[offsetComponents setHour:1];
    //[offsetComponents setMinute:30];
    return [gregorian dateByAddingComponents:offsetComponents
                                                   toDate:self options:0];
}

-(NSDate *)offsetHours:(int)hours {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    [gregorian setFirstWeekday:2]; //monday is first day
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    //[offsetComponents setMonth:numMonths];
    [offsetComponents setHour:hours];
    //[offsetComponents setMinute:30];
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:self options:0];
}

-(NSDate *)offsetDay:(int)numDays {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    [gregorian setFirstWeekday:2]; //monday is first day
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setDay:numDays];
    //[offsetComponents setHour:1];
    //[offsetComponents setMinute:30];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:self options:0];
}



-(int)numDaysInMonth {
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSRange rng = [cal rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:self];
    NSUInteger numberOfDaysInMonth = rng.length;
    return (int)numberOfDaysInMonth;
}



- (NSString*)timeStamp
{
    NSDateFormatter *fomatter = [[NSDateFormatter alloc] init];
    [fomatter setDateFormat:@"yyyyMMddHHmmss"];
    return [fomatter stringFromDate:self];
}


-(NSDate*)hourandminute { //只保留小时和分钟
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"HH:mm"];
    NSString *str = [format stringFromDate:self];
    return [format dateFromString:str];
}



-(NSDate*)judgeAndSetToNextDay{ //先将date转换为今天，然后判断date是否已经过了当前时间，如果过了就设为下一天
    NSDate *date;
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd"];
    NSString *str = [format stringFromDate:[NSDate date]];
    [format setDateFormat:@"yyyy-MM-dd HH:mm"];
    date = [format dateFromString:[NSString stringWithFormat:@"%@ %@",str,[self DateToHHmm]]];
    if ([[NSDate date] compare:date] != NSOrderedAscending) {
        date = [date setToNextDay];
    }
    return date;
}
- (NSDate*)setToNextDay{
    return [self dateByAddingTimeInterval:DayToSec];
}

- (NSString*)DateToHHmm{ //24小时制
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"HH:mm"];
    return [format stringFromDate:self];
}
- (NSString*)DateTohhmm{ //12小时制
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"hh:mm"];
    [format setLocale:[NSLocale systemLocale]];
    return [format stringFromDate:self];
}


- (int)weekdayyy//返回的是周几
{
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *components = [gregorian components:NSCalendarUnitWeekday fromDate:self];
    
    int weekday = (int)[components weekday];
    
    return weekday-1 == 0?7:weekday-1;
}

- (NSDate *)judgeAndSetToNextWeekkk{ //先将date转换为今天，然后判断date是否已经过了当前时间，如果过了就设为下一周
    NSDate *date;
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd"];
    NSString *str = [format stringFromDate:[NSDate date]];
    [format setDateFormat:@"yyyy-MM-dd HH:mm"];
    date = [format dateFromString:[NSString stringWithFormat:@"%@ %@",str,[self DateToHHmm]]];
    if ([[NSDate date] compare:date] != NSOrderedAscending) {
        date = [date setToNextWeekk];
    }
    return date;
}



- (NSDate *)setToNextWeekk{ //先把日期转换到今天，然后加上 1周的时间
    return [self dateByAddingTimeInterval:WeekTosec];
}




- (int)dateHour {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:NSCalendarUnitHour fromDate:self];
    return [components hour];
}


+(NSDate *)dateStartOfDay:(NSDate *)date {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *components =
    [gregorian components:(NSYearCalendarUnit | NSMonthCalendarUnit |
                           NSDayCalendarUnit) fromDate: date];
    return [gregorian dateFromComponents:components];
}

+(NSDate *)dateStartOfWeek {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    [gregorian setFirstWeekday:2]; //monday is first day
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSWeekdayCalendarUnit fromDate:[NSDate date]];

    NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
    [componentsToSubtract setDay: - ((([components weekday] - [gregorian firstWeekday])
                                      + 7 ) % 7)];
    NSDate *beginningOfWeek = [gregorian dateByAddingComponents:componentsToSubtract toDate:[NSDate date] options:0];
    
    NSDateComponents *componentsStripped = [gregorian components: (NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit)
                                                fromDate: beginningOfWeek];
    
    //gestript
    beginningOfWeek = [gregorian dateFromComponents: componentsStripped];
    
    return beginningOfWeek;
}

+(NSDate *)dateEndOfWeek {
    NSCalendar *gregorian =[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSWeekdayCalendarUnit fromDate:[NSDate date]];
    
    
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setDay: + (((([components weekday] - [gregorian firstWeekday])
                                      + 7 ) % 7))+6];
    NSDate *endOfWeek = [gregorian dateByAddingComponents:componentsToAdd toDate:[NSDate date] options:0];
    
    NSDateComponents *componentsStripped = [gregorian components: (NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit)
                                                       fromDate: endOfWeek];
    
    //gestript
    endOfWeek = [gregorian dateFromComponents: componentsStripped];
    return endOfWeek;
}
@end
