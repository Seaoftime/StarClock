//
//  StoryComicNewsView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/27.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "StoryComicNewsView.h"

@implementation StoryComicNewsView


-(instancetype)initWithNormalFrame
{
    self = [super init];
    if (self)
    {
        [self addSubview:self.storyComicNewsImageView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.describeLabel];
        [self addSubview:self.authorLabel];
        [self addSubview:self.dateLabel];
        [self addSubview:self.commentView];
        
        [self setViewBackgroundColor:NO];
    }
    return self;
}



/**
 重置正常类型Frame
 */
-(void)resetWithNormalFrame:(CGRect)frame withModel:(StoryComicNewsModel*)model
{
    /**
     给自己设置Frame
     */
    [self setFrame:frame];
    
    
    /**
     给每个空间设置Frame
     */
    [self.storyComicNewsImageView setFrame:CGRectMake(5, 5, 120, 60)];
    [self.titleLabel setFrame:CGRectMake(130, 5, frame.size.width-135, 20)];
    [self.describeLabel setFrame:CGRectMake(130, 30, frame.size.width-135, 35)];
    [self.authorLabel setFrame:CGRectMake(5, 70, 100, 15)];
    [self.dateLabel setFrame:CGRectMake(frame.size.width-210, 70, 130, 15)];
    [self.commentView setFrame:CGRectMake(frame.size.width-70, 70, 70, 15)];
    
    
    
    /**
     填充数据
     */
    [self.storyComicNewsImageView sd_setImageWithURL:[NSURL URLWithString:model.url]];
    [self.titleLabel setText:model.title];
    [self.describeLabel setText:model.describe];
    [self.authorLabel setText:model.author];
    [self.dateLabel setText:model.date];
    [self.commentView.supportImageView setImage:[UIImage imageNamed:model.supportImageName]];
    [self.commentView.numberLabel setText:model.supportNumber];
    
    switch (model.supportType)
    {
        case showType:
        {
            [self.commentView setHidden:NO];
        }
            break;
        case hiddenType:
        {
            [self.commentView setHidden:YES];
        }
            break;
    }
    
}




-(instancetype)initWithExaminationFailtypeFrame
{
    self = [super init];
    if (self)
    {
        [self addSubview:self.examinationFailLabel];
        [self addSubview:self.storyComicNewsImageView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.describeLabel];
        [self addSubview:self.authorLabel];
        [self addSubview:self.dateLabel];
        [self addSubview:self.commentView];
        
        
        [self setViewBackgroundColor:NO];
    }
    return self;
}
/**
 重置正常类型Frame
 */
-(void)resetWithExaminationFailFrame:(CGRect)frame withModel:(StoryComicNewsModel*)model
{
    /**
     给自己设置Frame
     */
    [self setFrame:frame];
    
    
    /**
     给每个空间设置Frame
     */
    [self.examinationFailLabel setFrame:CGRectMake(0, 0, frame.size.width, 20)];
    [self.storyComicNewsImageView setFrame:CGRectMake(5, 25, 120, 60)];
    [self.titleLabel setFrame:CGRectMake(130, 25, frame.size.width-135, 20)];
    [self.describeLabel setFrame:CGRectMake(130, 50, frame.size.width-135, 35)];
    [self.authorLabel setFrame:CGRectMake(5, 90, 100, 15)];
    [self.dateLabel setFrame:CGRectMake(frame.size.width-210, 90, 130, 15)];
    [self.commentView setFrame:CGRectMake(frame.size.width-70, 90, 70, 15)];
    
    
    
    /**
     填充数据
     */
    [self.examinationFailLabel setText:model.examinationFail];
    [self.storyComicNewsImageView sd_setImageWithURL:[NSURL URLWithString:model.url]];
    [self.titleLabel setText:model.title];
    [self.describeLabel setText:model.describe];
    [self.authorLabel setText:model.author];
    [self.dateLabel setText:model.date];
    [self.commentView.numberLabel setText:model.supportNumber];
    [self.commentView.supportImageView setImage:[UIImage imageNamed:model.supportImageName]];
    
    
    switch (model.supportType)
    {
        case showType:
        {
            [self.commentView setHidden:NO];
        }
            break;
        case hiddenType:
        {
            [self.commentView setHidden:YES];
        }
            break;
    }
}




-(void)setViewBackgroundColor:(BOOL)backgroundColor
{
    if (backgroundColor)
    {
        [self setBackgroundColor:[UIColor greenColor]];
        
        
        [self.storyComicNewsImageView setBackgroundColor:[UIColor redColor]];
        [self.titleLabel setBackgroundColor:[UIColor purpleColor]];
        [self.describeLabel setBackgroundColor:[UIColor orangeColor]];
        [self.authorLabel setBackgroundColor:[UIColor purpleColor]];
        [self.dateLabel setBackgroundColor:[UIColor redColor]];
        [self.commentView setBackgroundColor:[UIColor redColor]];
    }
    
    
    
   
    
}




#pragma mark Getter / Setter
-(UILabel *)examinationFailLabel
{
    if (_examinationFailLabel == nil)
    {
        _examinationFailLabel = [[UILabel alloc]init];
        [_examinationFailLabel setFont:[UIFont systemFontOfSize:15]];
        [_examinationFailLabel setBackgroundColor:RGB(254.0, 203, 156)];
    }
    return _examinationFailLabel;
}



-(UIImageView *)storyComicNewsImageView
{
    if (_storyComicNewsImageView == nil)
    {
        _storyComicNewsImageView = [[UIImageView alloc]init];
        [_storyComicNewsImageView setContentMode:UIViewContentModeScaleAspectFit];
    }
    return _storyComicNewsImageView;
}


-(UILabel *)titleLabel
{
    if (_titleLabel == nil)
    {
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setTextColor:[UIColor blackColor]];
        [_titleLabel setFont:[UIFont boldSystemFontOfSize:20.0]];
    }
    return _titleLabel;
}


-(UILabel *)describeLabel
{
    if (_describeLabel == nil)
    {
        _describeLabel = [[UILabel alloc]init];
        [_describeLabel setTextColor:RGB(114.0, 110.0, 110.0)];
        [_describeLabel setFont:[UIFont systemFontOfSize:13.0]];
        [_describeLabel setNumberOfLines:0];
    }
    return _describeLabel;
}


-(UILabel *)authorLabel
{
    if (_authorLabel == nil)
    {
        _authorLabel = [[UILabel alloc]init];
        [_authorLabel setTextColor:RGB(114.0, 110.0, 110.0)];
        [_authorLabel setFont:[UIFont systemFontOfSize:13.0]];
    }
    return _authorLabel;
}


-(UILabel *)dateLabel
{
    if (_dateLabel == nil)
    {
        _dateLabel = [[UILabel alloc]init];
        [_dateLabel setTextColor:RGB(114.0, 110.0, 110.0)];
        [_dateLabel setTextAlignment:NSTextAlignmentRight];
        [_dateLabel setFont:[UIFont systemFontOfSize:13.0]];
    }
    return _dateLabel;
}


-(SupportView *)commentView
{
    if (_commentView == nil)
    {
        _commentView = [[SupportView alloc]init];
    }
    return _commentView;
}





@end
