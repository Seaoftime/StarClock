//
//  NSUserDefaults+Category.h
//  Taskstudy
//
//  Created by yaolizhi on 15/12/2.
//  Copyright © 2015年 yaolizhi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (Category)


/**
 设置并同步保存
 */
+(void)setObject:(id)value forKey:(NSString*)defaultName;

/**
 设置为BOOL值
 */
+(void)setBoolObject:(BOOL)value forKey:(NSString*)defaultName;


/**
 翻译BOOL值
 */
+(BOOL)objectBoolForKey:(NSString*)defaultName;
/**
 获取key对应数据内容
 */
+(id)objectForKey:(NSString*)defaultName;


//人脸识别图片



#pragma mark -张锐

@property (nonatomic, setter = setMusicIndex:, getter = musicIndex) NSInteger musicIndex;//录音文件路径记号
@property (nonatomic, setter = setFirstLoad:, getter = firstLoad) NSInteger firstLoad;//判断第一次进入某个页面

@property (nonatomic, copy, setter = setSelectedMusicPath:, getter = selectedMusicPath) NSString *selectedMusicPath;//保存铃音路径

@property (nonatomic, copy, setter = setFaceDetectorImageStr:, getter = faceDetectorImageStr) NSString *faceDetectorImageStr;//人脸识别图片

@property (nonatomic, copy, setter = setFaceDetectorImageStr2:, getter = faceDetectorImageStr2) NSString *faceDetectorImageStr2;//人脸识别图片2

//@property (nonatomic, copy, setter = setLasttImgStr1:, getter = lasttImgStr1) NSString *lasttImgStr1;//最终处理的头像
//@property (nonatomic, copy, setter = setLasttImgStr2:, getter = lasttImgStr2) NSString *lasttImgStr2;//





@property (nonatomic, copy, setter = setRobot_Nickname:, getter = robot_Nickname) NSString *robot_Nickname;//机器人昵称
@property (nonatomic, copy, setter = setYouWantListen_Nickname:, getter = youWantListen_Nickname) NSString *youWantListen_Nickname;//你想听到的称呼



@property (nonatomic, copy, setter = setRobot_AvatarImgStr:, getter = robot_AvatarImgStr) NSString *robot_AvatarImgStr;//对方(机器人)头像

@property (nonatomic, copy, setter = setUserr_AvatarImgStr:, getter = userr_AvatarImgStr) NSString *userr_AvatarImgStr;//用户头像



@property (nonatomic, copy, setter = setMainUserHeadPortaitStr:, getter = mainUserHeadPortaitStr) NSString *mainUserHeadPortaitStr;//首页用户头像
@property (nonatomic, copy, setter = setMainUserLoveLevelStr:, getter = mainUserLoveLevelStr) NSString *mainUserLoveLevelStr;//首页亲密等级


@property (nonatomic, copy, setter = setDiy_saveImgStr:, getter = diy_saveImgStr) NSString *diy_saveImgStr;//DIY保存 图片


@property (nonatomic, copy, setter = setMe_userImageUrl:, getter = me_userImageUrl) NSString *me_userImageUrl;


///////////进入第一个造型还是第二个造型标记
@property (nonatomic, copy, setter = setDiy_firstOrSecond:, getter = diy_firstOrSecond) NSString *diy_firstOrSecond;

//////是否登录
@property (nonatomic, copy, setter = setNotLoginOrLogin:, getter = notLoginOrLogin) NSString *notLoginOrLogin;

/////识别的最终图片 剪切过的  cuttImg
@property (nonatomic, copy, setter = setCutt_Imgg:, getter = cutt_Imgg) NSString *cutt_Imgg;

//////从相册还是相机
@property (nonatomic, copy, setter = setPhoto_From:, getter = photo_From) NSString *photo_From;


///DIY 搭配按钮点击了
@property (nonatomic, copy, setter = setDiy_DapeiBtnClicked:, getter = diy_DapeiBtnClicked) NSString *diy_DapeiBtnClicked;

////闹钟⏰
@property (nonatomic, copy, setter = setClock_Key:, getter = clock_Key) NSString *clock_Key;


///////////闹钟列表头像
@property (nonatomic, copy, setter = setClockListHeadPoritStr:, getter = clockListHeadPoritStr) NSString *clockListHeadPoritStr;
///////////闹钟铃声
@property (nonatomic, copy, setter = setClockRRinggStr:, getter = clockRRinggStr) NSString *clockRRinggStr;

///////////通知下载的 url (解决闹钟铃声不响的问题)

@property (nonatomic, copy, setter = setNotifyDownloaddStt:, getter = notifyDownloaddStt) NSString *notifyDownloaddStt;

///////////通知下载的 路径 (解决闹钟铃声不响的问题)

@property (nonatomic, copy, setter = setNotifyDnloadPaath:, getter = notifyDnloadPaath) NSString *notifyDnloadPaath;





///////////闹钟换爱豆提示
@property (nonatomic, copy, setter = setClockTiShiiStt:, getter = clockTiShiiStt) NSString *clockTiShiiStt;


////设置界面 爱豆昵称
@property (nonatomic, copy, setter = setAidouNickName:, getter = aidouNickName) NSString *aidouNickName;






////语音秘书声音
@property (nonatomic, copy, setter = setSpeaker_Namee:, getter = speaker_Namee) NSString *speaker_Namee;






@end
