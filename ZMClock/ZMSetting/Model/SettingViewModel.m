//
//  SettingViewModel.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/2.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "SettingViewModel.h"

@implementation SettingViewModel

-(void)setIsLogin:(BOOL)login
{
    if (login)
    {
        [self setAccessoryType:AccessoryDisclosureIndicator];
    }
    else
    {
        [self setAccessoryType:AccessoryNone];
    }
}


@end
