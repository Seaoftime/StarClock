//
//  ConstellationPartView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/26.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ConstellationPartView.h"

#define ConstellationLineColor RGBAlpha(156.0, 156.0, 155.0, 1.0)


@interface ConstellationPartView ()

@property (nonatomic,strong) UIView *leftLineView; // !< 左分割线
@property (nonatomic,strong) UIImageView *todayImageView; // !< 今日运势图片视图
@property (nonatomic,strong) UIView *rightLineView; // !< 右分割线

@end



@implementation ConstellationPartView


-(instancetype)initWithFrame:(CGRect)frame withConstellationPartType:(ConstellationPartType)partType
{
    self = [super initWithFrame:frame];
    if (self)
    {
        switch (partType)
        {
            case middleType:
            {
                /**
                 总高度为170
                 */
//                [self setBackgroundColor:[UIColor grayColor]];
                
                
                [self addSubview:self.leftLineView];
                [self addSubview:self.todayImageView];
                [self addSubview:self.rightLineView];
                [self addSubview:self.dateLabel];
                [self addSubview:self.summaryLabel];
            }
                break;
            case bottomType:
            {
                
                [self setBackgroundColor:RGBAlpha(255.0, 181.0, 237.0, 1.0)];
                [self addSubview:self.zongHeZhiShuView];
                [self addSubview:self.caiYunZhiShuView];
                [self addSubview:self.gongZuoZhiShuView];
                [self addSubview:self.aiQingZhiShuView];
            }
                break;
        }
    }
    return self;
}

#pragma mark 上部分使用控件
-(UIView*)leftLineView
{
    if (_leftLineView == nil)
    {
        _leftLineView = [[UIView alloc]initWithFrame:CGRectMake(0, 23, kScreen_Width/2.0-115/2.0, 2)];
        [_leftLineView setBackgroundColor:ConstellationLineColor];
    }
    return _leftLineView;
}

-(UIImageView*)todayImageView
{
    if (_todayImageView == nil)
    {
        _todayImageView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreen_Width/2.0-155/2.0, 0, 155, 30)];
//        [_todayImageView setBackgroundColor:[UIColor grayColor]];
        [_todayImageView setContentMode:UIViewContentModeScaleAspectFit];
        [_todayImageView setImage:[UIImage imageNamed:@"今日运势"]];
    }
    return _todayImageView;
}


-(UIView*)rightLineView
{
    if (_rightLineView == nil)
    {
        _rightLineView = [[UIView alloc]initWithFrame:CGRectMake(kScreen_Width/2.0+115/2.0, 23, kScreen_Width/2.0-115/2.0, 2)];
        [_rightLineView setBackgroundColor:ConstellationLineColor];
    }
    return _rightLineView;
}


-(UILabel *)dateLabel
{
    if (_dateLabel == nil)
    {
        _dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, kScreen_Width, 30)];
        [_dateLabel setTextColor:RGB(0, 197.0, 255.0)];
        [_dateLabel setTextAlignment:NSTextAlignmentCenter];
        [_dateLabel setFont:[UIFont boldSystemFontOfSize:20.0]];
        [_dateLabel setText:@"(4/26)"];
    }
    return _dateLabel;
}


-(UILabel*)summaryLabel
{
    if (_summaryLabel == nil)
    {
        _summaryLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 60, kScreen_Width-20, 100)];
        [_summaryLabel setNumberOfLines:0];
        [_summaryLabel setTextColor:RGBAlpha(67.0, 43.0, 12.0, 1.0)];
//        [_summaryLabel setBackgroundColor:[UIColor yellowColor]];
        [_summaryLabel setFont:[UIFont systemFontOfSize:14.0]];
        [_summaryLabel setText:@"今天的你头脑相当灵活，也能够用更动态的角度看待问题，压抑的身心得到最大的释放，可以试着和朋友们约起来了呢。有些人也可能收到一些意外的表白，有机会认识一些网络的友人。"];
    }
    return _summaryLabel;
}



#pragma mark 下部分使用控件
-(CompositeView*)zongHeZhiShuView
{
    if (_zongHeZhiShuView == nil)
    {
        _zongHeZhiShuView = [[CompositeView alloc]initWithFrame:CGRectMake(0, 15, kScreen_Width, 30)];
        [_zongHeZhiShuView.titleLabel setText:@"综合指数"];
        [_zongHeZhiShuView.describeLabel setText:@"健康指数"];
    }
    return _zongHeZhiShuView;
}

-(CompositeView*)caiYunZhiShuView
{
    if (_caiYunZhiShuView == nil)
    {
        _caiYunZhiShuView = [[CompositeView alloc]initWithFrame:CGRectMake(0, 50, kScreen_Width, 30)];
        [_caiYunZhiShuView.titleLabel setText:@"财运指数"];
        [_caiYunZhiShuView.describeLabel setText:@"幸运数字"];
    }
    return _caiYunZhiShuView;
}

-(CompositeView*)gongZuoZhiShuView
{
    if (_gongZuoZhiShuView == nil)
    {
        _gongZuoZhiShuView = [[CompositeView alloc]initWithFrame:CGRectMake(0, 85, kScreen_Width, 30)];
        [_gongZuoZhiShuView.titleLabel setText:@"工作指数"];
        [_gongZuoZhiShuView.describeLabel setText:@"幸运颜色"];
    }
    return _gongZuoZhiShuView;
}


-(CompositeView*)aiQingZhiShuView
{
    if (_aiQingZhiShuView == nil)
    {
        _aiQingZhiShuView = [[CompositeView alloc]initWithFrame:CGRectMake(0, 120, kScreen_Width, 30)];
        [_aiQingZhiShuView.titleLabel setText:@"爱情指数"];
        [_aiQingZhiShuView.describeLabel setText:@"速配星座"];
    }
    return _aiQingZhiShuView;
}


#pragma mark - 设置数据模型
-(void)setmodel:(ConstellationModel*)model withConstellationPartType:(ConstellationPartType)partType
{
    switch (partType)
    {
        case middleType:
        {
            [self.dateLabel setText:[NSString stringWithFormat:@"(%@)",model.date]];
            [self.summaryLabel setText:model.summary];
        }
            break;
        case bottomType:
        {
            /**
             设置综合指数
             */
            [self.zongHeZhiShuView.starRateView setScorePercent:[model.all floatValue]];
            [self.zongHeZhiShuView.ratioLabel setText:model.health];
            
            
            /**
             设置财务指数
             */
            [self.caiYunZhiShuView.starRateView setScorePercent:[model.money floatValue]];
            [self.caiYunZhiShuView.ratioLabel setText:model.number];
            
            /**
             设置工作指数
             */
            [self.gongZuoZhiShuView.starRateView setScorePercent:[model.work floatValue]];
            [self.gongZuoZhiShuView.ratioLabel setText:model.color];
            
            /**
             设置爱情指数
             */
            
            [self.aiQingZhiShuView.starRateView setScorePercent:[model.love floatValue]];
            [self.aiQingZhiShuView.ratioLabel setText:model.QFriend];
        }
            break;
    }
}

@end
