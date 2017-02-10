//
//  AddClockView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/3.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "AddClockView.h"

@implementation AddClockView

-(instancetype)initWithFrame:(CGRect)frame withType:(int)type
{
    self = [super initWithFrame:frame];
    if (self)
    {
        switch (type)
        {
            case 1:
            {
                [self addSubview:self.titlabel];
                [self addSubview:self.describeLabel];
                [self addSubview:self.lineView];
            }
                break;
            case 2:
            {
                [self addSubview:self.titlabel];
                [self addSubview:self.onOrOffSwitch];
                [self addSubview:self.lineView];
            }
                break;
        }
    }
    return self;
}


-(ZMLabel *)titlabel
{
    if (_titlabel == nil)
    {
        _titlabel = [[ZMLabel alloc]initWithFrame:CGRectMake(10, 0, 100, self.frame.size.height)];
        [_titlabel setTextColor:RGB(89.0, 79.0, 42.0)];
    }
    return _titlabel;
}

-(ZMLabel *)describeLabel
{
    if (_describeLabel == nil)
    {
        _describeLabel = [[ZMLabel alloc]initWithFrame:CGRectMake(110, 0, kScreen_Width-150, self.frame.size.height)];
        [_describeLabel setTextAlignment:NSTextAlignmentRight];
        [_describeLabel setTextColor:RGB(172.0, 172.0, 172.0)];
    }
    return _describeLabel;
}

-(ZMSwitch*)onOrOffSwitch
{
    if (_onOrOffSwitch == nil)
    {
        _onOrOffSwitch = [[ZMSwitch alloc]initWithFrame:CGRectMake(kScreen_Width-70, 10, 200, 60)];
        [_onOrOffSwitch setTintColor:RGB(238.0, 45.0,240.0)];
        [_onOrOffSwitch setOnTintColor:RGB(238.0, 45.0,240.0)];
       
    }
    return _onOrOffSwitch;
}


-(ZMView *)lineView
{
    if (_lineView == nil)
    {
        _lineView = [[ZMView alloc]initWithFrame:CGRectMake(5, self.frame.size.height-1.0, kScreen_Width-10, 1.0)];
        [_lineView setBackgroundColor:LineViewColor];
    }
    return _lineView;
}


@end
