//
//  SQLiteDBManage.m
//  Translation
//
//  Created by yaolizhi on 14/12/21.
//  Copyright (c) 2014年 ZhongYeKeJiJiShuBu. All rights reserved.
//

#import "SQLiteDBManage.h"
#import "AddClockViewModel.h"
#import "ZMNewRecordMyMusicModel.h"


@implementation SQLiteDBManage



static SQLiteDBManage *SharedSQLiteDBManage = nil; //第一步：静态实例，并初始化。

//单例类方法
+(SQLiteDBManage*)sharedInstance
{
    static dispatch_once_t once;
    dispatch_once(&once,^{
        
        SharedSQLiteDBManage = [[self alloc]init];
        
    });
    
    return SharedSQLiteDBManage;
}


#pragma mark - 创建天气预报录音表
-(void)createWeatherTable
{
#pragma mark 【2】 创建表，如果没有该表就创建表，否则不会创建表
    //创建数据库和表，如果以上路径有数据库就创建表，如果该表存在就不创建表
    NSString *CREATESQL = @"create table if not exists WeatherTable (Weatherid integer primary key default 0,numer text default '',total text default '',recordcontent text default '',recordtype integer default 0)";
    
    [[SQLiteDBQueue sharedInstanceQueue] inTransaction:^(FMDatabase *db, BOOL *rollback)
     {
         [db executeUpdate:CREATESQL];
     }];
}




