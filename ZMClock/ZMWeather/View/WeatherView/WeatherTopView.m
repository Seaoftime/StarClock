//
//  WeatherPartView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/12.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "WeatherTopView.h"


@implementation WeatherTopView

#pragma mark - 创建天气上面视图
/**
 创建天气上面视图上半部分,包括元素为
 1.最低温度和最高温度
 2.天气图标
 3.天气说明文字
 4.当前温度
 */
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addSubview:self.leftTemperatureView];
        [self addSubview:self.middleImageView];
        [self addSubview:self.rightTemperatureView];
        [self addSubview:self.weatherExplainLabel];
        
        [self addSubview:self.humidityWeatherView];
        [self addSubview:self.windWeatherView];
        [self addSubview:self.pm25WeatherView];
    }
    return self;
}

-(void)switchBackgroundColor:(BOOL)backgroundColor
{
    if (backgroundColor)
    {
        [self.leftTemperatureView setBackgroundColor:[UIColor redColor]];
        [self.rightTemperatureView setBackgroundColor:[UIColor purpleColor]];
        [self.middleImageView setBackgroundColor:[UIColor yellowColor]];
        [self.weatherExplainLabel setBackgroundColor:[UIColor cyanColor]];
        [self.humidityWeatherView setBackgroundColor:[UIColor grayColor]];
        [self.pm25WeatherView setBackgroundColor:[UIColor greenColor]];
        [self.windWeatherView setBackgroundColor:[UIColor blueColor]];
    }
}



#pragma mark Getter / Setter
-(ZMView*)leftTemperatureView
{
    if (_leftTemperatureView == nil)
    {
        _leftTemperatureView = [[ZMView alloc]initWithWeatherFrame:CGRectMake((kScreen_Width/2.0-80.0/2.0)-70, 30, 80, 30)];
        [_leftTemperatureView.imageView setImage:[UIImage imageNamed:@"最低温度"]];
        [_leftTemperatureView .rightLabel setText:@"--°"];
    }
    return _leftTemperatureView;
}


-(UIImageView *)middleImageView
{
    if (_middleImageView == nil)
    {
        _middleImageView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreen_Width/2.0-80.0/2.0, 0, 80, 80)];
        [_middleImageView setImage:[UIImage imageNamed:@"00.png"]];
    }
    return _middleImageView;
}


-(ZMView*)rightTemperatureView
{
    if (_rightTemperatureView == nil)
    {
        _rightTemperatureView = [[ZMView alloc]initWithWeatherFrame:CGRectMake((kScreen_Width/2.0+80.0/2.0)+10, 30, 80, 30)];
        [_rightTemperatureView.imageView setImage:[UIImage imageNamed:@"最高温度"]];
        [_rightTemperatureView .rightLabel setText:@"--°"];
    }
    return _rightTemperatureView;
}


-(ZMView *)weatherExplainLabel
{
    if (_weatherExplainLabel == nil)
    {
        _weatherExplainLabel = [[ZMView alloc]initWithWeatherExplainFrame:CGRectMake(0, 90, kScreen_Width, 30)];
        [_weatherExplainLabel.leftLabel setText:@"--"];
        [_weatherExplainLabel.rightLabel setText:@"--°"];
    }
    return _weatherExplainLabel;
}



-(WeatherView *)humidityWeatherView
{
    if (_humidityWeatherView == nil)
    {
        _humidityWeatherView = [[WeatherView alloc]initWithFrame:CGRectMake(0*(kScreen_Width/3.0), 125, kScreen_Width/3.0, 50) withTopTwoWeatherLayoutType:HorizontalLayoutType];
        [_humidityWeatherView.topLabel setText:@"空气湿度"];
        [_humidityWeatherView.middleImageView setImage:[UIImage imageNamed:@"空气湿度.png"]];
    }
    return _humidityWeatherView;
}


-(WeatherView *)windWeatherView
{
    if (_windWeatherView == nil)
    {
        _windWeatherView = [[WeatherView alloc]initWithFrame:CGRectMake(1*(kScreen_Width/3.0), 125, kScreen_Width/3.0, 50) withTopTwoWeatherLayoutType:HorizontalLayoutType];
        [_windWeatherView.topLabel setText:@"风力风向"];
        [_windWeatherView.middleImageView setImage:[UIImage imageNamed:@"风向.png"]];
    }
    return _windWeatherView;
}

-(WeatherView *)pm25WeatherView
{
    if (_pm25WeatherView == nil)
    {
        _pm25WeatherView = [[WeatherView alloc]initWithFrame:CGRectMake(2*(kScreen_Width/3.0), 125, kScreen_Width/3.0, 50) withTopTwoWeatherLayoutType:HorizontalLayoutType];
        [_pm25WeatherView.topLabel setText:@"污染程度"];
        [_pm25WeatherView.middleImageView setImage:[UIImage imageNamed:@"污染.png"]];
    }
    return _pm25WeatherView;
}


#pragma mark 填充数据模型
-(void)setWeatherModel:(WeatherModel*)model
{
    if ([model.weatherArray count])
    {
        MemberWeatherModel *memberWeatherModel = model.weatherArray[0];
        /**
         设置当天的最高温度和最低温度、天气情况
         */
        [self.leftTemperatureView.rightLabel setText:[NSString stringWithFormat:@"%@°",memberWeatherModel.nightModel.temperature]];
        
        /**
         设置当前天气图标
         */
        [self.middleImageView setImage:[[WeatherHelper sharedWeatherHelper] getWeatherImageWithWeatherModel:memberWeatherModel]];
        
        /**
         设置最高温度
         */
        [self.rightTemperatureView.rightLabel setText:[NSString stringWithFormat:@"%@°",memberWeatherModel.dayModel.temperature]];
        
        
        
        /**
         设置当天的天气情况
         */
        [self.weatherExplainLabel.leftLabel setText:model.realtimeModel.weather_info];
        [self.weatherExplainLabel.rightLabel setText:[NSString stringWithFormat:@"%@°",model.realtimeModel.weather_temperature]];
        
        /**
         设置当前空气湿度
         */
        [self.humidityWeatherView.bottomLabel setText:[NSString stringWithFormat:@"%@%@",model.realtimeModel.weather_humidity,@"%"]];
        
        /**
         设置风力、风向
         */
        [self.windWeatherView.topLabel setText:model.realtimeModel.wind_direct];
        [self.windWeatherView.bottomLabel setText:model.realtimeModel.wind_power];
        
        /**
         设置PM2.5
         */
        [self.pm25WeatherView.topLabel setText:model.pm25Model.quality];
        [self.pm25WeatherView.bottomLabel setText:model.pm25Model.pm10];
    }
}

@end
