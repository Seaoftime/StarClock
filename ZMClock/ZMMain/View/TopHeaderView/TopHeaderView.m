//
//  TopHeaderView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/16.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "TopHeaderView.h"
#import "WeatherHelper.h"

@interface TopHeaderView ()

@property (nonatomic,strong) NSDateFormatter *dateFormatter;
@property (nonatomic,strong) NSDateFormatter *dateFormatter2;
@property (nonatomic,strong) NSDateFormatter *dateFormatter3;

@end

@implementation TopHeaderView



#pragma mark 主页视图top加载控件
-(instancetype)initWithFrame:(CGRect)frame withDeletahe:(id<TopHeaderViewDeletae>)deletage
{
    self = [super initWithFrame:frame];
    if (self)
    {
        //设置游戏主页top 背景
        UIImageView *Topimage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"上面底板"]];
        Topimage.frame=CGRectMake(0, 0, kScreen_Width, 73);
        [self addSubview:Topimage];

        
        [[NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(updateTime) userInfo:nil repeats:YES] fire];
        
        
        [self setDeletage:deletage];
        //[self setBackgroundColor:RGBAlpha(255.0, 255.0, 255.0,0.4)];
        
        [self addSubview:self.clockView];
        [self.clockView resetClockFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        
        
        [self addSubview:self.weatherView];
        [self.weatherView resetWeatherFrame:CGRectMake(frame.size.width/2, 0, frame.size.width/2, frame.size.height)];
    }
    return self;
}



-(TopHeaderControl *)clockView
{
    if (_clockView == nil)
    {
        _clockView = [[TopHeaderControl alloc]initClock];
        [_clockView setTag:1];
        [_clockView addTarget:self action:@selector(topHeaderControlAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _clockView;
}


-(TopHeaderControl*)weatherView
{
    if (_weatherView == nil)
    {
        _weatherView = [[TopHeaderControl alloc]initWeather];
        [_weatherView setTag:2];
        [_weatherView addTarget:self action:@selector(topHeaderControlAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _weatherView;
}

#pragma mark 时间赋值
-(NSDateFormatter*)dateFormatter
{
    if (_dateFormatter == nil)
    {
        _dateFormatter = [[NSDateFormatter alloc] init];
        
        
        [_dateFormatter setDateFormat:@"HH:mm"];
        
    }
    return _dateFormatter;
}

#pragma mark 日期赋值
-(NSDateFormatter*)dateFormatter2
{
    if (_dateFormatter2 == nil)
    {
        _dateFormatter2 = [[NSDateFormatter alloc] init];
        
        
       
        [_dateFormatter2 setDateFormat:@"YYYY/MM/dd"];
        
        
        
        
    }
    return _dateFormatter2;
}


#pragma mark 周几赋值
-(NSDateFormatter*)dateFormatter3
{
    if (_dateFormatter3 == nil)
    {
        _dateFormatter3 = [[NSDateFormatter alloc] init];
        
        [_dateFormatter3 setDateFormat:@"EEEE"];
        //[_dateFormatter3 setDateFormat:@"YYYY-MM-dd"];
        
    }
    return _dateFormatter3;
}



-(void)updateTime
{
    [self.clockView.dateTimeLabel setText:[self.dateFormatter stringFromDate:[NSDate date]]];
     [self.clockView.dateTimeLabel2 setText:[self.dateFormatter2 stringFromDate:[NSDate date]]];
    [self.clockView.dateTimeLabel3 setText:[self.dateFormatter3 stringFromDate:[NSDate date]]];
    
}

-(void)topHeaderControlAction:(TopHeaderControl*)sender
{
    if ([self.deletage respondsToSelector:@selector(topHeaderViewAction:)])
    {
        [self.deletage topHeaderViewAction:sender];
    }
}




/**
 设置天气参数
 */
-(void)resetModel:(WeatherModel*)model
{
    
    MemberWeatherModel *memberWeatherModel = model.weatherArray[0];
    [self.weatherView.temperatureLabel setText:[NSString stringWithFormat:@"%@°",model.realtimeModel.weather_temperature]];
    //这里是给 top 上的图片附上对应的图片  看不懂啊
    [self.weatherView.weatherImageView setImage:[[WeatherHelper sharedWeatherHelper] getWeatherImageWithWeatherModel:memberWeatherModel]];
}
@end
