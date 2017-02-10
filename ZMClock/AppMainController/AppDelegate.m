//
//  AppDelegate.m
//  ZMClock
//
//  Created by ZhongMeng on 16/2/23.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "AppDelegate.h"
#import "ZMTabBarController.h"
#import "ZMBaseNavigationController.h"
#import "ZMLocationAndWeather.h"
#import "IFlyFaceHelper.h"

//
#import "ZMClockViewController.h"

//张锐
///第三方登录
#import "WMAuthManager.h"
#import <AVFoundation/AVFoundation.h>

///加入 JSPatch 线上热修复
#import "JPEngine.h"

#import "LocalNotificationManager.h"

#import "ZMAVPlayerManager.h"
#import "ZMClockChooseLoveDouModel.h"
#import "ZMClockStartPageeViewController.h"



//---------------------------------------------------
//---------------------------------------------------



//---------------------------------------------------
//---------------------------------------------------

static NSString *DID_ENTER_BACKGROUND = @"CustomNotificationApplicationDidEnterBackground";
static NSString *DID_BECOME_ACTIVE = @"CustomNotificationApplicationDidBecomeActive";
static NSString *DID_RECEIVE_LOCAL_NOTIFICATION_IN_ACTIVE = @"CustomNotificationDidReceiveLocalNotificationInActive";
static NSString *DID_RECEIVE_LOCAL_NOTIFICATION_STATE_ACTIVE = @"CustomNotificationDidReceiveLocalNotificationStateActive";
static NSString *DID_FINISH_LAUNCHING_WITH_OPTIONS = @"CustomNotificationDidFinishLaunchingWithOptions";





#define kDocumentPath (NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0])




@interface AppDelegate ()<UIAlertViewDelegate, AVAudioPlayerDelegate>

//////传过来的铃声名称/路径地址
//@property (nonatomic, copy) NSString *ringgName;
//@property (nonatomic, copy) NSString *ringgMusic;
@property (nonatomic, strong) AVAudioPlayer *audioplayer;



@property (nonatomic, unsafe_unretained) UIBackgroundTaskIdentifier backgroundTaskIdentifier;
@property (nonatomic, strong) NSTimer *timer_fakeTask;
@property (strong, nonatomic) NSTimer *backgroundTimer;

@property (nonatomic, copy) NSString *ringgName;



@end

@implementation AppDelegate
@synthesize window;

//@synthesize notifyRepeatInterval;//闹钟重复间隔



+ (NSString *)CUSTOM_NOTIFICATION_DID_ENTER_BACKGROUND{
    return DID_ENTER_BACKGROUND;
}

+ (NSString *)CUSTOM_NOTIFICATION_DID_BECOME_ACTIVE{
    return DID_BECOME_ACTIVE;
}

+ (NSString *)CUSTOM_NOTIFICATION_DID_RECEIVE_LOCAL_NOTIFICATION_IN_ACTIVE{
    return DID_RECEIVE_LOCAL_NOTIFICATION_IN_ACTIVE;
}

+ (NSString *)CUSTOM_NOTIFICATION_DID_FINISH_LAUNCHING_WITH_OPTIONS{
    return DID_FINISH_LAUNCHING_WITH_OPTIONS;
}

+ (NSString *)CUSTOM_NOTIFICATION_DID_RECEIVE_LOCAL_NOTIFICATION_STATE_ACTIVE{
    return DID_RECEIVE_LOCAL_NOTIFICATION_STATE_ACTIVE;
}


//---------------------------------------------------
//---------------------------------------------------



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
//判断 app 是否第一次启动
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"]){
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
        NSLog(@"第一次启动");
        
        [[SQLiteDBManage sharedInstance] deleteAll];//清空闹钟表
        
        if ([[ZMBugFixManager sharedFixManager] afterOneWeekShow]) {
            
            //[self checkVersion];
        }else {
        }

        
    }else{
        
        NSLog(@"已经不是第一次启动了");
    }
    
////-------------------------------------------------
////-------------------------------------------------
    window = [[UIWindow alloc] initWithFrame:KWindowScreen];
    
    //初始化用户的个人信息
    [[ZMUserInfo sharedUserInfo] getUserInfo];
    //初始化科大讯飞的人脸识别
    [IFlyFaceHelper sharedFaceHelper];
    
    ZMBaseNavigationController *navRoot = [[ZMBaseNavigationController alloc]initWithRootViewController:[[ZMMainViewController alloc] init]];
    
    
    [window setRootViewController:navRoot];
    //[window setRootViewController:[[ZMClockViewController alloc] init]];

    
    [window makeKeyAndVisible];

