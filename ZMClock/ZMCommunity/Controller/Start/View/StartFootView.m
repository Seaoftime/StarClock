//
//  StartFootView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/4.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "StartFootView.h"

@implementation StartFootView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addSubview:self.startTipLabel];
        [self.startTipLabel setFrame:CGRectMake(5, 0, kScreen_Width-10, 40)];
        
        [self addSubview:self.tipNameLabel];
        [self.tipNameLabel setFrame:CGRectMake(5, 60, 90, 20)];
        
        [self addSubview:self.inputTextField];
        [self.inputTextField setFrame:CGRectMake(100, 55, 120, 30)];
        
        [self addSubview:self.subMitButton];
        [self.subMitButton setFrame:CGRectMake(frame.size.width-90, 55, 80, 30)];
        [self.subMitButton.layer setCornerRadius:15.0];
    }
    return self;
}



#pragma  Getter / Setter
-(UILabel *)startTipLabel
{
    if (_startTipLabel == nil)
    {
        _startTipLabel = [[UILabel alloc]init];
        [_startTipLabel setFont:[UIFont systemFontOfSize:15.0]];
        [_startTipLabel setNumberOfLines:0];
        [_startTipLabel setText:@"列表中没有您喜欢的明星？在下面输入明星的名字，为他（她）创建一个吧"];
        
    }
    return _startTipLabel;
}

-(UILabel *)tipNameLabel
{
    if (_tipNameLabel == nil)
    {
        _tipNameLabel = [[UILabel alloc]init];
        [_tipNameLabel setFont:[UIFont systemFontOfSize:18.0]];
        [_tipNameLabel setText:@"明星名字"];
        
    }
    return _tipNameLabel;
}


-(ZMTextField *)inputTextField
{
    if (_inputTextField == nil)
    {
        _inputTextField = [[ZMTextField alloc]init];
        [_inputTextField setBackgroundColor:[UIColor whiteColor]];
    }
    return _inputTextField;
}

-(ZMButton*)subMitButton
{
    if (_subMitButton == nil)
    {
        _subMitButton = [[ZMButton alloc]init];
        [_subMitButton.layer setBorderWidth:2.0];
        [_subMitButton.layer setBorderColor:[MainColor CGColor]];
        [_subMitButton.titleLabel setFont:[UIFont systemFontOfSize:15.0]];
        [_subMitButton setTitleColor:MainColor forState:UIControlStateNormal];
        [_subMitButton setTitle:@"申请入住" forState:UIControlStateNormal];
    }
    return _subMitButton;
}



-(void)showBackgroundColor:(BOOL)backgroundColor
{
    [_tipNameLabel setBackgroundColor:[UIColor grayColor]];
    [_startTipLabel setBackgroundColor:[UIColor greenColor]];
}



@end