#pragma mark  插入天气录音内容
-(void)insertIntoWeatherTable
{
    NSArray *weatherArray = @[@"星恋天气为您播报最新天气情况",@"今天白天",@"今天夜间",@"明天白天",@"晴",@"多云",@"阴",@"阵雨",@"雷阵雨",@"雷阵雨伴有冰雹",@"雨夹雪",@"小雨",@"中雨",@"大雨",@"暴雨",@"大暴雨",@"特大暴雨",@"阵雪",@"小雪",@"中雪",@"大雪",@"暴雪",@"雾",@"冻雨",@"沙尘暴",@"浮尘",@"扬沙",@"强沙尘暴",@"霾",@"转",@"零",@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",@"十",@"摄氏度",@"最低温度",@"最高温度",@"零下",@"到",@"北风",@"南风",@"东风",@"西风",@"西南风",@"西北风",@"东南风",@"东北风",@"微风",@"级",@"小",@"中",@"大"];
    
    /*插入数据内容*/
    NSString *INSERTINTOSQL = [NSString stringWithFormat:@"insert into WeatherTable (Weatherid,numer,total,recordcontent) VALUES (?,?,?,?)"];
    NSInteger count = [weatherArray count];
    NSNumber *countNumber = [NSNumber numberWithInteger:count];
    for (int i = 0 ; i< count; i++)
    {
        NSString *content = [weatherArray objectAtIndex:i];
        NSNumber *number = [NSNumber numberWithInt:i+1];
        NSNumber *weatherid = [NSNumber numberWithInteger:i];
        
        if (i==0)
        {
            number = [NSNumber numberWithInt:1];
             NSString *insertinto = [NSString stringWithFormat:@"insert into WeatherTable (Weatherid,numer,total,recordcontent,recordtype) VALUES (?,?,?,?,?)"];
            [[SQLiteDBQueue sharedInstanceQueue]  inTransaction:^(FMDatabase *db, BOOL *rollback)
             {
                 [db executeUpdate:insertinto,weatherid,number,countNumber,content,[NSNumber numberWithInteger:1]];
             }];
        }
        else
        {
            [[SQLiteDBQueue sharedInstanceQueue]  inTransaction:^(FMDatabase *db, BOOL *rollback)
             {
                 [db executeUpdate:INSERTINTOSQL,weatherid,number,countNumber,content];
             }];
        }
    }
}


/**
查询所有数据
 */
-(NSMutableArray *)selectWeatherTable
{
    NSMutableArray *weatherArray = [NSMutableArray array];
    NSString *QUERYSQL = [NSString stringWithFormat:@"select numer,total,recordcontent,recordtype from WeatherTable"];
    /*插入数据内容*/
    [[SQLiteDBQueue sharedInstanceQueue]  inTransaction:^(FMDatabase *db, BOOL *rollback)
     {
         FMResultSet *Results = [db executeQuery:QUERYSQL];
         while ([Results next])
         {
             NSString *numer = [Results stringForColumn:@"numer"];
             NSString *total = [Results stringForColumn:@"total"];
             NSString *recordContent = [Results stringForColumn:@"recordContent"];
             NSInteger recordtype = [Results intForColumn:@"recordtype"];
             
             WeatherRecordModel *modele = [[WeatherRecordModel alloc]init];
             [modele setNumber:numer];
             [modele setTotal:total];
             [modele setRecordContent:recordContent];
             [modele setWeatherRecordType:recordtype];
             
             [weatherArray addObject:modele];
         }
     }];
    return weatherArray;
}



#pragma mark 更新录音状态
-(void)updateWeatherTableWithrecordContent:(NSString*)recordContent withrecordType:(NSString*)recordtype
{
    
    NSString *UPDATESQL = [NSString stringWithFormat:@"update WeatherTable  set recordtype = '%@' where numer = '%@'",recordtype,recordContent];
    
    [[SQLiteDBQueue sharedInstanceQueue] inTransaction:^(FMDatabase *db, BOOL *rollback)
     {
         [db executeUpdate:UPDATESQL];
     }];
}



#pragma mark - 创建闹钟表
#pragma mark  创建闹钟表
-(void)createClockTable
{
#pragma mark 【2】 创建表，如果没有该表就创建表，否则不会创建表
    //创建数据库和表，如果以上路径有数据库就创建表，如果该表存在就不创建表
    NSString *CREATESQL = @"create table if not exists ClockTable (Clockid integer primary key default 0,numer text default '',total text default '',recordcontent text default '',recordtype integer default 0)";
    
    [[SQLiteDBQueue sharedInstanceQueue] inTransaction:^(FMDatabase *db, BOOL *rollback)
     {
         [db executeUpdate:CREATESQL];
     }];
}




#pragma mark  插入闹钟内容
-(void)insertIntoClockTable
{
    NSArray *clockArray = @[@"星恋闹钟为您报时，现在是北京时间",@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",@"十",@"零",@"两",@"点",@"分",@"整"];
    
    /*插入数据内容*/
    NSString *INSERTINTOSQL = [NSString stringWithFormat:@"insert into ClockTable (Clockid,numer,total,recordcontent) VALUES (?,?,?,?)"];
    NSInteger count = [clockArray count];
    NSNumber *countNumber = [NSNumber numberWithInteger:count];
    for (int i = 0 ; i< count; i++)
    {
        NSString *content = [clockArray objectAtIndex:i];
        NSNumber *number = [NSNumber numberWithInt:i+1];
        NSNumber *weatherid = [NSNumber numberWithInteger:i];
        
        if (i==0)
        {
            number = [NSNumber numberWithInt:1];
            NSString *insertinto = [NSString stringWithFormat:@"insert into ClockTable (Clockid,numer,total,recordcontent,recordtype) VALUES (?,?,?,?,?)"];
            [[SQLiteDBQueue sharedInstanceQueue]  inTransaction:^(FMDatabase *db, BOOL *rollback)
             {
                 [db executeUpdate:insertinto,weatherid,number,countNumber,content,[NSNumber numberWithInteger:1]];
             }];
        }
        else
        {
            [[SQLiteDBQueue sharedInstanceQueue]  inTransaction:^(FMDatabase *db, BOOL *rollback)
             {
                 [db executeUpdate:INSERTINTOSQL,weatherid,number,countNumber,content];
             }];
        }
    }
}


/**
 查询所有数据
 */
-(NSMutableArray *)selectClockTable
{
    NSMutableArray *weatherArray = [NSMutableArray array];
    NSString *QUERYSQL = [NSString stringWithFormat:@"select numer,total,recordcontent,recordtype from ClockTable"];
    /*插入数据内容*/
    [[SQLiteDBQueue sharedInstanceQueue]  inTransaction:^(FMDatabase *db, BOOL *rollback)
     {
         FMResultSet *Results = [db executeQuery:QUERYSQL];
         while ([Results next])
         {
             NSString *numer = [Results stringForColumn:@"numer"];
             NSString *total = [Results stringForColumn:@"total"];
             NSString *recordContent = [Results stringForColumn:@"recordContent"];
             NSInteger weatherrecordtype = [Results intForColumn:@"recordtype"];
             
             WeatherRecordModel *modele = [[WeatherRecordModel alloc]init];
             [modele setNumber:numer];
             [modele setTotal:total];
             [modele setRecordContent:recordContent];
             [modele setWeatherRecordType:weatherrecordtype];
             
             [weatherArray addObject:modele];
         }
     }];
    return weatherArray;
}

#pragma mark 更新闹钟录音状态
-(void)updateClockTableWithrecordContent:(NSString*)recordContent withrecordType:(NSString*)recordtype
{
    
    NSString *UPDATESQL = [NSString stringWithFormat:@"update ClockTable  set recordtype = '%@' where numer = '%@'",recordtype,recordContent];
    
    [[SQLiteDBQueue sharedInstanceQueue] inTransaction:^(FMDatabase *db, BOOL *rollback)
     {
         [db executeUpdate:UPDATESQL];
     }];
}





#pragma mark - 创建一个定时闹钟表
-(void)createClockRingTable
{
#pragma mark 【2】 创建表，如果没有该表就创建表，否则不会创建表
    /**
     创建数据库和表，如果以上路径有数据库就创建表，如果该表存在就不创建表
     
     dateTime  : 定时日期
     mark  : 标签类型
     switch  :是打开或者关闭（关闭、开启）
     ringId : 铃声ID（系统铃声是id，特色铃声是名称）
     repeatType:  重复类型 只响一次 、周一至周五 、法定工作日、周末、自定义
     */
    NSString *createSQL = @"create table if not exists ClockRingTable (id INTEGER PRIMARY KEY AUTOINCREMENT,dateTime text default '',mark text default '',switch text default '',ringName text default '',repeatType text default '')";
    
    [[SQLiteDBQueue sharedInstanceQueue] inTransaction:^(FMDatabase *db, BOOL *rollback)
     {
         [db executeUpdate:createSQL];
     }];
}



-(void)insertIntoClockRingTableWithDateTime:(NSString*)dateTime withMark:(NSString *)mark withSwitch:(NSString *)switchOn withRingId:(NSString*)ringId withRepeatType:(NSString*)repeatType
{
    NSString *insertinto = [NSString stringWithFormat:@"insert into ClockRingTable (dateTime,mark,switch,ringName,repeatType) VALUES (?,?,?,?,?)"];
    [[SQLiteDBQueue sharedInstanceQueue]  inTransaction:^(FMDatabase *db, BOOL *rollback)
     {
         [db executeUpdate:insertinto,dateTime,mark,switchOn,ringId,repeatType];
     }];
    
}










#pragma mark  查询闹钟定时表
-(NSMutableArray*)selectClockRingTable
{
    NSMutableArray *clockArray = [NSMutableArray array];
    NSString *QUERYSQL = [NSString stringWithFormat:@"select id,dateTime,mark,switch,ringName,repeatType from ClockRingTable"];
    /*插入数据内容*/
    [[SQLiteDBQueue sharedInstanceQueue]  inTransaction:^(FMDatabase *db, BOOL *rollback)
     {
         FMResultSet *Results = [db executeQuery:QUERYSQL];
         while ([Results next])
         {
             NSString *primary_id = [Results stringForColumn:@"id"];
             NSString *dateTime = [Results stringForColumn:@"dateTime"];
             NSString *mark = [Results stringForColumn:@"mark"];
             NSString *switchOn = [Results stringForColumn:@"switch"];
             NSString *ringName = [Results stringForColumn:@"ringName"];
             NSString *repeatType = [Results stringForColumn:@"repeatType"];
            
             
             AddClockViewModel *modele = [[AddClockViewModel alloc]init];
             [modele setDateTime:dateTime];
             [modele setMark:mark];
             [modele setSwitchOn:switchOn];
             [modele setRingName:ringName];
             [modele setDescribe:ringName];
             [modele setPrimary_id:primary_id];
             [modele setRepeatType:repeatType];

             
             [clockArray addObject:modele];
         }
     }];
    return clockArray;
}




#pragma mark 更新闹钟开关状态
-(void)updateClockRingTableTableWithPrimary_id:(NSString*)primary_id withSwitchType:(NSString*)switchType
{
    NSString *UPDATESQL = [NSString stringWithFormat:@"update ClockRingTable  set switch = '%@' where id = '%@'",switchType,primary_id];
    
    [[SQLiteDBQueue sharedInstanceQueue] inTransaction:^(FMDatabase *db, BOOL *rollback)
     {
         [db executeUpdate:UPDATESQL];
     }];
}


#pragma mark 更新编辑闹钟状态
-(void)updateClockRingTableWithDateTime:(NSString*)dateTime withMark:(NSString *)mark withSwitch:(NSString *)switchOn withRingName:(NSString*)ringName withRepeatType:(NSString*)repeatType withPrimary_id:(NSString*)primary_id
{
    NSString *UPDATESQL = [NSString stringWithFormat:@"update ClockRingTable  set dateTime = '%@',mark = '%@',switch = '%@',repeatType = '%@',ringName = '%@' where id = '%@'",dateTime,mark,switchOn,repeatType,ringName,primary_id];
    
    [[SQLiteDBQueue sharedInstanceQueue] inTransaction:^(FMDatabase *db, BOOL *rollback)
     {
         [db executeUpdate:UPDATESQL];
     }];
}


#pragma mark 删除数据
-(void)deleteWithRingId:(NSString*)ringId
{
    NSString *DELETESQL = [NSString stringWithFormat:@"delete from ClockRingTable where id = '%@'",ringId];
    [[SQLiteDBQueue sharedInstanceQueue] inTransaction:^(FMDatabase *db, BOOL *rollback)
     {
         [db executeUpdate:DELETESQL];
     }];
}



-(void)deleteAll
{
    NSString *DELETESQL = [NSString stringWithFormat:@"delete from ClockRingTable"];
    [[SQLiteDBQueue sharedInstanceQueue] inTransaction:^(FMDatabase *db, BOOL *rollback)
     {
         [db executeUpdate:DELETESQL];
     }];
}




#pragma mark - 新加
#pragma mark - 创建一个我的铃声表
- (void)createMyMusicTable
{

    /**
     创建数据库和表，如果以上路径有数据库就创建表，如果该表存在就不创建表
     
     
     */
    NSString *createSQL = @"create table if not exists MyMusicTable (recordId INTEGER PRIMARY KEY AUTOINCREMENT,recordFilePath text default '',fromType text default '')";
    
    [[SQLiteDBQueue sharedInstanceQueue] inTransaction:^(FMDatabase *db, BOOL *rollback)
     {
         [db executeUpdate:createSQL];
     }];
}


- (void)insertIntoMyMusicTableWithrecordFilePath:(NSString *)recordFilePath WithFromType:(NSString *)fromType
{
    NSString *insertintoo = [NSString stringWithFormat:@"insert into MyMusicTable (recordFilePath,fromType) VALUES (?,?)"];
    [[SQLiteDBQueue sharedInstanceQueue]  inTransaction:^(FMDatabase *db, BOOL *rollback)
     {
         [db executeUpdate:insertintoo,recordFilePath,fromType];
         
         NSLog(@"插入成功");
     }];

}

- (NSMutableArray *)selectMyMusicTable
{
    NSMutableArray *recordArray = [NSMutableArray array];
    NSString *QUERYSQL = [NSString stringWithFormat:@"select recordId,recordFilePath,fromType from MyMusicTable"];
    /*插入数据内容*/
    [[SQLiteDBQueue sharedInstanceQueue]  inTransaction:^(FMDatabase *db, BOOL *rollback)
     {
         FMResultSet *Results = [db executeQuery:QUERYSQL];
         while ([Results next])
         {
             NSString *primary_id = [Results stringForColumn:@"recordId"];
             NSString *recordFilePath = [Results stringForColumn:@"recordFilePath"];
             NSString *fromType = [Results stringForColumn:@"fromType"];
             
             
             
             ZMNewRecordMyMusicModel *modele = [[ZMNewRecordMyMusicModel alloc]init];
             [modele setRecordPath:recordFilePath];
             [modele setPrimary_id:primary_id];
             [modele setFromType:fromType];
             
             
             [recordArray addObject:modele];
         }
     }];
    return recordArray;
}

@end











