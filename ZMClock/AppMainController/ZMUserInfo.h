//
//  ZMUserInfo.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/4.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//   用户信息类（单例类）
//
//
//

#import <Foundation/Foundation.h>

@interface ZMUserInfo : NSObject

@property (nonatomic,retain) NSString *user_id; //!< 用户id
@property (nonatomic,retain) NSString *sign; //!< sign
@property (nonatomic,retain) NSString *star_cur; //!<关注的明星

+(ZMUserInfo*)sharedUserInfo;



#pragma mark 设置用户信息
/**
 设置用户信息
 */
-(void)setUserInfo:(NSDictionary*)userInfo;

#pragma mark 获取用户信息
/**
 获取用户信息
 */
- (void)getUserInfo;


#pragma mark 检查用户是否已经获取到用户信息了
/**
 检查用户是否已经获取到用户信息了
 */
- (BOOL)isUserInfo;







@end
