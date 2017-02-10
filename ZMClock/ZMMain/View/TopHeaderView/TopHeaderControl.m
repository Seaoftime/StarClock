//
//  TopHeaderControl.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/16.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "TopHeaderControl.h"

////////////////

#import "UIColor_Random.h"
#import "ZMClockViewController.h"
#import "ZMWeatherViewController.h"
#import "ZMConstellationViewController.h"
#import "ZMCommunityTabBarController.h"
#import "ZMGameSettingViewController.h"
#import "GameView.h"
#import "GameAlertView.h"
#import "GameItemTypeModel.h"
#import "GameItemsModel.h"
#import "ZMLocationAndWeather.h"
#import "WeatherModel.h"
#import "ZMGuideImageView.h"
#import "TopHeaderView.h"
#import "LeftHelperControl.h"
#import "AVAudioPlayerHelper.h"


@implementation TopHeaderControl


#pragma mark - Getter / Setter时间 Label 加载到 top 视图上
-(instancetype)initClock
{
    self = [super init];
    if (self)
    {
        [self addSubview:self.dateTimeLabel];
        [self addSubview:self.dateTimeLabel2];
        [self addSubview:self.dateTimeLabel3];
        
        [self setBackColor:NO];
        
    }
    return self;
}

#pragma mark - Getter / Setter背景 Label颜色
-(void)setBackColor:(BOOL)backgroundColor
{
    if (backgroundColor)
    {
        [self setBackgroundColor:[UIColor redColor]];
        [self.dateTimeLabel setBackgroundColor:[UIColor purpleColor]];
        [self.temperatureLabel setBackgroundColor:[UIColor orangeColor]];
        [self.weatherImageView setBackgroundColor:[UIColor yellowColor]];
    }
    
}

#pragma mark - Getter / Setter时间 Label 设置位置

-(void)resetClockFrame:(CGRect)frame
{
    [self setFrame:frame];
    [self.dateTimeLabel setFrame:CGRectMake(10, 20, frame.size.width-10, frame.size.height-20)];
    
    [self setFrame:frame];
   
    [self.dateTimeLabel2 setFrame:CGRectMake(95, 20, frame.size.width-10, frame.size.height-40)];
    [self setFrame:frame];
    
    [self.dateTimeLabel3 setFrame:CGRectMake(95, 38, frame.size.width-10, frame.size.height-40)];


    
   
    
       
    
    
    
    
    
    
}






-(instancetype)initWeather
{
    self = [super init];
    if (self)
    {
        [self setBackColor:NO];
        
        
        [self addSubview:self.temperatureLabel];
        [self addSubview:self.weatherImageView];
    }
    return self;
}

#pragma mark - Getter / Setter天气 Label 设置位置
-(void)resetWeatherFrame:(CGRect)frame
{
    [self setFrame:frame];
    
    [self.temperatureLabel setFrame:CGRectMake(-2, 20, frame.size.width-frame.size.height, frame.size.height-20)];
    [self.temperatureLabel setText:@"--°"];
    [self.weatherImageView setFrame:CGRectMake((frame.size.width-frame.size.height), 20, frame.size.height, frame.size.height-20)];

    
    
    
}


#pragma mark - Getter / Setter时间 Label
-(UILabel *)dateTimeLabel
{
    if (_dateTimeLabel == nil)
    {
        
        _dateTimeLabel = [[UILabel alloc]init];
        [_dateTimeLabel setTextColor:RGB(231.0, 82.0, 128.0)];
        [_dateTimeLabel setFont:[UIFont boldSystemFontOfSize:30.0]];
    }
    return _dateTimeLabel;
}

#pragma mark - Getter / Setter  时间 Label
-(UILabel *)dateTimeLabel2
{
    if (_dateTimeLabel2 == nil)
    {
        
        _dateTimeLabel2 = [[UILabel alloc]init];
       [_dateTimeLabel2 setTextColor:RGB(231.0, 82.0, 128.0)];
        [_dateTimeLabel2 setFont:[UIFont boldSystemFontOfSize:15.0]];
    }
    return _dateTimeLabel2;
}

