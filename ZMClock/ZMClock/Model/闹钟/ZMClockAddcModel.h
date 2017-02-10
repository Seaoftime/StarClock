//
//  ZMClockAddcModel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/11/3.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "JKDBModel.h"

@interface ZMClockAddcModel : JKDBModel


/*
闹钟编号
*/
@property (nonatomic, copy)   NSString *clockNotifyKey;


/*
 开关
 */

@property (nonatomic, assign)  BOOL clockSwitchOn;




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

@property (nonatomic, copy)   NSString *clockFireDateStr;//key

/*
 闹钟重复
 */
@property (nonatomic, copy)   NSString *clockRepeatType;

@property (nonatomic, copy)   NSString *clockRepeat11;
@property (nonatomic, copy)   NSString *clockRepeat22;
@property (nonatomic, copy)   NSString *clockRepeat33;
@property (nonatomic, copy)   NSString *clockRepeat44;
@property (nonatomic, copy)   NSString *clockRepeat55;
@property (nonatomic, copy)   NSString *clockRepeat66;
@property (nonatomic, copy)   NSString *clockRepeat77;





/*
 振动
 */

//@property (nonatomic, copy)   NSString *clockShark;


/*
 响铃
 */


//@property (nonatomic, copy)   NSString *clockRing;

/*
 铃音
 */

@property (nonatomic, copy)   NSString *clockNotifiMusic;


/*
 留言
 */

@property (nonatomic, copy)   NSString *clockRemarkStr;








@end
