//
//  SupportView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/27.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "SupportView.h"

@implementation SupportView

/**
 该视图大小为宽度为45，高度为15
 */
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addSubview:self.supportImageView];
        [self addSubview:self.numberLabel];
    }
    return self;
}



/**
 该视图大小为宽度为45，高度为15
 */
-(instancetype)init
{
    self = [super init];
    if (self)
    {
        [self addSubview:self.supportImageView];
        [self addSubview:self.numberLabel];
    }
    return self;
}


-(UIImageView*)supportImageView
{
    if (_supportImageView == nil)
    {
        _supportImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,15, 15)];
        [_supportImageView setContentMode:UIViewContentModeScaleAspectFit];
    }
    return _supportImageView;
}


-(UILabel *)numberLabel
{
    if (_numberLabel == nil)
    {
        _numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 60, 15)];
        [_numberLabel setFont:[UIFont systemFontOfSize:12.0]];
        [_numberLabel setTextColor:RGB(114.0, 110.0, 110.0)];
    }
    return _numberLabel;
}


-(void)setModel:(StoryComicNewsInfoModel *)model
{
    _model = model;
    [self.numberLabel setText:model.supportNumer];
    switch (model.can_like)
    {
        case 1:
        {
            [self.supportImageView setImage:[UIImage imageNamed:@"点赞灰"]];
            [self setEnabled:YES];
        }
            break;
        case 2:
        {
            [self.supportImageView setImage:[UIImage imageNamed:@"点赞绿"]];
            [self setEnabled:NO];
        }
            break;
        default:
        {
            [self.supportImageView setImage:[UIImage imageNamed:@"点赞灰"]];
            [self setEnabled:YES];
        }
            break;
    }
    
    
    
    
    
    
}


@end