////-------------------------------------------------
////-------------------------------------------------
    
    
    
// 注册第三方登录
    [WMAuthManager registerApp:WMAuthAll withApplication:application withOptions:launchOptions];
    
    
    
////-------------------------------------------------
////---------闹钟----------------------------------------
    
    // iOS8.0
//    UIUserNotificationType types =
//    UIUserNotificationTypeBadge|
//    UIUserNotificationTypeSound|
//    UIUserNotificationTypeAlert;
//    
//    UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
//    
//    [application registerUserNotificationSettings:mySettings];
    
    
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_7_1) {
        
        // iOS8.0
        UIUserNotificationType types =
        UIUserNotificationTypeBadge|
        UIUserNotificationTypeSound|
        UIUserNotificationTypeAlert;
        
        UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
        
        [application registerUserNotificationSettings:mySettings];
    }
    
    //[[LocalNotificationManager sharedLocalNotificationManager] setBgm];

    
    
    
    
    
    
////----------------------------------------------
////----------------------------------------------
#pragma mark ----------------------------APP 被杀死的时候
/*
 APP 被杀死的时候 来本地通知 调用此方法
 */
    //application.applicationIconBadgeNumber = 0;
    
    UILocalNotification *localNotify = launchOptions[UIApplicationLaunchOptionsLocalNotificationKey];
    
    if (localNotify != nil){
        
        NSDictionary *userDic = localNotify.userInfo;
        
        
        
        __block NSString *clockKey;
        
        [userDic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            
            //NSLog(@"key = %@ and obj = %@", key, obj);
            
            if ([obj isEqualToString:@"添加闹钟了"]) {
                
                clockKey = key;
                
                //NSLog(@"_______launchOptions_______当前通知的 Key---------%@",clockKey);
                
                //传值 key
                //[NSUserDefaults standardUserDefaults].clock_Key = clockKey;
                
                
                
                
                //[self playBackgroundMusic];
                
                
            }
            
            
            
        }];
        
        
        
        
#pragma mark ----------------------------------发送通知
        //[[NSNotificationCenter defaultCenter] postNotificationName:@"ZMCLOCKISRING_STATE_KILLED" object:self];
        
        
    }
    
    
    
    
    
    
    
    
////-------------------------------------------------
////-------------------------------------------------
    
    
////-------------------------------------------------
////-------------------------------------------------
    

// JSPatch
    
//    [JPEngine startEngine];
//    
//    NSString *sourcePatch = [[NSBundle mainBundle] pathForResource:@"ZMJSPatch" ofType:@"js"];
//    NSString *script = [NSString stringWithContentsOfFile:sourcePatch encoding:NSUTF8StringEncoding error:nil];
//    [JPEngine evaluateScript:script];
    
    
    
    
//    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@""]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
//        //
//        NSString *js = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        if (js) {
//            [JPEngine evaluateScript:js];
//        }
//    }];
    
    
   
    return YES;
    
}





//检测软件是否需要升级
//- (void)checkVersion
//{
    
    //检查本地版本号
//    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
//    NSString *currentVersion = [infoDict objectForKey:@"CFBundleVersion"];
 //   NSString *currentV = [currentVersion substringToIndex:5];

 //   NSLog(@"版本号:%@",currentV);
    
    
 //   NSURL *url = [NSURL URLWithString:@"http://itunes.apple.com/lookup?id=1126233766"];
    
    //AppStore 版本号
//    NSString *lastVersion;
    //通过url获取数据
 //   NSString *jsonResponseString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    //NSLog(@"通过appStore获取的数据是：%@",jsonResponseString);
    
    //json 字符串 转字典
//    NSData *jsonData = [jsonResponseString dataUsingEncoding:NSUTF8StringEncoding];
//    NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:nil];
    
//    //从数据字典中检出版本号数据
//    NSArray *appinfoAry = [responseDic objectForKey:@"results"];
    
//    if ([appinfoAry count]) {
//        NSDictionary *releaseInfo = [appinfoAry objectAtIndex:0];
        
