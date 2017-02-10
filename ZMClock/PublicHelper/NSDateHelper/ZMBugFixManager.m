//
//  ZMBugFixManager.m
//  ZMClock
//
//  Created by ZhongMeng on 16/7/20.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMBugFixManager.h"
#import "NSDate+convenience.h"
#import "NSDate+Helper.h"

@implementation ZMBugFixManager

+ (ZMBugFixManager *)sharedFixManager
{
    static ZMBugFixManager *fixManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        fixManager = [[ZMBugFixManager alloc] init];
    });
    
    return fixManager;
}



//一个星期之后显示
- (BOOL)afterOneWeekShow
{
    BOOL afterOneWeek;
    NSDate *curDate = [NSDate date];
    
    if (curDate.year == 2016 &&
        curDate.month == 8 &&
        curDate.day < 3 ) {
        
        afterOneWeek = NO;//2016年8月3号以前没数据
        
    }else{
        
        afterOneWeek = YES;//
    }
    return afterOneWeek;
    
}


//具体某一天显示
- (BOOL)oneDayShow
{
    BOOL oneDay;
    NSDate *curDate = [NSDate date];
    if (curDate.year != 2016 ||
        curDate.month != 7 ||
        curDate.day < 19 ||
        curDate.day > 21) {
        
        oneDay = NO;
    }else{
        oneDay = YES;
    }
    return oneDay;
    
}


@end
