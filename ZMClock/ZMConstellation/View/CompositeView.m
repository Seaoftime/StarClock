//
//  CompositeView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/26.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//


#import "CompositeView.h"

@implementation CompositeView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addSubview:self.titleLabel];
        [self.titleLabel setFrame:CGRectMake(0, 0, frame.size.width/4.0, 30)];
        
        [self addSubview:self.starRateView];
        
        
        
        [self addSubview:self.describeLabel];
        [self.describeLabel setFrame:CGRectMake(frame.size.width/2.0, 0, frame.size.width/4.0, 30)];
        
        
        
        [self addSubview:self.ratioLabel];
        [self.ratioLabel setFrame:CGRectMake(frame.size.width/2.0+frame.size.width/4.0, 0, frame.size.width/4.0, 30)];
    }
    return self;
}



-(UILabel *)titleLabel
{
    if (_titleLabel == nil)
    {
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setTextColor:[UIColor blackColor]];
        [_titleLabel setFont:[UIFont boldSystemFontOfSize:16.0]];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLabel;
}

-(UILabel *)describeLabel
{
    if (_describeLabel == nil)
    {
        _describeLabel = [[UILabel alloc]init];
        [_describeLabel setFont:[UIFont boldSystemFontOfSize:16.0]];
        [_describeLabel setTextAlignment:NSTextAlignmentCenter];
    }
    return _describeLabel;
}


-(UILabel *)ratioLabel
{
    if (_ratioLabel == nil)
    {
        _ratioLabel = [[UILabel alloc]init];
        [_ratioLabel setTextAlignment:NSTextAlignmentCenter];
    }
    return _ratioLabel;
}

-(CWStarRateView*)starRateView
{
    if (_starRateView == nil)
    {
        _starRateView = [[CWStarRateView alloc]initWithFrame:CGRectMake(kScreen_Width/4.0, 0, kScreen_Width/4.0, 30) numberOfStars:5];
        [_starRateView setScorePercent:0.2];
        [_starRateView setAllowIncompleteStar:YES];
        [_starRateView setHasAnimation:YES];
    }
    return _starRateView;
}

@end