//        lastVersion = [releaseInfo objectForKey:@"version"];
        
        
//        NSLog(@"______________$$$$%@$$$$__________________",lastVersion);
//    }
//    NSString *msg = [NSString stringWithFormat:@"星伴%@版",currentV];

 //   if (![lastVersion isEqualToString:currentV]){
        
//        UIAlertView *versioAlert = [[UIAlertView alloc] initWithTitle:@"升级新版本" message:msg delegate:self cancelButtonTitle:@"下次再说" otherButtonTitles: @"现在升级", nil];
 //       versioAlert.tag = 100002;
        
 //       [versioAlert show];

//    }else {
//    }

//}







- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    
    
// 第三方登录回调
    return [WMAuthManager handleOpenURL:url
                            application:application
                      sourceApplication:sourceApplication
                             annotation:annotation];
    
    
}







#pragma mark -------------------------APP 进入非活跃状态

- (void)applicationWillResignActive:(UIApplication *)application {
    
    NSLog(@"___________进入非活跃状态__________");
    
    //[application setApplicationIconBadgeNumber:0];
    
    //[self startBackgroundtask];
    
    
}



-(void)clearFakeTask
{
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_async(mainQueue, ^(void) {
        
        [_timer_fakeTask invalidate];// 停止定时器
        
        // 每个对 beginBackgroundTaskWithExpirationHandler:方法的调用,必须要相应的调用 endBackgroundTask:方法。这样，来告诉应用程序你已经执行完成了。
        // 也就是说,我们向 iOS 要更多时间来完成一个任务,那么我们必须告诉 iOS 你什么时候能完成那个任务。
        // 也就是要告诉应用程序：“好借好还”嘛。
        // 标记指定的后台任务完成
        [[UIApplication sharedApplication] endBackgroundTask:_backgroundTaskIdentifier];
        // 销毁后台任务标识符
        _backgroundTaskIdentifier = UIBackgroundTaskInvalid;
    });
}




//
#pragma mark -----------------------backgroundtask

- (void)fakeTaskMethod
{
    NSLog(@"I'm a fake task! time_remaining=%.2fs",[[UIApplication sharedApplication] backgroundTimeRemaining]);
    if (_backgroundTimer == nil) { //加一层保护 防止有后台任务而后台没有启动
        [self startBackgroundtask];
    }
}
//
- (void)startBackgroundtask
{
    if ([UIApplication sharedApplication].scheduledLocalNotifications.count > 0) {
        //[self playSilenceSound];
        if (_backgroundTimer == nil) {
           
            _backgroundTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(backgroundTimerMethod) userInfo:nil repeats:YES];
            
        }
        
        NSLog(@"后台任务开启");
    }else{
        [self stopSilenceSound];
        NSLog(@"无任务，不开启后台");
    }
}

- (void)backgroundTimerMethod
{
    //NSLog(@"__________________I'm still alive!______________");
    

    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playyMusic) name:@"playmusicc" object:nil];
    
    
    
    for (UILocalNotification *ln in [[UIApplication sharedApplication] scheduledLocalNotifications]) {
        //        NSLog(@"%@ %@",[NSDate date],ln.fireDate);
        NSTimeInterval timeLeft = [ln.fireDate timeIntervalSinceDate:[NSDate date]];
        
        if (timeLeft <= 1 && timeLeft > 0) {
            
            
            //[self performSelector:@selector(processLocalNotification) withObject:nil afterDelay:1.2f];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                //
                [self processLocalNotification];
            });
            
            
            NSLog(@"_________还在活着_______");
            
            
        }
    }

    
}




#pragma mark ------------------------------APP 进入后台

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    NSLog(@"___________进入后台__________");
    
    [[NSNotificationCenter defaultCenter]
     postNotification:[NSNotification notificationWithName:DID_ENTER_BACKGROUND
                                                    object:self]];
    
    
    
    
    //起床
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getupBtnIsClicked_StopMusic) name:@"GetUpBtn_Is_CLICKED_STOPPMUSICC" object:nil];
    
//-------------------------------------------------
//-------------------------------------------------
    
    
    
    
    
    
    
