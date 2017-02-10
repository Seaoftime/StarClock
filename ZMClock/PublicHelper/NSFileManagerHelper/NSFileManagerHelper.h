//
//  NSFileManagerHelper.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/25.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>


#define KWeatherPath @"WeatherTemp"
#define KColockPath @"ColockTemp"




@interface NSFileManagerHelper : NSObject



//单例类方法
+(NSFileManagerHelper*)sharedInstance;



/**
 创建目录文件夹
 */
-(void)createDirectoryAtPath:(NSString*)path;


/**
 复制文目录文件夹到制定的目录内
 */
-(BOOL)copyItemAtPath:(NSString*)copyPath toPath:(NSString*)toPath;



/**
 获取目录文件夹
 */
-(NSString*)getDirectoryAtPath:(NSString *)path;



@end
