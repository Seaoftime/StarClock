//
//  NSDate+convenience.h
//
//  Created by in 't Veen Tjeerd on 4/23/12.
//  Copyright (c) 2012 Vurig Media. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Convenience)

-(NSDate *)offsetYear:(int)numYears;
-(NSDate *)offsetMonth:(int)numMonths;
-(NSDate *)offsetDay:(int)numDays;
-(NSDate *)offsetHours:(int)hours;
-(int)numDaysInMonth;
-(int)firstWeekDayInMonth;
-(int)year;
-(int)month;
-(int)day;

- (int)weekdayyy;//返回的是周几
-(NSString*)timeStamp;
-(NSDate *)hourandminute;
-(NSDate *)judgeAndSetToNextWeekkk;
-(NSDate *)setToNextWeekk;
-(NSDate *)judgeAndSetToNextDay;
-(NSDate *)setToNextDay;
-(int)dateHour;
- (NSString*)DateTohhmm;



+(NSDate *)dateStartOfDay:(NSDate *)date;
+(NSDate *)dateStartOfWeek;
+(NSDate *)dateEndOfWeek;



@end