//    _backgroundTaskIdentifier = [application beginBackgroundTaskWithExpirationHandler:^(void) {
//        
//        // 当应用程序留给后台的时间快要到结束时（应用程序留给后台执行的时间是有限的）， 这个Block块将被执行
//        // 我们需要在次Block块中执行一些清理工作。
//        // 如果清理工作失败了，那么将导致程序挂掉
//        
//        // 清理工作需要在主线程中用同步的方式来进行
//        [self clearFakeTask];
//    }];
//    
//    
//     //模拟一个Long-Running Task
//    
//    _timer_fakeTask = [NSTimer scheduledTimerWithTimeInterval:10.0f target:self selector:@selector(fakeTaskMethod) userInfo:nil repeats:YES];
//    
 
    
}




#pragma mark ------------------------------APP 变得活跃


/*
 APP 在后台(没有息屏) 来通知的时候 点击顶部的通知栏 调用此方法
 */

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
    
    NSLog(@"_____________APP 变得活跃_____________");
    
    [[NSNotificationCenter defaultCenter]
     postNotification:[NSNotification notificationWithName:DID_BECOME_ACTIVE
                                                    object:self]];
    
    
    
//-------------------------------------------------
//-------------------------------------------------
    
    
    
    
    
    
    
//    if (_backgroundTaskIdentifier != UIBackgroundTaskInvalid){
//        
//        [self clearFakeTask];
//    }
//    
//    [self clearBackgroundtask];
//
    
    
}


- (void)clearBackgroundtask
{
    [self stopSilenceSound];
    [_backgroundTimer invalidate];
    _backgroundTimer = nil;
    NSLog(@"后台任务结束");
}

- (void)stopSilenceSound
{
    
//    if (self.audioplayer.playing) {
//        [self.audioplayer stop];
//        self.audioplayer = nil;
//    }
    
}





#pragma mark ------------------------------APP 将要退出

- (void)applicationWillTerminate:(UIApplication *)application {
    
    NSLog(@"____________将要退出__________");
    
   
}


#pragma mark ------------------------------处理本地通知

- (void)processLocalNotification
{
    
    [_backgroundTimer invalidate];
    _backgroundTimer = nil;

        UIApplication *application = [UIApplication sharedApplication];
    
        switch (application.applicationState) {
            case UIApplicationStateActive:{
                
                [self playBackgroundMusic];
                
            }
                break;
            case UIApplicationStateInactive:{
                
                [self playBackgroundMusic];
                
            }
                break;
            case UIApplicationStateBackground:{
                
                [self playBackgroundMusic];

                //[self startVibrate];
                
               
            }
                 break;
            default:
                break;
        }
    
}





#pragma mark -------------------------------------起床
- (void)getupBtnIsClicked_StopMusic
{

    if (self.audioplayer.playing) {
        [self.audioplayer stop];
        self.audioplayer = nil;
    }
    
}



#pragma mark ------------------后台通知-------播放后台音乐

