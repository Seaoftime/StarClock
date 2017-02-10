//
//  FaceGrindingImage.h
//  ZMClock
//
//  Created by ZhongMeng on 16/7/6.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface FaceGrindingImage : NSObject

//磨皮算法处理
+ (UIImage*)imageByBilateralFilterImage:(UIImage*)img distance:(CGFloat)distance;


@end
