//
//  MoreProgramModel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/3.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//
//  说明:有很多时候多个数据模型本可以公用，但是考虑到后期维护方便，
//  每个视图控制器数据模型、视图、Frame独享都分开写了
// 
//  更多行程数据模型对象
//
//



typedef NS_ENUM(NSInteger,MoreProgramModelType)
{
    /**
     行程详情类型
     */
    MoreProgramInfoType = 1,
    
    /**
     行程简单概述类型
     */
    MoreProgramBriefType = 2,
};



#import <Foundation/Foundation.h>

@interface MoreProgramModel : NSObject


@property (nonatomic,retain) NSString *programMonth; //!<行程月份
@property (nonatomic,retain) NSString *programDay; //!< 行程日
@property (nonatomic,retain) NSString *programWeek; //!< 行程星期、
@property (nonatomic,retain) NSString *programTitle; //!< 行程标题
@property (nonatomic,retain) NSString *locationInfo; //!<行程位置信息
@property (nonatomic,retain) NSString *programStartTime; //!< 行程开始时间
@property (nonatomic,retain) NSString *programDate; //! 行程日期
@property (nonatomic,retain) NSString *schedule_id; //!< 行程id
@property (nonatomic,retain) NSString *type; //!< 类型

@property (nonatomic) MoreProgramModelType moreProgramModelType; //!<行程类型


@end
