//
//  MoreProgramModel.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/3.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "MoreProgramModel.h"

@implementation MoreProgramModel


-(void)setProgramWeek:(NSString *)programWeek
{
    if ([programWeek isEqualToString:@"1"])
    {
        _programWeek = @"周一";
    }
    else if ([programWeek isEqualToString:@"2"])
    {
        _programWeek = @"周二";
    }
    else if ([programWeek isEqualToString:@"3"])
    {
        _programWeek = @"周三";
    }
    else if ([programWeek isEqualToString:@"4"])
    {
        _programWeek = @"周四";
    }
    else if ([programWeek isEqualToString:@"5"])
    {
        _programDay = @"周五";
    }
    else if ([programWeek isEqualToString:@"6"])
    {
        _programWeek = @"周六";
    }
    else if ([programWeek isEqualToString:@"7"])
    {
        _programWeek = @"周日";
    }
}

@end
