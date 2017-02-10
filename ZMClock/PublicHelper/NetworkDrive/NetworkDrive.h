//
//  NetworkDrive.h
//  Translation
//
//  Created by yaolizhi on 14/12/18.
//  Copyright (c) 2014年 ZhongYeKeJiJiShuBu. All rights reserved.
//
//
//  网络请求类
//


#import <Foundation/Foundation.h>
#import "NSString+URLEncoding.h"

typedef  void (^SucessBlock)(id Object);

typedef  void (^ErrorBlock)(NSError *Error);

@interface NetworkDrive : NSObject


+(NetworkDrive*)sharedInstance;

#pragma mark --- Get方式的请求
/**
 Get方式请求
 */
-(void)GetWithUrl:(NSString *)Url Sucess:(SucessBlock)SucessBlock Error:(ErrorBlock)ErrorBlock;

#pragma mark --- Post的方法
/**
 Post请求
 */
-(void)PostWithUrl:(NSString *)Url TheParmeter:(NSDictionary *)Parmerte Sucess:(SucessBlock)sucessBlock Error:(ErrorBlock)ErrorBlock;

#pragma mark ---- Put的方法
/**
 Put请求
 */
-(void)PutWithUrl:(NSString *)Url TheParmeter:(NSDictionary *)Parmerte Sucess:(SucessBlock)SucessBlock Error:(ErrorBlock)ErrorBlock;

#pragma mark --- Get方式的请求
/**
 Delete方式请求
 */
-(void)DeleteWithUrl:(NSString *)Url Sucess:(SucessBlock)SucessBlock Error:(ErrorBlock)ErrorBlock;


@end