#pragma mark - Getter / Setter  时间 Label
-(UILabel *)dateTimeLabel3
{
    if (_dateTimeLabel3 == nil)
    {
        
        _dateTimeLabel3 = [[UILabel alloc]init];
        [_dateTimeLabel3 setTextColor:RGB(231.0, 82.0, 128.0)];
        [_dateTimeLabel3 setFont:[UIFont boldSystemFontOfSize:15.0]];
    }
    return _dateTimeLabel3;
}





-(UILabel *)temperatureLabel
{
    if (_temperatureLabel == nil)
    {
        
        _temperatureLabel = [[UILabel alloc]init];
        [_temperatureLabel setTextColor:RGB(231.0, 82.0, 128.0)];
        [_temperatureLabel setTextAlignment:NSTextAlignmentRight];
        [_temperatureLabel setFont:[UIFont boldSystemFontOfSize:30.0]];
    }
    return _temperatureLabel;
}

-(UIImageView*)weatherImageView
{
    if (_weatherImageView == nil)
    {
        
        
        if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
        {
            if ([[ZMUserInfo sharedUserInfo] isUserInfo])
            {
                //判断上方天气的小图标
                NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,@"sign":[ZMUserInfo sharedUserInfo].sign,@"province":@" 河南省",@"city":@"郑州市",@"district":@"管城区" };
                
                [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"weather/weather_info_by_name.php" theParmeters:parmeters sucess:^(id object)
                 {
                         if (object)
                         {
                             if ([[object objectForKey:@"error_code"] intValue] == 0)
                             {
                                 NSDictionary *result = [object objectForKey:@"result"];
                                 NSDictionary *data = [result objectForKey:@"data"];
                                 if (data)
                                 {
                                     
#pragma mark - 解析 realtime 实时天气数据
                                     NSDictionary *realtimeDictionary = [data objectForKey:@"realtime"];
                                     
                                     //解析实时天气情况
                                     NSDictionary *weather = [realtimeDictionary objectForKey:@"weather"];
                                     
                                     NSString *weatherimg = [weather objectForKey:@"img"];
                                     //测试用的
                                    // NSString *weatherimg=@"100";
                                     if ([weatherimg isEqualToString:@"0"])
                                     {
                                         _weatherImageView.image=[UIImage imageNamed:@"0.png"];
                                     }
                                     if ([weatherimg isEqualToString:@"1"])
                                     {
                                         _weatherImageView.image=[UIImage imageNamed:@"1.png"];
                                     }
                                     if ([weatherimg isEqualToString:@"2"])
                                     {
                                         _weatherImageView.image=[UIImage imageNamed:@"2.png"];
                                     }
                                     if ([weatherimg isEqualToString:@"3"])
                                     {
                                         _weatherImageView.image=[UIImage imageNamed:@"3.png"];
                                     }
                                     if ([weatherimg isEqualToString:@"4"])
                                     {
                                         _weatherImageView.image=[UIImage imageNamed:@"4.png"];
                                     }
                                     if ([weatherimg isEqualToString:@"5"])
                                     {
                                         _weatherImageView.image=[UIImage imageNamed:@"5.png"];
                                     }
                                     if ([weatherimg isEqualToString:@"6"])
                                     {
                                         _weatherImageView.image=[UIImage imageNamed:@"6.png"];
                                     }
                                     if ([weatherimg isEqualToString:@"7"])
                                     {
                                         _weatherImageView.image=[UIImage imageNamed:@"7.png"];
                                     }
                                     if ([weatherimg isEqualToString:@"8"])
                                     {
                                         _weatherImageView.image=[UIImage imageNamed:@"8.png"];
                                     }
                                     if ([weatherimg isEqualToString:@"9"])
                                     {
                                         _weatherImageView.image=[UIImage imageNamed:@"9.png"];
                                     }
                                     if ([weatherimg isEqualToString:@"10"])
                                     {
                                         _weatherImageView.image=[UIImage imageNamed:@"10.png"];
                                     }
                                     if ([weatherimg isEqualToString:@"11"])
                                     {
                                         _weatherImageView.image=[UIImage imageNamed:@"11.png"];
                                     }
                                     if ([weatherimg isEqualToString:@"12"])
                                     {
                                         _weatherImageView.image=[UIImage imageNamed:@"12.png"];
                                     }
                                     if ([weatherimg isEqualToString:@"13"])
                                     {
                                         _weatherImageView.image=[UIImage imageNamed:@"13.png"];
                                     }
                                     if ([weatherimg isEqualToString:@"14"])
                                     {
                                         _weatherImageView.image=[UIImage imageNamed:@"14.png"];
                                     }
                                     if ([weatherimg isEqualToString:@"15"])
                                     {
                                         _weatherImageView.image=[UIImage imageNamed:@"15.png"];
                                     }
                                     if ([weatherimg isEqualToString:@"16"])
                                     {
                                         _weatherImageView.image=[UIImage imageNamed:@"16.png"];
                                     }
                                     if ([weatherimg isEqualToString:@"17"])
                                     {
                                         _weatherImageView.image=[UIImage imageNamed:@"17.png"];
                                     }
                                     if ([weatherimg isEqualToString:@"18"])
                                     {
                                         _weatherImageView.image=[UIImage imageNamed:@"18.png"];
                                     }
                                     if ([weatherimg isEqualToString:@"19"])
                                     {
                                         _weatherImageView.image=[UIImage imageNamed:@"19.png"];
                                     }
                                     if ([weatherimg isEqualToString:@"20"])
                                     {
                                         _weatherImageView.image=[UIImage imageNamed:@"20.png"];
                                     }
                                     if ([weatherimg isEqualToString:@"21"])
                                     {
                                         _weatherImageView.image=[UIImage imageNamed:@"21.png"];
                                     }
                                     if ([weatherimg isEqualToString:@"22"])
                                     {
                                         _weatherImageView.image=[UIImage imageNamed:@"22.png"];
                                     }
                                     if ([weatherimg isEqualToString:@"23"])
                                     {
                                         _weatherImageView.image=[UIImage imageNamed:@"23.png"];
                                     }
                                     if ([weatherimg isEqualToString:@"24"])
                                     {
                                         _weatherImageView.image=[UIImage imageNamed:@"24.png"];
                                     }
                                     if ([weatherimg isEqualToString:@"25"])
                                     {
                                         _weatherImageView.image=[UIImage imageNamed:@"25.png"];
                                     }
                                     if ([weatherimg isEqualToString:@"26"])
                                     {
                                         _weatherImageView.image=[UIImage imageNamed:@"26.png"];
                                     }
                                     if ([weatherimg isEqualToString:@"27"])
                                     {
                                         _weatherImageView.image=[UIImage imageNamed:@"27.png"];
                                     }
                                     if ([weatherimg isEqualToString:@"28"])
                                     {
                                         _weatherImageView.image=[UIImage imageNamed:@"28.png"];
                                     }
                                     if ([weatherimg isEqualToString:@"29"])
                                     {
                                         _weatherImageView.image=[UIImage imageNamed:@"29.png"];
                                     }
                                     if ([weatherimg isEqualToString:@"30"])
                                     {
                                         _weatherImageView.image=[UIImage imageNamed:@"30.png"];
                                     }
                                     if ([weatherimg isEqualToString:@"31"])
                                     {
                                         _weatherImageView.image=[UIImage imageNamed:@"31.png"];
                                     }
                                     if ([weatherimg isEqualToString:@"32"])
                                     {
                                         _weatherImageView.image=[UIImage imageNamed:@"53.png"];
                                     }
                                  //   else
                                   //  {
                                  //   _weatherImageView.image=[UIImage imageNamed:@"undefined.png"];
                                  //   }
                        }
                      }
                   }
                 }
            error:^(NSError *error) {}];
            }
        }
        else
        {
            [AnyObjectActivityView showWithTitle:NetWorkFail wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
        }

        
        //修改 top 上的图片这里是定义的
        _weatherImageView = [[UIImageView alloc]init];
        //_weatherImageView.image=[UIImage imageNamed:@"阴天图标"];
       // _weatherImageView.image=[UIImage imageNamed:@"0.png"];
        [_weatherImageView setContentMode:UIViewContentModeScaleAspectFit];
    }
    return _weatherImageView;
}

@end
