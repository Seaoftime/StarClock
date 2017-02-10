//
//  WeatherMiddleScrollView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/12.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "WeatherMiddleScrollView.h"
#import "WeatherView.h"

#define WeatherMiddleWidth 100.0

@interface WeatherMiddleScrollView ()


@property (nonatomic,strong) NSMutableArray *weatherViewArray;

@end


@implementation WeatherMiddleScrollView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        [self setShowsVerticalScrollIndicator:NO];
        [self setShowsHorizontalScrollIndicator:NO];
        [self setContentSize:CGSizeMake(WeatherMiddleWidth*7, 150)];
        for (int i = 0; i < 7; i++)
        {
            WeatherView *weatherView = [[WeatherView alloc]initWithFrame:CGRectMake(WeatherMiddleWidth*i, 0, WeatherMiddleWidth, 150) withMiddleWeatherLayoutType:VerticalLayoutType];
            [self addSubview:weatherView];
            [self.weatherViewArray addObject:weatherView];
        }
    }
    return self;
}

-(NSMutableArray *)weatherViewArray
{
    if (_weatherViewArray == nil)
    {
        _weatherViewArray = [NSMutableArray array];
    }
    return _weatherViewArray;
}


-(void)setWeatherModel:(WeatherModel*)model
{
    for (int i=0; i < [model.weatherArray count]; i++)
    {
        MemberWeatherModel *modele = model.weatherArray[i];
        WeatherView *weatherView = self.weatherViewArray[i];
        [weatherView.topLabel setText:modele.date];
        /**
         设置最高温度（白天的温度）和最低温度（晚上的温度）
         */
        [weatherView.middleLabel setText:[NSString stringWithFormat:@"%@°/%@°",modele.nightModel.temperature,modele.dayModel.temperature]];
        [weatherView.bottomLabel setText:modele.dayModel.wind];
        [weatherView.bottomTwoLabel setText:modele.dayModel.windPower];
        [weatherView.middleImageView setImage:[[WeatherHelper sharedWeatherHelper] getWeatherImageWithWeatherModel:modele]];
    }
}

@end
