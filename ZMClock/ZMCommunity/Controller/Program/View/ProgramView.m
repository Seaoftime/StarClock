//
//  ProgramView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/29.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ProgramView.h"




@implementation ProgramView





#pragma mark 初始化图片视图Frame
/**
 初始化图片视图Frame
 */
-(instancetype)initWithimageViewFrame
{
    self = [super init];
    if (self)
    {
        [self addSubview:self.imageView];
    }
    return self;
}

-(void)resetWithimageViewFrame:(CGRect)frame withimageViewFame:(CGRect)imageViewFrame withModel:(ProgramModel*)model
{
    [self setFrame:frame];
    [self.imageView setFrame:imageViewFrame];
    [self.imageView setBackgroundColor:[UIColor greenColor]];
    
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.startImageUrl]];
}



#pragma mark 初始化行程详情视图Frame
/**
 初始化图片视图Frame
 */
-(instancetype)initWithProgramInfoFrame
{
    self = [super init];
    if (self)
    {
        [self addSubview:self.dateLabel];
        [self addSubview:self.titleLabel];
        [self addSubview:self.localctionView];
        [self addSubview:self.timeView];
    }
    return self;
}

-(void)resetWithProgramInfoFrame:(CGRect)frame withdateLabelFrame:(CGRect)dateLabelFrame withtitleLabelFrame:(CGRect)titleLabelFrame withlocalctionViewFrame:(CGRect)localctionViewFrame withtimeViewFrame:(CGRect)timeViewFrame withModel:(ProgramModel*)model
{
    [self setFrame:frame];
    
    [self.dateLabel setFrame:dateLabelFrame];
    [self.titleLabel setFrame:titleLabelFrame];
    [self.localctionView setFrame:localctionViewFrame];
    [self.timeView setFrame:timeViewFrame];
    
    
    
    [self.dateLabel setText:model.programinfoDate];
    [self.titleLabel setText:model.programinfoTitle];
    [self.localctionView.supportImageView setImage:[UIImage imageNamed:@"行程详情地点.png"]];
    [self.localctionView.numberLabel setText:model.locationInfo];
    [self.timeView.numberLabel setText:model.time];
    [self.timeView.supportImageView setImage:[UIImage imageNamed:@"行程详情时间.png"]];
}



#pragma  mark 初始化“评论”视图
/**
 初始化评论信息视图
 */
-(instancetype)initWithCommentFrame
{
    self = [super init];
    if (self)
    {
        [self addSubview:self.titleLabel];
        [self addSubview:self.supportView];
    }
    return self;
}

-(void)resetWithCommentFrame:(CGRect)frame withtitleLabelFrame:(CGRect)titleLabelFrame withsupportViewFrame:(CGRect)supportViewFrame withModel:(ProgramModel*)model
{
    [self setFrame:frame];
    [self setBackgroundColor:RGB(210.0, 210.0, 210.0)];
    [self.titleLabel setFrame:titleLabelFrame];
    [self.supportView setFrame:supportViewFrame];
    
    
    [self.titleLabel setText:model.comment];
    [self.supportView.supportImageView setImage:[UIImage imageNamed:@"评论"]];
    [self.supportView.numberLabel setText:model.commentNumber];
}


#pragma  mark 初始化“评论详情”视图
-(instancetype)initWithCommentItemsFrame
{
    self = [super init];
    if (self)
    {
        [self addSubview:self.imageView];
        [self addSubview:self.titleLabel];
        [self.titleLabel setFont:[UIFont systemFontOfSize:15.0]];
        [self addSubview:self.levelView];
        [self addSubview:self.dateLabel];
        [self addSubview:self.describeLabel];
    }
    return self;
}


-(void)resetWithCommentItemsFrame:(CGRect)frame withimageViewFrame:(CGRect)imageViewFrame withtitleLabelFrame:(CGRect)titleLabelFrame withLevelViewFrame:(CGRect)LevelViewFrame withdateLabelFrame:(CGRect)dateLabelFrame withdescribeLabelFrame:(CGRect)describeLabelFrame withModel:(ProgramModel*)model
{
    [self setFrame:frame];
    
    [self.imageView setFrame:imageViewFrame];
    [self.titleLabel setFrame:titleLabelFrame];
    [self.dateLabel setFrame:dateLabelFrame];
    [self.describeLabel setFrame:describeLabelFrame];
   
    
    
    [self.levelView resetLevelViewFrame:LevelViewFrame withImageName:@"等级黄" withLevel:model.level];
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.headPortraiteUrl]];
    [self.titleLabel setText:model.commentNickName];
    [self.dateLabel setText:model.commentDate];
    [self.describeLabel setText:model.commentDescribe];
}













#pragma mark Getter / Setter
-(UIImageView *)imageView
{
    if (_imageView == nil)
    {
        _imageView = [[UIImageView alloc]init];
    }
    return _imageView;
}


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
        [_dateLabel setTextColor:RGB(114.0, 110.0, 110.0)];
        [_dateLabel setFont:[UIFont systemFontOfSize:13.0]];
    }
    return _dateLabel;
}



-(UILabel *)describeLabel
{
    if (_describeLabel == nil)
    {
        _describeLabel = [[UILabel alloc]init];
        [_describeLabel setNumberOfLines:0];
        [_describeLabel setTextColor:RGB(114.0, 110.0, 110.0)];
        [_describeLabel setFont:[UIFont systemFontOfSize:13.0]];
    }
    return _describeLabel;
}



-(UILabel *)dayLabel
{
    if (_dayLabel == nil)
    {
        _dayLabel = [[UILabel alloc]init];
        [_dayLabel setTextAlignment:NSTextAlignmentCenter];
        [_dayLabel setFont:[UIFont boldSystemFontOfSize:15.0]];
    }
    return _dayLabel;
}



-(UILabel *)weekLabel
{
    if (_weekLabel == nil)
    {
        _weekLabel = [[UILabel alloc]init];
        [_weekLabel setTextAlignment:NSTextAlignmentCenter];
        [_weekLabel setFont:[UIFont boldSystemFontOfSize:15.0]];
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



-(SupportView*)supportView
{
    if (_supportView == nil)
    {
        _supportView = [[SupportView alloc]init];
    }
    return _supportView;
}


-(LevelView*)levelView
{
    if (_levelView == nil)
    {
        _levelView = [[LevelView alloc]init];
    }
    return _levelView;
}





@end
