//
//  GAmerenwucontroller.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/30.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//玩家任务控制器
//
//
//
//

#import "ZMGameBaseViewController.h"

@interface GAmerenwucontroller : ZMGameBaseViewController
@property (nonatomic,strong) UITableView *gameSettingTableView1; //!< 游戏设置表视图
@property (nonatomic,strong) NSMutableArray *gameSettingArray; //!< 游戏设置表视图
@property (nonatomic,strong) NSMutableArray *gameSettingArray2; //!< 游戏设置表视图

@property (nonatomic,strong) NSDictionary *gameSettingArray1;//游戏玩家弹出字符

@property(nonatomic,strong)UIButton *but;
@property(nonatomic,assign)int zhengxingshu;

@property(nonatomic,strong)NSMutableArray *gamerenwuArray;
@property(nonatomic,strong)NSMutableArray *gamerenwuArray1;
@property(nonatomic,strong)NSMutableArray *gamerenwuArray2;


//数据接收字符
@property(nonatomic,strong)NSString *unique_idstr;
@property(nonatomic,strong)NSString *task_idstr;
@property(nonatomic,strong)NSString *task_statusstr;

@property(nonatomic,strong)UILabel *unique_idLabel;
@property(nonatomic,strong)UILabel *task_idLabel;
@property(nonatomic,strong)UILabel *task_statusLabel;

@property(nonatomic,strong)NSMutableArray *shuzu;
////获取task_status
@property(nonatomic,strong)NSString *jiushu0;
@property(nonatomic,strong)NSString *jiushu1;
@property(nonatomic,strong)NSString *jiushu2;
@property(nonatomic,strong)NSString *jiushu3;
@property(nonatomic,strong)NSString *jiushu4;
@property(nonatomic,strong)NSString *jiushu5;
@property(nonatomic,strong)NSString *jiushu6;
@property(nonatomic,strong)NSString *jiushu7;
@property(nonatomic,strong)NSString *jiushu8;
@property(nonatomic,strong)NSString *jiushu9;


@property(nonatomic,strong)NSString *unique_id0;
@property(nonatomic,strong)NSString *unique_id1;
@property(nonatomic,strong)NSString *unique_id2;
@property(nonatomic,strong)NSString *unique_id3;
@property(nonatomic,strong)NSString *unique_id4;
@property(nonatomic,strong)NSString *unique_id5;
@property(nonatomic,strong)NSString *unique_id6;
@property(nonatomic,strong)NSString *unique_id7;
@property(nonatomic,strong)NSString *unique_id8;
@property(nonatomic,strong)NSString *unique_id9;


@property(nonatomic,strong)NSString *task_id0;
@property(nonatomic,strong)NSString *task_id1;
@property(nonatomic,strong)NSString *task_id2;
@property(nonatomic,strong)NSString *task_id3;
@property(nonatomic,strong)NSString *task_id4;
@property(nonatomic,strong)NSString *task_id5;
@property(nonatomic,strong)NSString *task_id6;
@property(nonatomic,strong)NSString *task_id7;
@property(nonatomic,strong)NSString *task_id8;
@property(nonatomic,strong)NSString *task_id9;



@property(nonatomic,strong)NSString *str1;
@property(nonatomic,strong)NSString *str2;
@property(nonatomic,strong)NSString *str3;








@end
