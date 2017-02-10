//
//  NSString+URLEncoding.h
//  Translation
//
//  Created by yaolizhi on 14/12/18.
//  Copyright (c) 2014年 ZhongYeKeJiJiShuBu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (URLEncoding)

/**
 中文网址路径转换URLEncode,过滤特殊符号
 */
-(NSString *)URLEncodedString;

@end
