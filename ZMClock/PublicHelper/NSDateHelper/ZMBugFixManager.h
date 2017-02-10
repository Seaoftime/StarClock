//
//  ZMBugFixManager.h
//  ZMClock
//
//  Created by ZhongMeng on 16/7/20.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZMBugFixManager : NSObject



+ (ZMBugFixManager *)sharedFixManager;


//一个星期之后显示
- (BOOL)afterOneWeekShow;

//具体某一天显示
- (BOOL)oneDayShow;


@end
