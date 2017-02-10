//
//  WeatherModel.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/14.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "WeatherModel.h"

@implementation WeatherModel


-(MemberLifeModel *)lifeModel
{
    if (_lifeModel == nil)
    {
        _lifeModel = [[MemberLifeModel alloc]init];
    }
    return _lifeModel;
}


-(MemberPM25Model *)pm25Model
{
    if (_pm25Model == nil)
    {
        _pm25Model = [[MemberPM25Model alloc]init];
    }
    return _pm25Model;
}



-(MemberRealtimeModel *)realtimeModel
{
    if (_realtimeModel == nil)
    {
        _realtimeModel = [[MemberRealtimeModel alloc]init];
    }
    return _realtimeModel;
}



-(NSMutableArray*)weatherArray
{
    if (_weatherArray == nil)
    {
        _weatherArray = [NSMutableArray array];
    }
    return _weatherArray;
}
@end

