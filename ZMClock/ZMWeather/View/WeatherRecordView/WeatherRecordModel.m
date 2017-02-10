//
//  WeatherRecordModel.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/22.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "WeatherRecordModel.h"


/**
 已经录音完毕的背景颜色
 */
#define BlueColor RGB(79.0, 185.0, 255.0)

/**
 可以录音的背景颜色
 */
#define LightYellowColor RGB(255.0, 230.0, 153.0)




@implementation WeatherRecordModel



#pragma mark - 设置录音状态
-(void)setWeatherRecordType:(WeatherRecordType)recordType
{
    _weatherRecordType = recordType;
    switch (recordType)
    {
        case WeatherNoRecordType:
        {
            [self setBackGroundcolor:LightYellowColor];
            [self setRecordStateTypeImage:@"未录音状态"];
        }
            break;
        case WeatherCanRecordType:
        {
            [self setBackGroundcolor:LightYellowColor];
            [self setRecordStateTypeImage:@"未录音状态"];
        }
            break;
        case WeatherRecordDoneType:
        {
            [self setBackGroundcolor:BlueColor];
            [self setRecordStateTypeImage:@"录音完毕状态"];
        }
            break;
    }
}

-(void)setTotal:(NSString *)total
{
    _total = total;
    [self setNumberRatio:[NSString stringWithFormat:@"%@/%@",_number,_total]];
}


@end
