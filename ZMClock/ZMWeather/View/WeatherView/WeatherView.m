//
//  WeatherView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/12.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "WeatherView.h"

@interface WeatherView ()

@property (nonatomic) CGRect weatherViewFrame;

@end



@implementation WeatherView

#pragma mark - 创建天气上面视图上半部分
/**
 创建天气上面视图上半部分,包括元素为
 1.最低温度和最高温度
 2.天气图标
 3.天气说明文字
 4.当前温度
 */
-(instancetype)initWithFrame:(CGRect)frame withTopOneWeatherLayoutType:(WeatherLayoutType)type
{
    self = [super initWithFrame:frame];
    if (self)
    {
        switch (type)
        {
            case VerticalLayoutType:
            {
                
            }
                break;
            case HorizontalLayoutType:
            {
                
            }
                break;
        }
    }
    return self;
}


#pragma mark - 创建天气上面视图下半部分控件
/**
 创建天气上面视图下半部分控件,包括元素为
 1.示意图标
 2.说明文字
 3.对应数据
 */
-(instancetype)initWithFrame:(CGRect)frame withTopTwoWeatherLayoutType:(WeatherLayoutType)type
{
    self = [super initWithFrame:frame];
    if (self)
    {
        switch (type)
        {
            case VerticalLayoutType:
            {
                
            }
                break;
            case HorizontalLayoutType:
            {
                [self addSubview:self.middleImageView];
                [self.middleImageView setFrame:CGRectMake(5, self.frame.size.height/2-40/2, 40, 40)];
                
                [self addSubview:self.topLabel];
                [self.topLabel setFrame:CGRectMake(45, 5,self.frame.size.width-50 , 20)];
                [self.topLabel setTextAlignment:NSTextAlignmentLeft];
                [self.topLabel setFont:[UIFont boldSystemFontOfSize:14.0]];
                
                
                [self addSubview:self.bottomLabel];
                [self.bottomLabel setFrame:CGRectMake(45, self.frame.size.height-25,self.frame.size.width-50 , 20)];
                [self.bottomLabel setTextAlignment:NSTextAlignmentLeft];
                [self.bottomLabel setFont:[UIFont boldSystemFontOfSize:14.0]];
                [self.bottomLabel setText:@"--"];
            }
                break;
        }
    }
    return self;
}


#pragma mark - 创建天气上面视图中部分控件
/**
 创建天气上面视图中部分控件,包括元素为
 1.当前日期
 2.天气图标
 3.显示温度
 4.风向风力
 */
-(instancetype)initWithFrame:(CGRect)frame withMiddleWeatherLayoutType:(WeatherLayoutType)type
{
    self = [super initWithFrame:frame];
    if (self)
    {
        switch (type)
        {
            case VerticalLayoutType:
            {
                [self.layer setBorderWidth:1.0];
                [self.layer setBorderColor:[[UIColor whiteColor] CGColor]];
                
                /*
                 上部标签
                 */
                [self addSubview:self.topLabel];
                [self.topLabel setFrame:CGRectMake(0, 5,self.frame.size.width , 20)];
                [self.topLabel setTextAlignment:NSTextAlignmentCenter];
                [self.topLabel setFont:[UIFont boldSystemFontOfSize:15.0]];
                [self.topLabel setText:@"--"];
                
                
                /*
                 添加图标
                 */
                [self addSubview:self.middleImageView];
                [self.middleImageView setFrame:CGRectMake(self.frame.size.width/2-40/2, 30, 40, 40)];
                [self.middleImageView setImage:[UIImage imageNamed:@"00.png"]];
                
                
                /*
                 中间标签
                 */
                [self addSubview:self.middleLabel];
                [self.middleLabel setFrame:CGRectMake(0, 75,self.frame.size.width , 20)];
                [self.middleLabel setTextAlignment:NSTextAlignmentCenter];
                [self.middleLabel setFont:[UIFont boldSystemFontOfSize:15.0]];
                [self.middleLabel setText:@"--°"];
                
                
                /*
                 底部标签
                 */
                [self addSubview:self.bottomLabel];
                [self.bottomLabel setFrame:CGRectMake(0, 100,self.frame.size.width , 20)];
                [self.bottomLabel setTextAlignment:NSTextAlignmentCenter];
                [self.bottomLabel setFont:[UIFont systemFontOfSize:15.0]];
                [self.bottomLabel setText:@"--"];
                
                
                /*
                 底部下标签
                 */
                [self addSubview:self.bottomTwoLabel];
                [self.bottomTwoLabel setFrame:CGRectMake(0, 125,self.frame.size.width , 20)];
                [self.bottomTwoLabel setTextAlignment:NSTextAlignmentCenter];
                [self.bottomTwoLabel setFont:[UIFont systemFontOfSize:15.0]];
                [self.bottomTwoLabel setText:@"--"];
            }
                break;
            case HorizontalLayoutType:
                break;
        }
    }
    return self;
}














