//
//  ZMTextView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/28.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMTextView.h"

@interface ZMTextView ()

@property (nonatomic,strong) ZMButton *doneButton;

@end

@implementation ZMTextView


-(instancetype)init
{
    self = [super init];
    if (self)
    {
        [self setInputAccessoryView:self.doneButton];
    }
    return self;
}



-(void)resetFrame:(CGRect)frame
{
    [self setFrame:frame];
    [self.doneButton setFrame:CGRectMake(0, 0,kScreen_Width, 30)];
}



-(ZMButton *)doneButton
{
    if (_doneButton == nil)
    {
        _doneButton = [[ZMButton alloc]init];
        [_doneButton setBackgroundColor:LineViewColor];
        [_doneButton setTitle:@"完成" forState:UIControlStateNormal];
        [_doneButton addTarget:self action:@selector(doneButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _doneButton;
}



-(void)doneButtonAction:(ZMButton*)sender
{
    [self resignFirstResponder];
}


@end
