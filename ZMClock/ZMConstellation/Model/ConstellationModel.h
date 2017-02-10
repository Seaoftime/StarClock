//
//  ConstellationModel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/26.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConstellationModel : NSObject

@property (nonatomic,retain) NSString *date;  // !< 日期
@property (nonatomic,retain) NSString *datetime; // !< 日期
@property (nonatomic,retain) NSString *name;  // !< 星座名字
@property (nonatomic,retain) NSString *color; // !< 喜欢的颜色
@property (nonatomic,retain) NSString *health;// !< 健康指数
@property (nonatomic,retain) NSString *love;  // !< 爱情指数
@property (nonatomic,retain) NSString *money; // !< 财运指数
@property (nonatomic,retain) NSString *work;  // !< 工作指数
@property (nonatomic,retain) NSString *all;   // !< 综合指数
@property (nonatomic,retain) NSString *summary;//!< 今日运势
@property (nonatomic,retain) NSString *number; //!< 幸运数字
@property (nonatomic,retain) NSString *QFriend;// !< 速配星座

@property (nonatomic) BOOL isMark; // !< 是否是当前星座




@end