#pragma mark - 创建天气上面视图下部分控件
/**
 创建天气上面视图下部分控件,包括元素为
 1.示意图标
 2.说明文字
 3.对应数据
 */
-(instancetype)initWithFrame:(CGRect)frame withBottomWeatherLayoutType:(WeatherLayoutType)type
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setWeatherViewFrame:frame];
        switch (type)
        {
            case VerticalLayoutType:
                break;
            case HorizontalLayoutType:
            {
                /**
                 添加边框颜色
                 */
                
                [self.layer setBorderColor:[[UIColor whiteColor] CGColor]];
                [self.layer setBorderWidth:1.0];
                [self.layer setMasksToBounds:YES];
                
                [self addSubview:self.middleImageView];
                [self.middleImageView setFrame:CGRectMake(10, self.frame.size.height/2-60/2, 60, 60)];
                
                [self addSubview:self.topLabel];
                [self.topLabel setFrame:CGRectMake(10, 10,self.frame.size.width-20 , 20)];
                [self.topLabel setTextColor:[UIColor whiteColor]];
                [self.topLabel setTextAlignment:NSTextAlignmentRight];
                [self.topLabel setFont:[UIFont boldSystemFontOfSize:20.0]];

                
                
                [self addSubview:self.bottomLabel];
                [self.bottomLabel setFrame:CGRectMake(10, self.frame.size.height-30,self.frame.size.width-20 , 20)];
                [self.bottomLabel setTextColor:[UIColor whiteColor]];
                [self.bottomLabel setTextAlignment:NSTextAlignmentRight];
                [self.bottomLabel setFont:[UIFont systemFontOfSize:15.0]];
            }
                break;
        }
    }
    return self;
}


-(void)switchBackgroundColor:(BOOL)backgroundColor
{
    if (backgroundColor)
    {
        [self.topImageView setBackgroundColor:[UIColor magentaColor]];
        [self.middleImageView setBackgroundColor:[UIColor redColor]];
        [self.topLabel setBackgroundColor:[UIColor orangeColor]];
        [self.middleLabel setBackgroundColor:[UIColor blueColor]];
        [self.bottomLabel setBackgroundColor:[UIColor greenColor]];
        [self.bottomTwoLabel setBackgroundColor:[UIColor purpleColor]];
        
        [self setBackgroundColor:[UIColor cyanColor]];
    }
 
}



#pragma mark - Getter / Setter
-(UIImageView *)topImageView
{
    if (_topImageView == nil)
    {
        _topImageView = [[UIImageView alloc]init];
        [_topImageView setContentMode:UIViewContentModeScaleAspectFit];
    }
    return _topImageView;
}


-(UIImageView *)middleImageView
{
    if (_middleImageView == nil)
    {
        _middleImageView = [[UIImageView alloc]init];
        [_middleImageView setContentMode:UIViewContentModeScaleAspectFit];
    }
    return _middleImageView;
}






-(UIImageView *)bottomImageView
{
    if (_bottomImageView == nil)
    {
        _bottomImageView = [[UIImageView alloc]init];
        [_bottomImageView setContentMode:UIViewContentModeScaleAspectFit];
    }
    return _bottomImageView;
}



-(UILabel *)topLabel
{
    if (_topLabel == nil)
    {
        _topLabel = [[UILabel alloc]init];
        [_topLabel setTextColor:[UIColor whiteColor]];
    }
    return _topLabel;
}


-(UILabel *)middleLabel
{
    if (_middleLabel == nil)
    {
        _middleLabel = [[UILabel alloc]init];
        [_middleLabel setTextColor:[UIColor whiteColor]];
        [_middleLabel setTextAlignment:NSTextAlignmentRight];
        [_middleLabel setFont:[UIFont systemFontOfSize:15.0]];
    }
    return _middleLabel;
}



-(UILabel *)bottomLabel
{
    if (_bottomLabel == nil)
    {
        _bottomLabel = [[UILabel alloc]init];
        [_bottomLabel setTextColor:[UIColor whiteColor]];
    }
    return _bottomLabel;
}

-(UILabel *)bottomTwoLabel
{
    if (_bottomTwoLabel == nil)
    {
        _bottomTwoLabel = [[UILabel alloc]init];
        [_bottomTwoLabel setTextColor:[UIColor whiteColor]];

    }
    return _bottomTwoLabel;
}

@end
