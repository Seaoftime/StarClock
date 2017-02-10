//
//  CreateRecordToolView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/25.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "CreateRecordToolView.h"

@implementation CreateRecordToolView

-(instancetype)initWithFrame:(CGRect)frame setDeletage:(id<CreateRecordToolViewDeletage>)deletage
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setRecordToodeletage:deletage];
        [self addSubview:self.clearButton];
        [self addSubview:self.createButton];
        [self addSubview:self.resetButton];
    }
    return self;
}



-(ZMButton*)clearButton
{
    if (_clearButton == nil)
    {
        _clearButton = [[ZMButton alloc]initWithFrame:CGRectMake(25,70/2-40/2 , 73, 40)];
        [_clearButton setImage:[UIImage imageNamed:@"清空重录"] forState:UIControlStateNormal];
        [_clearButton addTarget:self action:@selector(recordButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_clearButton setTag:1];
        [_clearButton setHidden:YES];
    }
    return _clearButton;
}


-(ZMButton*)createButton
{
    if (_createButton == nil)
    {
        _createButton = [[ZMButton alloc]initWithBackViewFrame:CGRectMake(kScreen_Width/2-148/2,70/2-40/2 , 148, 40)];
        [_createButton setImage:[UIImage imageNamed:@"生成我的语音"] forState:UIControlStateNormal];
        [_createButton addTarget:self action:@selector(recordButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_createButton setBackViewEnabled:NO];
        [_createButton setTag:2];
    }
    return _createButton;
}



-(ZMButton*)resetButton
{
    if (_resetButton == nil)
    {
        _resetButton = [[ZMButton alloc]initWithFrame:CGRectMake(kScreen_Width-98,70/2-40/2 , 73, 40)];
        [_resetButton setImage:[UIImage imageNamed:@"重新生成"] forState:UIControlStateNormal];
        [_resetButton addTarget:self action:@selector(recordButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_resetButton setTag:3];
        [_resetButton setHidden:YES];
    }
    return _resetButton;
}









-(void)recordButtonAction:(ZMButton *)sender
{
    if ([self.recordToodeletage respondsToSelector:@selector(createRecordToolButtonAction:)])
    {
        [self.recordToodeletage createRecordToolButtonAction:sender];
    }
}
@end
