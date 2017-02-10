//
//  UIImage+Category.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/17.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//











#import <UIKit/UIKit.h>

@interface UIImage (Category)

#pragma mark -  类方法截取图片
/**
 根据区域截取图片
 */
+(UIImage *)imageFromImage:(UIImage *)image inRect:(CGRect)rect;




#pragma mark 实例方法截取图片
/**
 根据区域截取图片
 */
-(UIImage *)imageAtRect:(CGRect)rect;




#pragma mark - fixOrientation
#pragma mark 调整图片的方法（因为有的图片是反的，这个方法就是把图片调正过来）
- (UIImage *)fixOrientation;



@end
