//
//  LocalNotificationManager.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/3.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//
//  闹钟的实现方式就是利用本地通知实现的
//  所以创建本地通知管理类，用于闹钟开发管理
//
//

#import "LocalNotificationManager.h"

///////////
#import "AppDelegate.h"

#import <AVFoundation/AVFoundation.h>
#import "ZMClockStartPageeViewController.h"



@interface LocalNotificationManager ()


@property (nonatomic, copy) NSString *ringgName;

@property (nonatomic, strong) AVAudioPlayer *audio;
@property (strong, nonatomic) AVAudioSession *session;

@end

@implementation LocalNotificationManager



static LocalNotificationManager *sharedObject = nil; //第一步：静态实例，并初始化。

static BOOL _isAdView;


+ (LocalNotificationManager*)sharedLocalNotificationManager
{
    static dispatch_once_t once;
    dispatch_once(&once,^{
        sharedObject = [[self alloc]init];
    });
    return sharedObject;
}

+ (id)allocWithZone:(NSZone *)zone {
    
    __block id ret = nil;
    
    static dispatch_once_t once;
    dispatch_once( &once, ^{
        sharedObject = [super allocWithZone:zone];
        ret           = sharedObject;
    });
    
    return  ret;
    
}

- (id)copyWithZone:(NSZone *)zone {
    
    return self;
    
}


- (BOOL)isAdView {
    
    return _isAdView;
}

- (void)setAdView:(BOOL)isView {
    
    _isAdView = isView;
}



- (void)setBgm {
    
    self.session             = [AVAudioSession sharedInstance];
    [self.session setCategory:AVAudioSessionCategoryPlayback error:NULL];
    [self.session setActive:YES error:NULL];
    
    
    
    
    NSString *stt = @"欢快口哨音";
    
    NSString *path           = [[NSBundle mainBundle] pathForResource:stt ofType:@"mp3"];
    NSURL *url               = [NSURL fileURLWithPath:path];
    self.audio               = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    self.audio.numberOfLoops = -1;
    [self.audio prepareToPlay];
    
    
    if([UIApplication sharedApplication].applicationIconBadgeNumber >0 ){
        
        [self.audio play];
        
    }
    
    
    
}



- (void)stopBgm {
    
    [self.audio stop];
    
}


- (void)playBgm {
    
    [self.audio play];
    
    
    ZMClockStartPageeViewController *start = [ZMClockStartPageeViewController sharedZMClockStartPageeViewController];
    
    UIViewController *startVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    [startVC presentViewController:start animated:NO completion:nil];
    
    
}

- (void)clearLocalNotification {
    
    
    //取消某一个通知
//    NSArray *notificaitons = [[UIApplication sharedApplication] scheduledLocalNotifications];
//    //获取当前所有的本地通知
//    if (!notificaitons || notificaitons.count <= 0) {
//        return;
//    }
//    
//    for (UILocalNotification *notify in notificaitons) {
//        NSArray *arr = [notify.userInfo allKeys];
//        
//        if ([arr containsObject:@"isAlarm"])
//        {
//            //取消一个特定的通知
//            [[UIApplication sharedApplication] cancelLocalNotification:notify];
//            break;
//        }
//    }
    
    
    
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    
    [self removeCustomEventNotification];
    
    [self stopBgm];
    
}




