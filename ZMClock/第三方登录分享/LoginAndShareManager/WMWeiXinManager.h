//
//  WMWeiXinManager.h
//
//  Created by ZhongMeng on 16/5/4.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WMAuthManager.h"

#define WXAppKey    @"wx37496a0e9d616484"
#define WXSecret    @"c454b6604b65cf4bb852fc4ac27cb50f"

// SystemConfiguration.framework,libz.dylib,libsqlite3.0.dylib

@interface WMWeiXinManager : NSObject 

+ (BOOL)isAppInstalled;

+ (void)registerApp;

+ (BOOL)handleOpenURL:(NSURL *)url;

+ (void)sendAuthWithBlock:(WMAuthBlock)result
             withUserInfo:(WMUserInfoBlock)block
           withController:(UIViewController *)viewController;

+ (BOOL)isUserInfo;
+ (NSString *)getUserName;
+ (NSString *)getUserAvatar;

// 分享到微信好友
+ (void)shareFirend:(NSString *)title
        description:(NSString *)description
              thumb:(UIImage *)image
                url:(NSString *)url
             result:(WMShareBlock)result;
// 分享到微信朋友圈
+ (void)shareFirends:(NSString *)title
         description:(NSString *)description
               thumb:(UIImage *)image
                 url:(NSString *)url
              result:(WMShareBlock)result;

@end