- (void)playBackgroundMusic
{
    
    
//    NSString *stttt = [NSUserDefaults standardUserDefaults].clockRRinggStr;
//    
//    
//    if (stttt == nil || stttt == NULL || [stttt isKindOfClass:[NSNull class]]) {
//        
//        self.ringgName = [[NSBundle mainBundle] pathForResource:@"欢快口哨音" ofType:@"mp3"];
//        
//    }else {
//        
//        self.ringgName = stttt;
//    }
    
    
    
    
    
//    self.ringgName = [[NSBundle mainBundle] pathForResource:@"欢快口哨音" ofType:@"mp3"];
//    
//    //
//    NSURL * playUrl = [NSURL fileURLWithPath:self.ringgName];
//    
//    NSError * error;
//    
//    self.audioplayer = [[AVAudioPlayer alloc] initWithContentsOfURL:playUrl error:&error];
//    
//    self.audioplayer.numberOfLoops = -1;
//    self.audioplayer.volume = 2.0;
//    
//    [self.audioplayer prepareToPlay];
//    
//    
//    if (!self.audioplayer) {
//
//        NSLog(@"AudioPlayer did not load properly: %@", [error description]);
//
//        NSLog(@"_____后台___铃声播放器初始化失败_____");
//        
//        
//        
//        //[self playRingMusicBackgrounund];
//        
//        
//        
//
//    } else
//
//        [self.audioplayer play];
//    
//
    
    
    
    
    
    
    
    
    
    
//    NSString *strrPath = [NSUserDefaults standardUserDefaults].clockRRinggStr;
//    
//    
//    
//    NSLog(@"下载路径: %@",strrPath);
    
    //NSString *author_name = [NSUserDefaults standardUserDefaults].notifyDnloadPaath;
    
    
    
    
//    if (strrPath == nil || strrPath == NULL || [strrPath isKindOfClass:[NSNull class]] || author_name == nil || author_name == NULL || [author_name isKindOfClass:[NSNull class]]) {
//        
//        self.ringgName = [[NSBundle mainBundle] pathForResource:@"欢快口哨音" ofType:@"mp3"];
//        
//    }else {
//        
//        self.ringgName = strrPath;
//        
//    }
    
    
    
    
    //self.ringgName = [[NSBundle mainBundle] pathForResource:@"欢快口哨音" ofType:@"mp3"];
    

    
    
    
    
    
//    //异步加载音频播放器进行播放
//    
//    dispatch_queue_t dispatchQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    
//    dispatch_async(dispatchQueue, ^(void) {
//        
//        
//        NSData *fileData = [NSData dataWithContentsOfFile:strrPath];
//        
//        NSError *error = nil;
//        
//        // 初始化音频控制器
//        self.audioplayer = [[AVAudioPlayer alloc] initWithData:fileData error:&error];
//        
//        if (self.audioplayer != nil) {
//            
//            self.audioplayer.delegate = self;// 设置 delegate
//            
//            self.audioplayer.numberOfLoops = -1;
//            self.audioplayer.volume = 2.0;
//            
//            [self.audioplayer prepareToPlay];
//            
//            [self.audioplayer play];
//            
//            
//        } else {
//            // 初始化 AVAudioPlayer 失败
//            
//            NSLog(@"AudioPlayer did not load properly: %@", [error description]);
//            
//            NSLog(@"_____后台___铃声播放器初始化失败_____");
//            
//            
//            //[self playRingMusicBackgrounund];
//            
//
//        }
//        
//        
//    });
//
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    AVAudioSession *session = [AVAudioSession sharedInstance];
    
    [session setCategory:AVAudioSessionCategoryPlayback error:nil];
    
    [session setActive:YES error:nil];

    //NSArray *arrr = [ZMClockChooseLoveDouModel findAll];
    
    //ZMClockChooseLoveDouModel *doumollde = arrr[0];
    
    //NSString *stff = doumollde.voice_pathh;
    
    
    NSString *strrPath = [NSUserDefaults standardUserDefaults].clockRRinggStr;
    
    NSLog(@"下载路径: %@",strrPath);

    
    BOOL fileexit = [[NSFileManager defaultManager] fileExistsAtPath:strrPath];
    
    NSLog(@"本地路径__是否存在__ %d",fileexit);
    
    if (fileexit) {
        
//        if (self.audioplayer && [self.audioplayer isPlaying]) {
//            
//            return;
//            
//        }
        
        NSError *error;
        
        //self.audioplayer = nil;
        
        NSData *daata = [[NSFileManager defaultManager] contentsAtPath:strrPath];
        
        self.audioplayer = [[AVAudioPlayer alloc] initWithData:daata error:&error];
        
        
        self.audioplayer.numberOfLoops = -1;
        
        self.audioplayer.volume = 2.0;
        
        [self.audioplayer prepareToPlay];
        
        
        [self.audioplayer play];

        
//        if (!self.audioplayer) {
//            //
//            NSLog(@"_____后台___铃声播放器初始化失败_____");
//            
//            NSLog(@"播放器__error loading %@",error);
//            
//        } else {
        
        //    [self.audioplayer play];
        
        //}
        
        
        
        
        
        
    } else {
    
    
        
    
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   // [[NSNotificationCenter defaultCenter] postNotificationName:@"PLAYMUSIC_ON_BACKGROUND" object:self];
    
    
    
    
}




/*
 
 //download file and play from disk
 NSData *audioData = [NSData dataWithContentsOfURL:someURL];
 NSString *docDirPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
 NSString *filePath = [NSString stringWithFormat:@"%@/%@.mp3", docDirPath , fileName];
 [audioData writeToFile:filePath atomically:YES];
 
 NSError *error;
 NSURL *fileURL = [NSURL fileURLWithPath:filePath];
 player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:&error];
 if (player == nil) {
 NSLog(@"AudioPlayer did not load properly: %@", [error description]);
 } else {
 [player play];
 }
 
 */












#pragma mark ------------------------------APP 收到通知

/*
 APP 没有被杀死的时候
 */


/*
 APP 在前台时  调用此方法
 */

/*
 或者 APP 在后台(息屏的状态)  通过滑动通知 进入 调用此方法
 */


/*
 APP 在后台(没有息屏) 来通知的时候 点击顶部的通知栏 调用此方法
 */


- (void)application:(UIApplication *)application didReceiveLocalNotification:( UILocalNotification *)notification
{
 
    
    if(application.applicationState == UIApplicationStateActive) {
        
        [[NSNotificationCenter defaultCenter]
         postNotification:[NSNotification notificationWithName:DID_RECEIVE_LOCAL_NOTIFICATION_STATE_ACTIVE
                                                        object:self]];
        
    }
    
    
    if(application.applicationState == UIApplicationStateInactive) {
        [[NSNotificationCenter defaultCenter]
         postNotification:[NSNotification notificationWithName:DID_RECEIVE_LOCAL_NOTIFICATION_IN_ACTIVE
                                                        object:self]];
    }

    
    
//-------------------------------------------------
//-------------------------------------------------
  
    
    NSLog(@"闹钟响了____🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔🔔");
    
    
    
    
    
    
    
    
#pragma mark --------------------------------获取当前通知
    
    NSDictionary *userDic = [notification userInfo];
    
    __block NSString *clockKey;
   
    [userDic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        
        //NSLog(@"key = %@ and obj = %@", key, obj);
        
        if ([obj isEqualToString:@"添加闹钟了"]) {
            
            clockKey = key;
            
            NSLog(@"-当前通知的 Key---------%@",clockKey);
            
            //传值 key
            [NSUserDefaults standardUserDefaults].clock_Key = clockKey;
        }
        
    }];
    
    
#pragma mark ----------------------------------发送通知
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"ZMCLOCKISRING_STATE_ACTIVE" object:self];
    
