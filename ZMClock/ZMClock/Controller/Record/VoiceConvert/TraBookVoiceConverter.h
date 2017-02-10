//
//  VoiceConverter.h
//  Jeans
//
//  Created by Jeans Huang on 12-7-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TraBookVoiceConverter : NSObject

+ (int)isMP3File:(NSString *)filePath;

+ (int)isAMRFile:(NSString *)filePath;


/**
 amr格式转换为wav格式的音频文件
 */
+ (int)amrToWav:(NSString*)amrPath wavSavePath:(NSString*)savePath;

/**
 wav格式转换为amr格式的音频文件
 */
+ (int)wavToAmr:(NSString*)wavPath amrSavePath:(NSString*)savePath;

@end
