//
//  LeftHelperControl.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/16.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "LeftHelperControl.h"

@implementation LeftHelperControl

-(instancetype)initWithFrame:(CGRect)frame withDeletae:(id<LeftHelperControlDeletage>)deletage
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setDeletage:deletage];
        [self addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.leftHelperView];
        [self.leftHelperView resetLeftHelperFrame:CGRectMake(-75 ,70,75, 250)];
    }
    return self;
}


#pragma mark - Getter / Setter
-(LeftHelperView*)leftHelperView
{
    if (_leftHelperView == nil)
    {
        
        
        _leftHelperView = [[LeftHelperView alloc]init];
        [_leftHelperView.topButton addTarget:self action:@selector(leftHelperAction:) forControlEvents:UIControlEventTouchUpInside];
         [_leftHelperView.middleButton addTarget:self action:@selector(leftHelperAction:) forControlEvents:UIControlEventTouchUpInside];
        [_leftHelperView.bottomButton addTarget:self action:@selector(leftHelperAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _leftHelperView;
}


#pragma mark 展示左侧图片

-(void)show
{
    if ([self.deletage respondsToSelector:@selector(leftHelperAction:)])
    {
        [self.deletage leftHelperAction:30];
    }
    [UIView animateWithDuration:0.15 animations:^{
        
       [self.leftHelperView setFrame:CGRectMake(-5, 70, 75, 250)];
        
      
        
        [kWindow addSubview:self];
        
    } ];
}

-(void)dismiss
{
    if ([self.deletage respondsToSelector:@selector(leftHelperAction:)])
    {
        [self.deletage leftHelperAction:40];
    }
    [UIView animateWithDuration:0.15 animations:^{
        
        [self.leftHelperView setFrame:CGRectMake(-75, 70, 75, 250)];
        
       
        
    } completion:^(BOOL finished)
     {
         [self.leftHelperView removeFromSuperview];
         [self setLeftHelperView:nil];
         [self removeFromSuperview];
    }];
}
                                                                      




-(void)leftHelperAction:(ZMButton*)sender
{
    [self dismiss];
    if ([self.deletage respondsToSelector:@selector(leftHelperAction:)])
    {
        [self.deletage leftHelperAction:sender.tag];
    }
}



@end
