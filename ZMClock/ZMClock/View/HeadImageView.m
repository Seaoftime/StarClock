//
//  HeadImageView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/21.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "HeadImageView.h"


@implementation HeadImageView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setUserInteractionEnabled:YES];
        [self setImage:[UIImage imageNamed:@"导航条.png"]];
        [self addSubview:self.customTinkleButton];
        [self addSubview:self.systemTinkleButton];
    }
    return self;
}


-(ZMButton*)customTinkleButton
{
    if (_customTinkleButton == nil)
    {
        _customTinkleButton = [[ZMButton alloc]initWithFrame:CGRectMake(kScreen_Width/4-125/2, 5, 125, 45)];
        [_customTinkleButton setImage:[UIImage imageNamed:@"特色铃声.png"] forState:UIControlStateNormal];
        [_customTinkleButton setTag:1];
        
//        [_customTinkleButton setBackgroundColor:[UIColor greenColor]];
    }
    return _customTinkleButton;
}


-(ZMButton*)systemTinkleButton
{
    if (_systemTinkleButton == nil)
    {
        _systemTinkleButton = [[ZMButton alloc]initWithFrame:CGRectMake(kScreen_Width/2+(kScreen_Width/4-125/2), 5, 125, 45)];
        [_systemTinkleButton setImage:[UIImage imageNamed:@"系统铃声.png"] forState:UIControlStateNormal];
        [_systemTinkleButton setTag:2];
        
//        [_systemTinkleButton setBackgroundColor:[UIColor purpleColor]];
    }
    return _systemTinkleButton;
}

@end
