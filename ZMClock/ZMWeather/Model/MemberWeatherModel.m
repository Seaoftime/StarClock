//
//  MemberWeatherModel.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/14.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "MemberWeatherModel.h"

@implementation MemberWeatherModel





-(void)setDate:(NSString *)date
{
    NSArray *dateArray = [date componentsSeparatedByString:@"-"];
    
    
    if (dateArray.count == 0) {
        //
    }else {
    
//        if ([[[WeatherHelper sharedWeatherHelper] getDate] isEqualToString:date])
//        {
//            _date = [NSString stringWithFormat:@"今天 (%@/%@)",dateArray[1],dateArray[2]];
//        }
//        else
//        {
//            _date = [NSString stringWithFormat:@"周%@ (%@/%@)",self.week,dateArray[1],dateArray[2]];
//        }

    
    
    }
    

}




-(MemberDayAndNightModel*)dayModel
{
    if (_dayModel == nil)
    {
        _dayModel = [[MemberDayAndNightModel alloc]init];
    }
    return _dayModel;
}


-(MemberDayAndNightModel *)nightModel
{
    if (_nightModel == nil)
    {
        _nightModel = [[MemberDayAndNightModel alloc]init];
    }
    return _nightModel;
}

@end
