//
//  ZMSystemTool.m
//  ZMClock
//
//  Created by ZhongMeng on 16/7/15.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMSystemTool.h"


#import <CoreGraphics/CoreGraphics.h>


@implementation ZMSystemTool


+ (CGRect)screenBounds
{
    return [UIScreen mainScreen].bounds;
}

+ (CGSize)deviceScreenSize
{
    return [UIScreen mainScreen].bounds.size;
}

+ (BOOL)iPadDevice
{
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}

+ (BOOL)iPhone4Device
{
    return CGSizeEqualToSize((CGSize){320,480}, [ZMSystemTool deviceScreenSize]);
}

+ (BOOL)iPhone5Device
{
    return CGSizeEqualToSize((CGSize){320,568}, [ZMSystemTool deviceScreenSize]);
    
}

+ (BOOL)iPhone6Device
{
    return CGSizeEqualToSize((CGSize){375,667}, [ZMSystemTool deviceScreenSize]);
}

+ (BOOL)iPhone6PlusDevice
{
    return CGSizeEqualToSize((CGSize){414,736}, [ZMSystemTool deviceScreenSize]);
}





@end
