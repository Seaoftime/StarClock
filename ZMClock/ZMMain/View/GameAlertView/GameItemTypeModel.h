//
//  GameItemTypeModel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/7.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//   类型模型
//
//
//

#import <Foundation/Foundation.h>

@interface GameItemTypeModel : NSObject

@property (nonatomic) NSInteger percent; //!< 百分比
@property (nonatomic) NSInteger item_type; //!< 所属类型



@property (nonatomic,retain) NSString *love_level; //!< 亲密度等级
//@property (nonatomic,retain) NSString *love_level1; //!< 亲密度等级
@property (nonatomic,retain) NSString *love_val; //!< 亲密度数值

@property (nonatomic,retain) NSString *user_good; //!< 宝宝金币
@property (nonatomic,retain) NSString *user_nickname; //!< 宝宝昵称

@property (nonatomic,retain) NSString *HeadPortraitUrl; //!< 宝宝头像


//签到
@property (nonatomic,retain) NSString *check_in_continus; //!< 签到天数
@property (nonatomic,retain) NSString *cur_gold; //!< 原有的金币
@property (nonatomic,retain) NSString *add_gold; //!< 增加的金币


//领取任务
@property (nonatomic,retain) NSString *unique_id; //!< 任务id
@property (nonatomic,retain) NSString *task_id; //!<  配置中的任务 id
@property (nonatomic,retain) NSString *task_status; //!<  任务状态



@property (nonatomic,strong) NSMutableArray *itemArray; //!< 单元数组


@end
