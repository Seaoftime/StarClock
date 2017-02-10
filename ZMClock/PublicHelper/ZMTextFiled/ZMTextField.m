//
//  ZMTextField.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/7.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMTextField.h"

@interface ZMTextField ()

/**
 完成按钮
 */
@property (nonatomic,strong) ZMButton *doneButton;




@end



@implementation ZMTextField


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
        _doneButton = [[ZMButton alloc]initWithFrame:CGRectMake(0, 0,kScreen_Width, 30)];
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
