//
//  ZMGuideImageView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/11.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMGuideImageView.h"

@implementation ZMGuideImageView

/**
 superView:父亲视图
 */
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setImage:[UIImage imageNamed:@"Guid"]];  //添加教学提示页面
        [self setUserInteractionEnabled:YES];
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureRecognizer:)];
        [self addGestureRecognizer:tapGestureRecognizer];
        
    }
    return self;
}


-(void)tapGestureRecognizer:(UITapGestureRecognizer *)sender
{
    [NSUserDefaults setObject:AppVersion forKey:@"AppVersion"];
    [self removeFromSuperview];
}


-(void)startAddWithSuperView:(UIView*)superView
{
    
    if ([[NSUserDefaults objectForKey:@"AppVersion"] isEqualToString:AppVersion])
    {
        
    }
    else
    {
        [superView addSubview:self];
    }
}

@end
