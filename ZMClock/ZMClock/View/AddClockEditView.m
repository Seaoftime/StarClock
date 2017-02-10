//
//  AddClockEditView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/3.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "AddClockEditView.h"

@implementation AddClockEditView



-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addSubview:self.titleLabel];
        [self addSubview:self.lineView];
    }
    return self;
}


-(ZMLabel *)titleLabel
{
    if (_titleLabel == nil)
    {
        _titleLabel = [[ZMLabel alloc]initWithFrame:CGRectMake(10, 0, kScreen_Width-20, self.frame.size.height)];
        [_titleLabel setFont:[UIFont systemFontOfSize:15.0]];
//        [_titleLabel setBackgroundColor:[UIColor redColor]];
    }
    return _titleLabel;
}



-(ZMView *)lineView
{
    if (_lineView == nil)
    {
        _lineView = [[ZMView alloc]initWithFrame:CGRectMake(10, self.frame.size.height-1.0, kScreen_Width-20, 1.0)];
        [_lineView setBackgroundColor:LineViewColor];
    }
    return _lineView;
}

@end
