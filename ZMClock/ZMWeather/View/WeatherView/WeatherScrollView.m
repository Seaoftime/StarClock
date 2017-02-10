//
//  WeatherScrollView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/12.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "WeatherScrollView.h"


@interface WeatherScrollView ()


@end



@implementation WeatherScrollView


-(instancetype)initWithFrame:(CGRect)frame wtthDeletage:(id)deletage
{
    self = [super initWithFrame:frame];
    if (self)
    {
    
        [self setShowsVerticalScrollIndicator:NO];
        [self setShowsHorizontalScrollIndicator:NO];
        
        [self setContentSize:CGSizeMake(kScreen_Width, 530)];

        
        [self addSubview:self.weatherTopView];
        [self addSubview:self.weatherMiddleView];
        [self addSubview:self.weatherBottomView];
        
        
        
        
        [self switchBackgroundColor:NO];
        
    }
    return self;
}


-(void)switchBackgroundColor:(BOOL)backgroundColor
{
    if (backgroundColor)
    {
        [self.weatherTopView setBackgroundColor:[UIColor blueColor]];
        [self.weatherMiddleView setBackgroundColor:[UIColor redColor]];
        [self.weatherBottomView setBackgroundColor:[UIColor orangeColor]];
        
    }
}



-(WeatherTopView *)weatherTopView
{
    if (_weatherTopView == nil)
    {
        _weatherTopView = [[WeatherTopView alloc] initWithFrame:CGRectMake(0, 10, kScreen_Width, 180)];
    }
    return _weatherTopView;
}

-(WeatherMiddleView*)weatherMiddleView
{
    if (_weatherMiddleView == nil)
    {
        _weatherMiddleView = [[WeatherMiddleView alloc] initWithFrame:CGRectMake(0, 190, kScreen_Width, 150)];
        
    }
    return _weatherMiddleView;
}

-(WeatherBottomView*)weatherBottomView
{
    if (_weatherBottomView == nil)
    {
        _weatherBottomView = [[WeatherBottomView alloc] initWithFrame:CGRectMake(0, 340, kScreen_Width, 190)];
        
    }
    return _weatherBottomView;
}



-(void)setweatherModel:(WeatherModel*)model
{
    [self.weatherTopView setWeatherModel:model];
    [self.weatherMiddleView.weatherMiddleScrollView setWeatherModel:model];
    [self.weatherBottomView setWeatherModel:model];
}


@end
