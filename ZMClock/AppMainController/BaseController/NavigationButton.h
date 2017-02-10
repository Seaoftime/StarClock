//
//  YZButton.h
//  TraBook
//
//  Created by Yaolizhi on 16/3/9.
//  Copyright © 2016年 zhs. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>




typedef NS_ENUM(NSInteger ,ItemEdgeInsets)
{
    ItemLeft = 0,
    ItemRight = 1,
};


@interface NavigationButton : UIButton






#pragma mark  同时设置标题和图片
/**
 同时设置标题和图片
 */
-(void)setitemTitle:(NSString*)title withImage:(NSString*)image withItemEdgeInsets:(ItemEdgeInsets)edgeInsets;

#pragma mark  只设置标题
/**
 只设置标题
 */
-(void)setitemTitle:(NSString*)title withItemEdgeInsets:(ItemEdgeInsets)edgeInsets;

#pragma mark  只设置图片
/**
 只设置图片
 */
-(void)setitemImage:(NSString*)image withItemEdgeInsets:(ItemEdgeInsets)edgeInsets;

@end
