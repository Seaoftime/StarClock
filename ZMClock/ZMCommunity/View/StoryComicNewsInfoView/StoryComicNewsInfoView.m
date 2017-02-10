//
//  StoryComicNewsInfoView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/27.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "StoryComicNewsInfoView.h"


@interface StoryComicNewsInfoView ()



@end

@implementation StoryComicNewsInfoView

#pragma mark - 初始化方法
#pragma mark  标题初始化视图
-(instancetype)initWithTitle
{
    self = [super init];
    if (self)
    {
        [self addSubview:self.titleLael];
        [self addSubview:self.dateLabel];
        [self addSubview:self.sourceLabel];
    }
    return self;
}


#pragma mark  内容初始化视图
-(instancetype)initWithDescribe
{
    self = [super init];
    if (self)
    {
        [self addSubview:self.describeLabel];
    }
    return self;
}

#pragma mark 图片视图初始化视图
-(instancetype)initWithImageView
{
    self = [super init];
    if (self)
    {
        [self addSubview:self.imageView];
    }
    return self;
}


#pragma mark  小编、阅读、评论、点赞 初始化视图
-(instancetype)initWithAuthorAndSupportComment
{
    self = [super init];
    if (self)
    {
        [self addSubview:self.topLineView];
        [self addSubview:self.authorLabel];
        [self addSubview:self.bottomLineView];
        [self addSubview:self.readNumberView];
        [self addSubview:self.commentView];
        [self addSubview:self.supportView];
    }
    return self;
}



#pragma mark  评论内容初始化视图
-(instancetype)initWithComment
{
    self = [super init];
    if (self)
    {
        [self addSubview:self.imageView];
        [self addSubview:self.nickNameLael];
        [self addSubview:self.levelView];
        [self addSubview:self.dateLabel];
        [self addSubview:self.describeLabel];
    }
    return self;
}



#pragma mark - Getter / Setter
-(UILabel *)titleLael
{
    if (_titleLael == nil)
    {
        _titleLael = [[UILabel alloc]init];
        [_titleLael setFont:[UIFont systemFontOfSize:15.0]];
    }
    return _titleLael;
}

-(UILabel *)nickNameLael
{
    if (_nickNameLael == nil)
    {
        _nickNameLael = [[UILabel alloc]init];
        [_nickNameLael setFont:[UIFont systemFontOfSize:13.0]];
    }
    return _nickNameLael;
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


-(UILabel *)sourceLabel
{
    if (_sourceLabel == nil)
    {
        _sourceLabel = [[UILabel alloc]init];
        [_sourceLabel setTextColor:RGB(114.0, 110.0, 110.0)];
        [_sourceLabel setFont:[UIFont systemFontOfSize:13.0]];
    }
    return _sourceLabel;
}


-(UILabel *)describeLabel
{
    if (_describeLabel == nil)
    {
        _describeLabel = [[UILabel alloc]init];
        [_describeLabel setNumberOfLines:0];
        [_describeLabel setTextColor:RGB(82.0, 79.0, 79.0)];
        [_describeLabel setFont:[UIFont systemFontOfSize:13.0]];
    }
    return _describeLabel;
}



-(UIImageView*)imageView
{
    if (_imageView == nil)
    {
        _imageView = [[UIImageView alloc]init];
    }
    return _imageView;
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


-(SupportView *)readNumberView
{
    if (_readNumberView == nil)
    {
        _readNumberView = [[SupportView alloc]init];
    }
    return _readNumberView;
}


-(SupportView*)commentView
{
    if (_commentView == nil)
    {
        _commentView = [[SupportView alloc]init];
    }
    return _commentView;
}


-(SupportView *)supportView
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

-(UIView *)topLineView
{
    if (_topLineView == nil)
    {
        _topLineView = [[UIView alloc]init];
        [_topLineView setBackgroundColor:LineViewColor];
    }
    return _topLineView;
}

-(UIView *)bottomLineView
{
    if (_bottomLineView == nil)
    {
        _bottomLineView = [[UIView alloc]init];
        [_bottomLineView setBackgroundColor:LineViewColor];
    }
    return _bottomLineView;
}



@end
