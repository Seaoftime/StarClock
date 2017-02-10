//
//  SQLiteStoreDBQueue.m
//  TryCan
//
//  Created by yaolizhi on 15/5/9.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

#import "SQLiteDBQueue.h"

@implementation SQLiteDBQueue


#pragma mark ------------------ 单例 ---------------------
static SQLiteDBQueue *SharedSQLiteDBQueue = nil; //第一步：静态实例，并初始化。

//单例类方法
+(SQLiteDBQueue*)sharedInstanceQueue
{
    
    static dispatch_once_t once;
    dispatch_once(&once,^{
        
        SharedSQLiteDBQueue = [SQLiteDBQueue databaseQueueWithPath:[self GetShareStoreDataBaseDocumentFilePath]];
        NSLog(@"数据库文件:%@",[self GetShareStoreDataBaseDocumentFilePath]);
        
    });
    
    return SharedSQLiteDBQueue;
}


/**
 获取iphone 沙盒目录下的数据库文件
 */
+(NSString*)GetIphoneStoreDocumentFilePath
{
    return [HomeDirectoryDocumentFilePath stringByAppendingPathComponent:@"data.sqlite3"];
    
    //打印沙盒目录查看对应数据库里的的数据
    //NSLog(@"-----GetIphoneStoreDocumentFilePath----%@---",GetIphoneStoreDocumentFilePath);
    
}


+(NSString*)GetShareStoreDataBaseDocumentFilePath
{
    /**
     首先判断该文件夹是否存在，如果存在就直接返回数据库的名字，
     不存在就先创建文件夹，然后在返回数据的库的名字
     */
    if ([[NSFileManager defaultManager] fileExistsAtPath:[self GetIphoneStoreDocumentFilePath]])
    {
        return  [self GetIphoneStoreDocumentFilePath];
        
    }
    else
    {
        return [self GetIphoneStoreDocumentFilePath];
        
    }
}

                                
                                
@end
