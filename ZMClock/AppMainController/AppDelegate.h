//
//  AppDelegate.h
//  ZMClock
//
//  Created by ZhongMeng on 16/2/23.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


//闹钟

//#import "ZMNewClockcModdel.h"
#import "ZMNewClockModeel.h"




@interface AppDelegate : UIResponder <UIApplicationDelegate>


@property (strong, nonatomic) UIWindow *window;



//@property (nonatomic, copy) NSString *notifyRepeatInterval;






//---------------------------------------------------
//---------------------------------------------------

+ (NSString *)CUSTOM_NOTIFICATION_DID_ENTER_BACKGROUND;
+ (NSString *)CUSTOM_NOTIFICATION_DID_BECOME_ACTIVE;
+ (NSString *)CUSTOM_NOTIFICATION_DID_RECEIVE_LOCAL_NOTIFICATION_IN_ACTIVE;
+ (NSString *)CUSTOM_NOTIFICATION_DID_RECEIVE_LOCAL_NOTIFICATION_STATE_ACTIVE;
+ (NSString *)CUSTOM_NOTIFICATION_DID_FINISH_LAUNCHING_WITH_OPTIONS;



@end

