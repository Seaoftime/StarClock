//
//  MainViewControllerHelper.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/4.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "MainViewControllerHelper.h"
#import "ZMBaseNavigationController.h"
#import "ZMMainViewController.h"
#import "ZMLoginViewController.h"

@implementation MainViewControllerHelper

static MainViewControllerHelper *sharedObject = nil; //第一步：静态实例，并初始化。

+(MainViewControllerHelper*)sharedMainHelper
{
    static dispatch_once_t once;
    dispatch_once(&once,^{
        sharedObject = [[self alloc]init];
    });
    return sharedObject;
}


#pragma mark - 根据状态作出相应的处理
/**
 根据状态作出相应的处理
 */
- (BOOL)statusWith:(id)object
{
    NSInteger status_int = [[object objectForKey:@"status"] integerValue];
    switch (status_int)
    {
        case 0:
        {
            return YES;
        }
            break;
        case 1:
        {
            [[MainViewControllerHelper sharedMainHelper] resetLoginWithType:2];
            return NO;
        }
            break;
        case 2:
        {
            
            NSString *msg = @"刷新成功!";
            
            [AnyObjectActivityView showWithTitle:msg wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
            
            
            return NO;
        }
            break;
        default:
        {
            NSString *msg = [object objectForKey:@"msg"];
           
            [AnyObjectActivityView showWithTitle:msg wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
            
            return NO;
        }
            break;
    }
    return YES;
}





#pragma mark - 根据提交状态作出相应的处理
/**
 根据状态作出相应的处理
 */
-(BOOL)submitStatusWith:(id)object
{
    NSInteger status_int = [[object objectForKey:@"status"] integerValue];
    switch (status_int)
    {
        case 0:
        {
            return YES;
        }
            break;
        case 1:
        {
            [[MainViewControllerHelper sharedMainHelper] resetLoginWithType:2];
            return NO;
        }
            break;
        default:
        {
            return NO;
        }
            break;
    }
    return YES;
}










#pragma mark -----  重新回到登录界面进行登录
/**
 重新回到登录界面进行登录
 1:为直接回到主界面
 2:登录过期,重新登录
 */
- (void)resetLoginWithType:(int)type
{
    switch (type)
    {
        case 1:
        {
            //登录成功
            [NSUserDefaults standardUserDefaults].notLoginOrLogin = @"login";
            
            
            
            ZMBaseNavigationController *navRoot = [[ZMBaseNavigationController alloc]initWithRootViewController:[ZMMainViewController alloc]];
            [kWindow setRootViewController:navRoot];
            
            
            
            
            
        }
            break;
        case 2:
        {
            //ZMBaseNavigationController *navRoot = [[ZMBaseNavigationController alloc]initWithRootViewController:[ZMLoginViewController alloc]];
            //[kWindow setRootViewController:navRoot];
            
            [AnyObjectActivityView showWithTitle:@"请登录..." wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
            
            
            ///未登录状态
            
            [NSUserDefaults standardUserDefaults].notLoginOrLogin = @"notLogin";
            
            
            

        }
            break;
    }
    
    
}

@end
