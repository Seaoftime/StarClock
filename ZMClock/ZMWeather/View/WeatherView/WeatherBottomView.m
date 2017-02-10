//
//  WeatherBottomView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/14.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "WeatherBottomView.h"

@implementation WeatherBottomView



#pragma mark - 创建天气上面视图下部分控件视图
/**
 创建天气上面视图下部分控件,包括元素为
 1.示意图标
 2.说明文字
 3.对应数据
 */
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        /**
         添加边框颜色
         */
        
        [self.layer setBorderColor:[[UIColor whiteColor] CGColor]];
        [self.layer setBorderWidth:2.0];
        [self.layer setMasksToBounds:YES];
        
        
        [self addSubview:self.tipLabel];
        [self addSubview:self.topLeftWeatherView];
        [self addSubview:self.topRightWeatherView];
        [self addSubview:self.bottomLeftWeatherView];
        [self addSubview:self.bottomRightWeatherView];
        

        [self backgroundColor:NO];
    }
    return self;
}




-(void)backgroundColor:(BOOL)backgroundColor
{
    if (backgroundColor)
    {
        [self setBackgroundColor:[UIColor orangeColor]];
        
        [self.tipLabel setBackgroundColor:[UIColor redColor]];
        [self.topLeftWeatherView setBackgroundColor:[UIColor yellowColor]];
        [self.topRightWeatherView setBackgroundColor:[UIColor greenColor]];
        [self.bottomLeftWeatherView setBackgroundColor:[UIColor orangeColor]];
        [self.bottomRightWeatherView setBackgroundColor:[UIColor blueColor]];
    }
}


#pragma mark Getter / Setter
-(UILabel *)tipLabel
{
    if (_tipLabel == nil)
    {
        _tipLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, kScreen_Width, 50)];
        [_tipLabel setTextColor:[UIColor whiteColor]];
        [_tipLabel setFont:[UIFont boldSystemFontOfSize:20.0]];
        [_tipLabel setText:@"生活指数"];
    }
    return _tipLabel;
}

-(WeatherView *)topLeftWeatherView
{
    if (_topLeftWeatherView == nil)
    {
        _topLeftWeatherView = [[WeatherView alloc]initWithFrame:CGRectMake(0, 50, kScreen_Width/2, 70) withBottomWeatherLayoutType:HorizontalLayoutType];
        [_topLeftWeatherView.middleImageView setImage:[UIImage imageNamed:@"穿衣.png"]];
        [_topLeftWeatherView.bottomLabel setText:@"穿衣"];
        
    }
    return _topLeftWeatherView;
}

-(WeatherView *)topRightWeatherView
{
    if (_topRightWeatherView == nil)
    {
        _topRightWeatherView = [[WeatherView alloc]initWithFrame:CGRectMake(kScreen_Width/2, 50, kScreen_Width/2, 70) withBottomWeatherLayoutType:HorizontalLayoutType];
         [_topRightWeatherView.middleImageView setImage:[UIImage imageNamed:@"运动.png"]];
        [_topRightWeatherView.bottomLabel setText:@"运动"];
    }
    return _topRightWeatherView;
}


-(WeatherView *)bottomLeftWeatherView
{
    if (_bottomLeftWeatherView == nil)
    {
        _bottomLeftWeatherView = [[WeatherView alloc]initWithFrame:CGRectMake(0, 120, kScreen_Width/2, 70) withBottomWeatherLayoutType:HorizontalLayoutType];
         [_bottomLeftWeatherView.middleImageView setImage:[UIImage imageNamed:@"紫外线.png"]];
        [_bottomLeftWeatherView.bottomLabel setText:@"紫外线"];
    }
    return _bottomLeftWeatherView;
}

-(WeatherView *)bottomRightWeatherView
{
    if (_bottomRightWeatherView == nil)
    {
        _bottomRightWeatherView = [[WeatherView alloc]initWithFrame:CGRectMake(kScreen_Width/2, 120, kScreen_Width/2, 70) withBottomWeatherLayoutType:HorizontalLayoutType];
        [_bottomRightWeatherView.middleImageView setImage:[UIImage imageNamed:@"感冒.png"]];
        [_bottomRightWeatherView.bottomLabel setText:@"感冒"];
    }
    return _bottomRightWeatherView;
}



#pragma mark 
-(void)setWeatherModel:(WeatherModel*)model
{
    [self.topLeftWeatherView.topLabel setText:model.lifeModel.chuanyi_title];
    [self.topRightWeatherView.topLabel setText:model.lifeModel.yundong_title];
    [self.bottomLeftWeatherView.topLabel setText:model.lifeModel.ziwaixian_title];
    [self.bottomRightWeatherView.topLabel setText:model.lifeModel.ganmao_title];
}

@end
