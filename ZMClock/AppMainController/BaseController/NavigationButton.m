//
//  YZButton.m
//  TraBook
//
//  Created by Yaolizhi on 16/3/9.
//  Copyright © 2016年 zhs. All rights reserved.
//

#import "NavigationButton.h"

@interface NavigationButton ()

@end


@implementation NavigationButton

#pragma mark  同时设置标题和图片
/**
 同时设置标题和图片
 */
-(void)setitemTitle:(NSString*)title withImage:(NSString*)image withItemEdgeInsets:(ItemEdgeInsets)edgeInsets
{
    switch (edgeInsets)
    {
        case ItemLeft:
        {
            [self setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 10, 50)];
            [self setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
            [self setTitle:title forState:UIControlStateNormal];
            [self setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        }
            break;
        case ItemRight:
        {
            [self setImageEdgeInsets:UIEdgeInsetsMake(10, 50, 10, 0)];
            [self setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 30)];
            [self setTitle:title forState:UIControlStateNormal];
            [self setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
        }
            break;
    }
}

#pragma mark  只设置标题
/**
 只设置标题
 */
-(void)setitemTitle:(NSString*)title withItemEdgeInsets:(ItemEdgeInsets)edgeInsets
{
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [self setTitle:title forState:UIControlStateNormal];
    switch (edgeInsets)
    {
        case ItemLeft:
        {
            [self setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        }
            break;
        case ItemRight:
        {
            [self setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
        }
            break;
    }
    
}

#pragma mark  只设置图片
/**
 只设置图片
 */
-(void)setitemImage:(NSString*)image withItemEdgeInsets:(ItemEdgeInsets)edgeInsets
{
    
    switch (edgeInsets)
    {
        case ItemLeft:
        {
            [self setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 10, 50)];
            [self setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
            [self setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        }
            break;
        case ItemRight:
        {
            [self setImageEdgeInsets:UIEdgeInsetsMake(50, 10, 10, 0)];
            [self setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
            [self setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        }
            break;
    }
}


@end