- (void)registerLocalNotification:(NSInteger)hour withMinute:(NSInteger)minute withTitle:(NSString*)title withSoundName:(NSString*)soundName withNotifyRepeatInterval:(NSCalendarUnit)repeatIntervvl withClockKey:(NSString *)clockKey
{
    
    
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance] setActive: YES error: nil];

    
    //[[UIApplication sharedApplication] cancelAllLocalNotifications];
    
    //通知实现类
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    if (notification)
    {
        
        
        // ios8后，需要添加这个注册，才能得到授权
        if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)])
        {
            UIUserNotificationType type =  UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
            UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type
                                                                                     categories:nil];
            [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
            
            
        }
        else
        {
            // 通知重复提示的单位，可以是天、周、月
            //            notification.repeatInterval = NSCalendarUnitDay;
        }
        

        
        NSString *localdDateAndTime = [[ZMHelper sharedHelp] localdDateAndTime];

        NSString *time = [NSString stringWithFormat:@"%d:%d",(int)hour,(int)minute];
        localdDateAndTime = [NSString stringWithFormat:@"%@ %@",localdDateAndTime,time];
        
        NSDateFormatter *format=[[NSDateFormatter alloc] init];
        [format setDateFormat:@"yyyy-MM-dd HH:mm"];
        NSDate *fromdate = [format dateFromString:localdDateAndTime];
        
        
        notification.fireDate = fromdate;
        // 时区
        notification.timeZone = [NSTimeZone systemTimeZone];
        
        
        //小红点
         notification.applicationIconBadgeNumber = 1;
        
        // 通知内容
        [notification setAlertBody:title];
        // 通知被触发时播放的声音
        [notification setSoundName:@"欢快口哨音.mp3"];
        // 通知参数
        NSDictionary *userDict = [NSDictionary dictionaryWithObject:@"添加闹钟了" forKey:clockKey];
        
        notification.userInfo = userDict;
        
        
        //notification.repeatInterval = kCFCalendarUnitWeekday;
        
        notification.repeatInterval = repeatIntervvl;

/*
 闹钟重复周期:
 0: 不重复
 kCFCalendarUnitMinute :每分钟
 kCFCalendarUnitHour:   每小时
 kCFCalendarUnitDay:    每天
 
 */
        
        // 执行通知注册
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
        
        
#pragma mark -----------------------------APP 在后台的时候
        //传值
        //NSString *clock_keyy = clockKey;
        
        //[NSUserDefaults standardUserDefaults].clock_Key = clock_keyy;
        
        //[[NSNotificationCenter defaultCenter] postNotificationName:@"APP_RECEIVEED_CLOCKNOTIFY_BACKGROUND" object:self];
        
        
        
        [self setCustomEventNotification];
        
        
        
              
        
    }
    
    
    
}






- (void)setCustomEventNotification{
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onCustomNotificationInActive)
                                                 name:[AppDelegate CUSTOM_NOTIFICATION_DID_RECEIVE_LOCAL_NOTIFICATION_IN_ACTIVE]
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onCustomNotificationStateActive)
                                                 name:[AppDelegate CUSTOM_NOTIFICATION_DID_RECEIVE_LOCAL_NOTIFICATION_STATE_ACTIVE]
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onCustomNotificationDidBecomeActive)
                                                 name:[AppDelegate CUSTOM_NOTIFICATION_DID_BECOME_ACTIVE]
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onCustomNotificationDidEnterBackGround)
                                                 name:[AppDelegate CUSTOM_NOTIFICATION_DID_ENTER_BACKGROUND]
                                               object:nil];
    
}




- (void)onCustomNotificationInActive {
    
    [self playBgm];
}


- (void)onCustomNotificationStateActive {
    [self playBgm];
}

- (void)onCustomNotificationDidBecomeActive {
    
    if([UIApplication sharedApplication].applicationIconBadgeNumber >0 ) {
        
        [self playBgm];
    }
    
}

- (void)onCustomNotificationDidEnterBackGround {
    
    [self stopBgm];
    
}








- (void)removeCustomEventNotification
{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:[AppDelegate CUSTOM_NOTIFICATION_DID_RECEIVE_LOCAL_NOTIFICATION_IN_ACTIVE] object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:[AppDelegate CUSTOM_NOTIFICATION_DID_RECEIVE_LOCAL_NOTIFICATION_STATE_ACTIVE] object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:[AppDelegate CUSTOM_NOTIFICATION_DID_BECOME_ACTIVE] object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:[AppDelegate CUSTOM_NOTIFICATION_DID_ENTER_BACKGROUND] object:nil];
    
    
    
}










@end
