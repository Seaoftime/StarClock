//
//  ClockItemView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/2.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ClockItemView.h"

@implementation ClockItemView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
//        [self setBackgroundColor:[UIColor grayColor]];
        [self addSubview:self.titleLabel];
        [self addSubview:self.describeLabel];
        [self addSubview:self.onOrOffSwitch];
        [self addSubview:self.lineView];
    }
    return self;
}


-(void)resetWithTitle:(NSString*)title withDescribe:(NSString*)describe withOnorOff:(NSString*)onoff
{
    [self.titleLabel setText:title];
    [self.describeLabel setText:describe];
    if ([onoff isEqualToString:@"关闭"])
    {
     
        [self.titleLabel setTextColor:RGB(172.0, 172.0, 172.0)];
        [self.describeLabel setTextColor:MainColor];
        [self setBackgroundColor:[UIColor clearColor]];
        [self.onOrOffSwitch setOn:NO];
    }
    else if ([onoff isEqualToString:@"开启"])
    {
        [self.onOrOffSwitch setOn:YES];
        [self.titleLabel setTextColor:RGB(125.0, 91.0, 118.0)];
        [self.describeLabel setTextColor:RGB(125.0, 91.0, 118.0)];
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    
}




#pragma mark - Getter/Setter Method
-(ZMLabel*)titleLabel
{
    if (_titleLabel == nil)
    {
        _titleLabel = [[ZMLabel alloc]initWithFrame:CGRectMake(15, 10, kScreen_Width-130.0, 40)];
        [_titleLabel setFont:[UIFont boldSystemFontOfSize:35.0]];
    }
    return _titleLabel;
}



-(ZMLabel *)describeLabel
{
    if (_describeLabel == nil)
    {
        _describeLabel = [[ZMLabel alloc]initWithFrame:CGRectMake(15, 50, kScreen_Width-130.0, 20)];
        [_describeLabel setFont:[UIFont systemFontOfSize:15.0]];
    }
    return _describeLabel;
}


-(ZMSwitch*)onOrOffSwitch
{
    if (_onOrOffSwitch == nil)
    {
        _onOrOffSwitch = [[ZMSwitch alloc]initWithFrame:CGRectMake(kScreen_Width-60, 25, 200, 60)];
        [_onOrOffSwitch setTintColor:RGB(238.0, 45.0,240.0)];
        [_onOrOffSwitch setOnTintColor:RGB(238.0, 45.0,240.0)];
        [_onOrOffSwitch addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _onOrOffSwitch;
}

-(ZMView*)lineView
{
    if (_lineView == nil)
    {
        _lineView = [[ZMView alloc]initWithFrame:CGRectMake(5, self.frame.size.height-1.0, kScreen_Width-10, 1.0)];
        [_lineView setBackgroundColor:LineViewColor];
    }
    return _lineView;
}


-(void)action:(ZMSwitch*)sender
{
    
}

@end
