//
//  WMWeiboManager.h
//
//  Created by ZhongMeng on 16/5/4.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "WMAuthManager.h"

//#define WBAppKey    @"464916152"
#define WBAppKey    @"64841837"

//iOS 应用推荐使用默认授权回调页
#define kRedirectURI @"https://api.weibo.com/oauth2/default.html"


//QuartzCore.framework 、 ImageIO.framework 、 SystemConfiguration.framework 、 Security.framework 、CoreTelephony.framework 、 CoreText.framework 、 UIKit.framework 、 Foundation.framework 和 CoreGraphics.framework

@interface WMWeiboManager : NSObject

+ (BOOL)isAppInstalled;

+ (void)registerApp;

+ (BOOL)handleOpenURL:(NSURL *)url;

+ (void)sendAuthWithBlock:(WMAuthBlock)result
             withUserInfo:(WMUserInfoBlock)block;

+ (BOOL)isUserInfo;
+ (NSString *)getUserName;
+ (NSString *)getUserAvatar;

// 分享到微博
+ (void)shareWB:(NSString *)title
    description:(NSString *)description
          thumb:(NSData *)image
            url:(NSString *)url
         result:(WMShareBlock)result;

@end
