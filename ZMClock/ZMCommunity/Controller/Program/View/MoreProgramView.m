//
//  MoreProgramView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/4.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "MoreProgramView.h"

@implementation MoreProgramView












#pragma mark 初始化更多行程列详情表视图Frame
/**
 初始化行程列表视图Frame
 */
-(instancetype)initWithMoreProgramInfoFrame
{
    self = [super init];
    if (self)
    {
        [self setBackgroundColor:RGB(154.0, 247.0, 244.0)];
        [self addSubview:self.dateLabel];
        [self addSubview:self.titleLabel];
        [self addSubview:self.localctionView];
        [self addSubview:self.timeView];
        
        
        [self setMoreBackgroundColor:NO];
    }
    return self;
}

-(void)resetWithMoreProgramInfoFrame:(CGRect)frame withdateLabelFrame:(CGRect)dateLabelFrame withtitleLabelFrame:(CGRect)titleLabelFrame withlocalctionViewFrame:(CGRect)localctionViewFrame withtimeViewFrame:(CGRect)timeViewFrame withModel:(MoreProgramModel*)model
{
    [self setFrame:frame];
    
    [self.dateLabel setFrame:dateLabelFrame];
    [self.dateLabel setTextColor:RGB(54.0, 54.0, 54.0)];
    [self.titleLabel setFrame:titleLabelFrame];
    [self.localctionView setFrame:localctionViewFrame];
    [self.timeView setFrame:timeViewFrame];
    
    
    
    [self.dateLabel setText:model.programDate];
    [self.titleLabel setText:model.programTitle];
    [self.localctionView.supportImageView setImage:[UIImage imageNamed:@"行程详情地点.png"]];
    [self.localctionView.numberLabel setText:model.locationInfo];
    [self.timeView.numberLabel setText:model.programStartTime];
    [self.timeView.supportImageView setImage:[UIImage imageNamed:@"行程详情时间.png"]];
}











#pragma mark 初始化行程列表视图Frame
/**
 初始化行程列表视图Frame
 */
-(instancetype)initWithProgramListFrame
{
    self = [super init];
    if (self)
    {
        [self addSubview:self.dayLabel];
        [self addSubview:self.weekLabel];
        [self addSubview:self.titleLabel];
        [self addSubview:self.localctionView];
        [self addSubview:self.timeView];
        [self addSubview:self.lineView];
        
        
        [self setMoreBackgroundColor:NO];
    }
    return self;
}

-(void)resetWithProgramListFrame:(CGRect)frame withdayLabelFrame:(CGRect)dayLabelFrame withtweekLabelFrame:(CGRect)weekLabelFrame withtitleLabelFrame:(CGRect)titleLabelFrame withlocalctionViewFrame:(CGRect)localctionViewFrame withtimeViewFrame:(CGRect)timeViewFrame withlineViewFrame:(CGRect)lineViewFrame withModel:(MoreProgramModel*)model
{
    [self setFrame:frame];
    
    [self.dayLabel setFrame:dayLabelFrame];
    [self.dateLabel setTextColor:RGB(114.0, 110.0, 110.0)];
    [self.weekLabel setFrame:weekLabelFrame];
    [self.titleLabel setFrame:titleLabelFrame];
    [self.localctionView setFrame:localctionViewFrame];
    [self.timeView setFrame:timeViewFrame];
    [self.lineView setFrame:lineViewFrame];
    
    
    
    [self.dayLabel setText:model.programDay];
    [self.weekLabel setText:model.programWeek];
    [self.titleLabel setText:model.programTitle];
    [self.localctionView.supportImageView setImage:[UIImage imageNamed:@"行程详情地点.png"]];
    [self.localctionView.numberLabel setText:model.locationInfo];
    [self.timeView.numberLabel setText:model.programStartTime];
    [self.timeView.supportImageView setImage:[UIImage imageNamed:@"行程详情时间.png"]];
}



-(void)setMoreBackgroundColor:(BOOL)backgroundColor
{
    if (backgroundColor)
    {
        [self.titleLabel setBackgroundColor:[UIColor redColor]];
        [self.dateLabel setBackgroundColor:[UIColor orangeColor]];
        [self.dayLabel setBackgroundColor:[UIColor yellowColor]];
        [self.localctionView setBackgroundColor:[UIColor grayColor]];
        [self.timeView setBackgroundColor:[UIColor purpleColor]];
        [self.weekLabel setBackgroundColor:[UIColor orangeColor]];
    }
}




#pragma mark Getter / Setter
-(UILabel *)titleLabel
{
    if (_titleLabel == nil)
    {
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setTextColor:[UIColor blackColor]];
    }
    return _titleLabel;
}




-(UILabel *)dateLabel
{
    if (_dateLabel == nil)
    {
        _dateLabel = [[UILabel alloc]init];
        [_dateLabel setFont:[UIFont boldSystemFontOfSize:20.0]];
    }
    return _dateLabel;
}




-(UILabel *)dayLabel
{
    if (_dayLabel == nil)
    {
        _dayLabel = [[UILabel alloc]init];
        [_dayLabel setTextAlignment:NSTextAlignmentCenter];
        [_dayLabel setFont:[UIFont boldSystemFontOfSize:20.0]];
    }
    return _dayLabel;
}



-(UILabel *)weekLabel
{
    if (_weekLabel == nil)
    {
        _weekLabel = [[UILabel alloc]init];
        [_weekLabel setTextColor:RGB(54.0, 54.0, 54.0)];
        [_weekLabel setTextAlignment:NSTextAlignmentCenter];
        [_weekLabel setFont:[UIFont systemFontOfSize:15.0]];
    }
    return _weekLabel;
}



-(SupportView*)localctionView
{
    if (_localctionView == nil)
    {
        _localctionView = [[SupportView alloc]init];
    }
    return _localctionView;
}





-(SupportView*)timeView
{
    if (_timeView == nil)
    {
        _timeView = [[SupportView alloc]init];
    }
    return _timeView;
}

-(UIView *)lineView
{
    if (_lineView == nil)
    {
        _lineView = [[UIView alloc]init];
        [_lineView setBackgroundColor:LineViewColor];
    }
    return _lineView;
}





@end
