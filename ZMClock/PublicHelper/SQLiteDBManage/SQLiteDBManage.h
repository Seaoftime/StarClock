//
//  SQLiteDBManage.h
//  Translation
//
//  Created by yaolizhi on 14/12/21.
//  Copyright (c) 2014年 ZhongYeKeJiJiShuBu. All rights reserved.
//

#import "FMDatabase.h"
#import "SQLiteDBQueue.h"
#import "WeatherRecordModel.h"



@interface SQLiteDBManage : NSObject

//单例类方法
+(SQLiteDBManage*)sharedInstance;


#pragma mark - 创建天气预报录音表
-(void)createWeatherTable;

#pragma mark  插入天气录音内容
-(void)insertIntoWeatherTable;


/**
 查询所有数据
 */
-(NSMutableArray *)selectWeatherTable;


#pragma mark 更新录音状态
-(void)updateWeatherTableWithrecordContent:(NSString*)recordContent withrecordType:(NSString*)recordtype;



////////////////////////////////////////////

#pragma mark - 创建闹钟表
-(void)createClockTable;

#pragma mark  插入闹钟内容
-(void)insertIntoClockTable;


/**
 查询所有数据
 */
-(NSMutableArray *)selectClockTable;



#pragma mark 更新闹钟录音状态
-(void)updateClockTableWithrecordContent:(NSString*)recordContent withrecordType:(NSString*)recordtype;



/////////////////////////////////////////////

#pragma mark - 创建一个定时闹钟表
-(void)createClockRingTable;

#pragma mark 插入一条定时信息
-(void)insertIntoClockRingTableWithDateTime:(NSString*)dateTime withMark:(NSString *)mark withSwitch:(NSString *)switchOn withRingId:(NSString*)ringId withRepeatType:(NSString*)repeatType;


#pragma mark  查询闹钟定时表
-(NSMutableArray*)selectClockRingTable;


#pragma mark 更新闹钟开关状态
-(void)updateClockRingTableTableWithPrimary_id:(NSString*)primary_id withSwitchType:(NSString*)switchType;


#pragma mark 更新编辑闹钟状态
-(void)updateClockRingTableWithDateTime:(NSString*)dateTime withMark:(NSString *)mark withSwitch:(NSString *)switchOn withRingName:(NSString*)ringName withRepeatType:(NSString*)repeatType withPrimary_id:(NSString*)primary_id;

#pragma mark 删除数据
-(void)deleteWithRingId:(NSString*)ringId;
-(void)deleteAll;


/////////////////////////////////////////////
#pragma mark - 新加
#pragma mark - 创建一个我的铃声表
- (void)createMyMusicTable;

#pragma mark  插入我的铃声表
- (void)insertIntoMyMusicTableWithrecordFilePath:(NSString *)recordFilePath WithFromType:(NSString *)fromType;

#pragma mark  查询我的铃声表
- (NSMutableArray*)selectMyMusicTable;




@end
