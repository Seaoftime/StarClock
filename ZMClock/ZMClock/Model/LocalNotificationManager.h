//
//  LocalNotificationManager.h
//  ZMClock
//
//  Created by ZhongMeng on 16/3/3.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocalNotificationManager : NSObject

+ (LocalNotificationManager *)sharedLocalNotificationManager;

//通知实现
- (void)registerLocalNotification:(NSInteger)hour withMinute:(NSInteger)minute withTitle:(NSString*)title withSoundName:(NSString*)soundName withNotifyRepeatInterval:(NSCalendarUnit)repeatIntervvl withClockKey:(NSString *)clockKey;


//- (void)playBackgroundMusic;

//- (void)stopPlaybgMusic;



- (void)clearLocalNotification;



- (void)setBgm;
- (void)stopBgm;


- (BOOL)isAdView;
- (void)setAdView:(BOOL)isView;





@end
