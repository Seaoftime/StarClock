//
//  WMTencentManager.h
//
//  Created by ZhongMeng on 16/5/4.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "WMAuthManager.h"


#define QQAppID     @"1105458512"

#define QQAppKey     @"Rurza0jsTfalTlFO"

// Security.framework”, “libiconv.dylib”，“SystemConfiguration.framework”，“CoreGraphics.Framework”、“libsqlite3.dylib”、“CoreTelephony.framework”、“libstdc++.dylib”、“libz.dylib”

@interface WMTencentManager : NSObject

+ (BOOL)isAppInstalled;

+ (BOOL)handleOpenURL:(NSURL *)url;

+ (void)sendAuthWithBlock:(WMAuthBlock)result
             withUserInfo:(WMUserInfoBlock)block;

+ (BOOL)isUserInfo;
+ (NSString *)getUserName;
+ (NSString *)getUserAvatar;

@end
