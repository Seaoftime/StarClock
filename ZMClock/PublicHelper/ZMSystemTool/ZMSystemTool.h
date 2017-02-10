//
//  ZMSystemTool.h
//  ZMClock
//
//  Created by ZhongMeng on 16/7/15.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZMSystemTool : NSObject

///屏幕
+ (CGRect)screenBounds;

+ (CGSize)deviceScreenSize;

+ (BOOL)iPadDevice;

+ (BOOL)iPhone4Device;

+ (BOOL)iPhone5Device;

+ (BOOL)iPhone6Device;

+ (BOOL)iPhone6PlusDevice;





@end
