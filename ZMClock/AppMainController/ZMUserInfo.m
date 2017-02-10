//
//  ZMUserInfo.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/4.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMUserInfo.h"
#import "ZMBaseNavigationController.h"
#import "ZMLoginViewController.h"


@implementation ZMUserInfo

static ZMUserInfo *sharedObject = nil; //第一步：静态实例，并初始化。

+(ZMUserInfo*)sharedUserInfo
{
    static dispatch_once_t once;
    dispatch_once(&once,^{
        sharedObject = [[self alloc]init];
    });
    return sharedObject;
}



-(void)setUserInfo:(NSDictionary*)userInfo
{
    if (userInfo)
    {
    
        [NSUserDefaults setObject:userInfo forKey:@"用户信息"];
        
        //[sharedObject setStar_cur:[userInfo objectForKey:@"star_cur"]];
        [sharedObject setUser_id:[userInfo objectForKey:@"user_id"]];
        [sharedObject setSign:[userInfo objectForKey:@"sign"]];
    }
    
}


- (void)getUserInfo
{
    [self setUserInfo:[NSUserDefaults objectForKey:@"用户信息"]];
}


/**
 检查用户是否已经获取到用户信息了
 */
- (BOOL)isUserInfo
{
    if (sharedObject.user_id && sharedObject.sign)
    {
        return YES;
    }
    else
    {   
        [[MainViewControllerHelper sharedMainHelper] resetLoginWithType:2];
        
        return NO;
    }
}
@end
