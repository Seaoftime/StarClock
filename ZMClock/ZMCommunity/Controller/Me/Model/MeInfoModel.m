//
//  MeInfoModel.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/28.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "MeInfoModel.h"

@implementation MeInfoModel

-(void)setSex:(NSString *)sex
{
    if ([sex isEqualToString:@"1"])
    {
        [self setDescribe:@"男"];
        _sex = @"男";
    }
    else if ([sex isEqualToString:@"2"])
    {
        [self setDescribe:@"女"];
        _sex = @"女";
    }
    else
    {
        [self setDescribe:@"男"];
        _sex = @"男";
    }
}

@end
