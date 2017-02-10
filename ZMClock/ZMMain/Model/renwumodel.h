//
//  renwumodel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/6/2.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface renwumodel : NSObject
@property (nonatomic,retain) NSString *unique_id;  //任务的唯一ID
@property (nonatomic,retain) NSString *task_id; //配置中的任务ID
@property (nonatomic,retain) NSString *task_status; //!当前任务的状态 1 未领取 2 已领取正在进行 3 已完成


@property (nonatomic,retain) NSString *status;  //地位
@property (nonatomic,retain) NSString *data; //数据
@property (nonatomic,retain) NSString *msg; //!任务字段


@end
