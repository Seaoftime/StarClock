//
//  SQLiteDBQueue.h
//  TryCan
//
//  Created by yaolizhi on 15/5/9.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

#import "FMDatabaseQueue.h"

@interface SQLiteDBQueue : FMDatabaseQueue


//单例类方法
+(SQLiteDBQueue*)sharedInstanceQueue;


@end
