//
//  NSFileManagerHelper.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/25.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//



#import "NSFileManagerHelper.h"




@implementation NSFileManagerHelper

static NSFileManagerHelper *SharedFileManagerHelper = nil; //第一步：静态实例，并初始化。

//单例类方法
+(NSFileManagerHelper*)sharedInstance
{
    static dispatch_once_t once;
    dispatch_once(&once,^{
        
        SharedFileManagerHelper = [[self alloc]init];
        
    });
    
    return SharedFileManagerHelper;
}


/**
 创建目录文件夹
 */
-(void)createDirectoryAtPath:(NSString*)path
{
    NSString *directoryPath = [HomeDirectoryDocumentFilePath stringByAppendingPathComponent:path];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:directoryPath])
    {
        NSError *error = nil;
        [[NSFileManager defaultManager] createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:&error];
        if (error)
        {
            [[NSFileManager defaultManager] createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:&error];
        }
    }
}

/**
 复制文目录文件夹到制定的目录内
 */
-(BOOL)copyItemAtPath:(NSString*)copyPath toPath:(NSString*)toPath
{
    copyPath = [HomeDirectoryDocumentFilePath stringByAppendingPathComponent:copyPath];
    toPath = [HomeDirectoryDocumentFilePath stringByAppendingPathComponent:toPath];
    
    NSError *error = nil;
    [[NSFileManager defaultManager] copyItemAtPath:copyPath toPath:toPath error:&error];
    if (error)
    {
        return NO;
    }
    return YES;
}


/**
 获取目录文件夹
 */
-(NSString*)getDirectoryAtPath:(NSString *)path
{
    path = [HomeDirectoryDocumentFilePath stringByAppendingPathComponent:path];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        return path;
    }
    return nil;
}


@end
