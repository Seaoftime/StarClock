//
//  SettingHeaderView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/2.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "SettingHeaderView.h"

@implementation SettingHeaderView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setBackgroundColor:RGB(87.0, 130.0, 198.0)];
        [self addSubview:self.headButton];
        [self addSubview:self.nickNameLabel];
        [self addSubview:self.recordButton];
    }
    return self;
}



-(ZMButton*)headButton
{
    if (_headButton == nil)
    {
        _headButton = [[ZMButton alloc]initWithImageViewFrame:CGRectMake(kScreen_Width/2-60.0/2, 20.0, 60.0, 60.0) withImageNamed:@"defaultPortrait"];
        [_headButton.layer setCornerRadius:60.0/2];
        [_headButton.layer setMasksToBounds:YES];
    }
    return _headButton;
}


-(ZMLabel*)nickNameLabel
{
    if (_nickNameLabel == nil)
    {
        _nickNameLabel = [[ZMLabel alloc]initWithFrame:CGRectMake(0, 85, kScreen_Width, 15)];
        [_nickNameLabel setFont:[UIFont systemFontOfSize:15.0]];
        [_nickNameLabel setTextColor:[UIColor whiteColor]];
        [_nickNameLabel setTextAlignment:NSTextAlignmentCenter];
        [_nickNameLabel setText:@"😄中梦会员🐯"];
        
        
//        [_nickNameLabel setBackgroundColor:[UIColor redColor]];
    }
    return _nickNameLabel;
}


-(ZMButton*)recordButton
{
    if (_recordButton == nil)
    {
        _recordButton = [[ZMButton alloc]initWithImageViewFrame:CGRectMake(0,120 , kScreen_Width, 80) withImageNamed:@"defaultPortrait" withOneTitle:@"个性语音" withTwoTitle:@"甜美气质版"];
        [_recordButton addTarget:self action:@selector(setHeaderAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _recordButton;
}


-(void)setHeaderAction:(ZMButton*)sender
{
    if ([self.headerDeletage respondsToSelector:@selector(settingHeaderAction:)])
    {
        [self.headerDeletage settingHeaderAction:sender];
    }
    
}


@end
