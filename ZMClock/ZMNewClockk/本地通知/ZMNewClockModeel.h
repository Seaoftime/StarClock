//
//  ZMNewClockModeel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/10/26.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "JKDBModel.h"

/*
 闹钟模型
 */
@interface ZMNewClockModeel : JKDBModel


/*
 闹钟编号
 */
@property (nonatomic, copy)   NSString *clockNotifiId;

/*
 小时
 */

@property (nonatomic, assign)  NSInteger clockFireHour;


/*
 分钟
 */

@property (nonatomic, assign)  NSInteger clockFireMinute;





/*
 提醒时间
 */
@property (nonatomic, strong) NSDate *clockFireDate;

@property (nonatomic, copy)   NSString *clockFireDateStr;



@property (nonatomic, strong) NSDate *clockUpdateDate;
@property (nonatomic, strong) NSDate *clockNextFireDate;

@property (nonatomic, copy)   NSString *clockNotifiTime;


/*
 闹钟重复
 */
@property (nonatomic, copy)   NSString *clockNotifiRepeat;
//@property (nonatomic, copy)   NSString *clockNextFireDate;


/*
 振动/响铃
 */

@property (nonatomic, copy)   NSString *clockShark;
@property (nonatomic, copy)   NSString *clockRing;

/*
 铃音
 */

@property (nonatomic, copy)   NSString *clockNotifiMusic;


/*
 留言
 */

@property (nonatomic, copy)   NSString *clockRemarkStr;






@end
