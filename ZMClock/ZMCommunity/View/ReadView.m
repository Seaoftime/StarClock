//
//  ReadView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/29.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ReadView.h"

@implementation ReadView
/**
 该视图大小为宽度为45，高度为15
 */
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addSubview:self.commentImageView];
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
        [self addSubview:self.commentImageView];
        [self.commentImageView setFrame:CGRectMake(0, 0, 15, 15)];
        
        [self addSubview:self.numberLabel];
        [self.numberLabel setFrame:CGRectMake(15, 0, 55, 15)];
    }
    return self;
}



-(UIImageView*)commentImageView
{
    if (_commentImageView == nil)
    {
        _commentImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,15, 15)];
        [_commentImageView setContentMode:UIViewContentModeScaleAspectFit];
        [_commentImageView setImage:[UIImage imageNamed:@"阅读"]];
    }
    return _commentImageView;
}


-(UILabel *)numberLabel
{
    if (_numberLabel == nil)
    {
        _numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, self.frame.size.width-15, 15)];
        [_numberLabel setFont:[UIFont systemFontOfSize:14.0]];
        [_numberLabel setBackgroundColor:[UIColor grayColor]];
        [_numberLabel setTextAlignment:NSTextAlignmentCenter];
    }
    return _numberLabel;
}




@end
