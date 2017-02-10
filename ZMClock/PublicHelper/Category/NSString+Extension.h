//
//  NSString+Extension.h
//  GaGaHi
//
//  Created by IOSDevoper on 15/8/10.
//  Copyright (c) 2015年 Zonyet. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <CommonCrypto/CommonCrypto.h>
#include <CommonCrypto/CommonDigest.h>
#include <zlib.h>

@interface NSString (Extension)

- (NSString *)getNull;

- (BOOL)isChinese;

- (NSString *)FilterString;

//计算字符串size
- (CGSize)getSizeWithFont:(CGFloat)font maxWidth:(CGFloat)maxWidth;
/**数据埋点清洗上传数据*/
- (NSString *)cleanJsonHeadStrWithStr:(NSString *)jsonStr;


-(NSString *)md5;

//把图片转成base64形式
+(NSData*)dataFromImage:(UIImage*)image;

+(NSString*)base64StringFromImage:(UIImage*)image;


@end
