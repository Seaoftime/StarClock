//
//  MoreProgramFrame.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/4.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "MoreProgramFrame.h"

@implementation MoreProgramFrame


-(void)setModel:(MoreProgramModel *)model
{
    _model = model;
    
    
    switch (model.moreProgramModelType)
    {
#pragma mark MoreProgramInfoType
        case MoreProgramInfoType:
        {
            [self setDateLabelFrame:CGRectMake(30, 10, kScreen_Width-40, 20)];
            [self setTitleLabelFrame:CGRectMake(30, 45, kScreen_Width-40, 15)];
            [self setLocalctionViewFrame:CGRectMake(30, 80, 80, 15)];
            [self setTimeViewFrame:CGRectMake(120, 80, 80, 15)];
            [self setMoreProgramViewFrame:CGRectMake(0, 75, kScreen_Width, 100)];
    
            [self setCellHight:100];
        }
            break;
#pragma mark MoreProgramInfoType
        case MoreProgramBriefType:
        {
            [self setDayLabelFrame:CGRectMake(0, 10, 60, 20)];
            [self setWeekLabelFrame:CGRectMake(0, 35, 60, 15)];
            [self setTitleLabelFrame:CGRectMake(70, 10, kScreen_Width-80, 15)];
            [self setLocalctionViewFrame:CGRectMake(170, 35, 80, 15)];
            [self setTimeViewFrame:CGRectMake(70, 35, 80, 15)];
            [self setLineViewFrame:CGRectMake(0, 68, kScreen_Width, 2)];
            
            [self setMoreProgramViewFrame:CGRectMake(0, 0, kScreen_Width, 70)];
            
            [self setCellHight:70];
        }
            break;
    }
}


@end