#pragma mark -------------------------------添加闹钟开始页
    
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"APP_RECEIVEED_CLOCKNOTIFY_BACKGROUND" object:self];
    
    
    
    //ZMClockStartPageeViewController *clockStart = [[ZMClockStartPageeViewController alloc] init];
    
    //[kWindow setRootViewController:clockStart];
    
    
    
    
    
    
    
    
    
    
    
    
    //后台
//    if(application.applicationState == UIApplicationStateInactive) {
//        
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"ReveiveLocalNotify_PlayMusic" object:self];
//
//        
//    }
    
    
    
    
    
    
    
    //[self playBackgroundMusic];
    
    
    
    
    
    
    
    
    
//    switch (application.applicationState) {
//        case UIApplicationStateActive:{
//            
//            [self playBackgroundMusic];
//            
//            
//        }
//            break;
//        case UIApplicationStateInactive:{
//            
//            [self playBackgroundMusic];
//            
//        }
//            break;
//        case UIApplicationStateBackground:{
//            
//            [self playBackgroundMusic];
//            
//            
//        }
//            break;
//        default:
//            break;
//    }
//
    
    

}




#pragma mark ------------------------------APP 进入前台

-(void)applicationWillEnterForeground:(UIApplication *)application
{
    //进入前台取消应用消息图标
    //[[UIApplication sharedApplication]setApplicationIconBadgeNumber:0];
    
    
    
    
}


#pragma mark -alertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
//    if (alertView.tag == 100001) {
//        if (buttonIndex == 0) {
//            //
//            [self.player stop];
//            self.player = nil;
//            
//            
//        }
//    }else if (alertView.tag == 100002){
//    
//        if (buttonIndex == 1) {
//            //评论页
//            NSString * appstoreUrlString = @"http://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?mt=8&onlyLatestVersion=true&pageNumber=0&sortOrdering=1&type=Purple+Software&id=1126233766";
//            
//            //NSString * appstoreUrlString = @"http://ax.itunes.apple.com/WebObjects/MZStore.woa /wa/viewContentsUserReviews?type=Purple+Software&id=1126233766";
//            NSURL * url = [NSURL URLWithString:appstoreUrlString];
//            
//            if ([[UIApplication sharedApplication] canOpenURL:url])
//            {
//                [[UIApplication sharedApplication] openURL:url];
//            }else
//            {
//                NSLog(@"can not open");
//            }
//            
//        }
//
//        
//    
//    }else {
//    }
    
    
    
    if (buttonIndex == 0) {
        //
        [self.audioplayer stop];
        self.audioplayer = nil;

    }

    
    
    

}




@end
