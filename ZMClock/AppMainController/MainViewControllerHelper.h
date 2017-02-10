//
//  MainViewControllerHelper.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/4.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainViewControllerHelper : NSObject


+ (MainViewControllerHelper*)sharedMainHelper;



#pragma mark - 根据状态作出相应的处理
/**
 根据状态作出相应的处理
 */
-(BOOL)statusWith:(id)object;


#pragma mark - 根据提交状态作出相应的处理
/**
 根据状态作出相应的处理
 */
-(BOOL)submitStatusWith:(id)object;



#pragma mark - 重新回到登录界面进行登录
/**
 重新回到登录界面进行登录
 */
-(void)resetLoginWithType:(int)type;


@end
