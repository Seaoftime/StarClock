//
//  ConstellationModel.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/26.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ConstellationModel.h"

@implementation ConstellationModel

-(void)setDate:(NSString *)date
{
    _date = [[ZMHelper sharedHelp] stringFromDateString:date];
}



-(void)setAll:(NSString *)all
{
    all = [all stringByReplacingOccurrencesOfString:@"%" withString:@""];
    float all_float = [all floatValue];
    all_float = all_float/10.0;
    all_float = round(all_float)/10.0;
    _all = [NSString stringWithFormat:@"%.1f",all_float];
}

-(void)setHealth:(NSString *)health
{
    _health = health;
}


-(void)setLove:(NSString *)love
{
    _love = [love stringByReplacingOccurrencesOfString:@"%" withString:@""];
    float all_float = [love floatValue];
    all_float = all_float/10.0;
    all_float = round(all_float)/10.0;
    _love = [NSString stringWithFormat:@"%.1f",all_float];
}

-(void)setMoney:(NSString *)money
{
    
    _money = [money stringByReplacingOccurrencesOfString:@"%" withString:@""];
    float money_float = [money floatValue];
    money_float = money_float/10.0;
    money_float = round(money_float)/10.0;
    _money = [NSString stringWithFormat:@"%.1f",money_float];
}


-(void)setWork:(NSString *)work
{
    _work = [work stringByReplacingOccurrencesOfString:@"%" withString:@""];
    float work_float = [work floatValue];
    work_float = work_float/10.0;
    work_float = round(work_float)/10.0;
    _work = [NSString stringWithFormat:@"%.1f",work_float];
}


/**
 在填充星座名字的时候，根据日期判断一下当前的星座
 */
-(void)setName:(NSString *)name
{
    _name = name;
    
    
    NSString *now = [[ZMHelper sharedHelp] getLocaldDateAndTime_MMdd];
    
    NSInteger now_integer = [now integerValue];
    
    if (now_integer >= 120 && now_integer <= 218)
    {
        //水瓶座
        if ([name isEqualToString:@"水瓶座"])
        {
            [self setIsMark:YES];
        }
        
    }
    if (now_integer >= 219 && now_integer <= 320)
    {
        //双鱼座
        if ([name isEqualToString:@"双鱼座"])
        {
            [self setIsMark:YES];
        }
    }
    else if (now_integer >= 321 && now_integer <= 419)
    {
        //白羊座
        if ([name isEqualToString:@"白羊座"])
        {
            [self setIsMark:YES];
        }
    }
    else if (now_integer >= 420 && now_integer <= 520)
    {
        //金牛座
        if ([name isEqualToString:@"金牛座"])
        {
            [self setIsMark:YES];
        }
    }
    else if (now_integer >= 521 && now_integer <= 621)
    {
        //双子座
        if ([name isEqualToString:@"双子座"])
        {
            [self setIsMark:YES];
        }
    }
    else if (now_integer >= 622 && now_integer <= 722)
    {
        //巨蟹座
        if ([name isEqualToString:@"巨蟹座"])
        {
            [self setIsMark:YES];
        }
    }
    else if (now_integer >= 723 && now_integer <= 822)
    {
        //狮子座
        if ([name isEqualToString:@"狮子座"])
        {
            [self setIsMark:YES];
        }
    }
    else if (now_integer >= 823 && now_integer <= 922)
    {
        //处女座
        if ([name isEqualToString:@"处女座"])
        {
            [self setIsMark:YES];
        }
    }
    else if (now_integer >= 923 && now_integer <= 1023)
    {
        //天秤座
        if ([name isEqualToString:@"天秤座"])
        {
            [self setIsMark:YES];
        }
    }
    else if (now_integer >= 1024 && now_integer <= 1122)
    {
        //天蝎座
        if ([name isEqualToString:@"天蝎座"])
        {
            [self setIsMark:YES];
        }
    }
    else if (now_integer >=1123 && now_integer <= 1221)
    {
        //射手座
        if ([name isEqualToString:@"射手座"])
        {
            [self setIsMark:YES];
        }
    }
    else if (now_integer >= 1222 || now_integer <= 119)
    {
        //魔蝎座
        if ([name isEqualToString:@"摩羯座"])
        {
            [self setIsMark:YES];
        }
    }
    
    
}

@end
