//
//  NSUserDefaults+Category.m
//  Taskstudy
//
//  Created by yaolizhi on 15/12/2.
//  Copyright © 2015年 yaolizhi. All rights reserved.
//

#import "NSUserDefaults+Category.h"


NSString *const ZMDefaultsMusicIndex = @"musicIndex";
NSString *const ZMDefaultsFirstLoad = @"firstLoad";
NSString *const ZMDefaultsSelectedMusicPath = @"selectedMusicPath";
NSString *const ZMDefaultsFaceDetectorImageStr = @"faceDetectorImageStr";
NSString *const ZMDefaultsFaceDetectorImageStr2 = @"faceDetectorImageStr2";

NSString *const ZMDefaultsLasttImg1 = @"lasttImgStr1";
NSString *const ZMDefaultsLasttImg2 = @"lasttImgStr2";


NSString *const ZMDefaultsRobot_Nickname = @"robot_Nickname";
NSString *const ZMDefaultsYouWantListen_Nickname = @"youWantListen_Nickname";



NSString *const ZMDefaultsRobot_AvatarImgStr = @"robot_AvatarImgStr";

NSString *const ZMDefaultsUserr_AvatarImgStr = @"userr_AvatarImgStr";


NSString *const ZMDefaultsMainUserHeadPortaitStr = @"mainUserHeadPortaitStr";
NSString *const ZMDefaultsMainUserLoveLevelStr = @"mainUserLoveLevelStr";


NSString *const ZMDefaultsDiy_saveImgStr = @"diy_saveImgStr";

NSString *const ZMDefaultsMe_userImageUrl = @"me_userImageUrl";


NSString *const ZMDefaultsDiy_firstOrSecond = @"diy_firstOrSecond";

NSString *const ZMDefaultsNotLoginOrLogin = @"notLoginOrLogin";

NSString *const ZMDefaultsCutt_Imgg = @"cutt_Imgg";

NSString *const ZMDefaultsPhoto_From = @"photo_From";

NSString *const ZMDefaultsDiy_DapeiBtnClicked = @"diy_DapeiBtnClicked";

NSString *const ZMDefaultsClock_Key = @"clock_Key";

NSString *const ZMDefaultsClockListHeadPoritStr = @"clockListHeadPoritStr";

NSString *const ZMDefaultsClockRRinggStr = @"clockRRinggStr";

NSString *const ZMDefaultsClockTiShiiStt = @"clockTiShiiStt";



NSString *const ZMDefaultsAidouNickName = @"aidouNickName";


NSString *const ZMDefaultsNotifyDownloaddStt = @"notifyDownloaddStt";


NSString *const ZMDefaultsNotifyDnloadPaath = @"notifyDnloadPaath";


NSString *const ZMDefaultsSpeaker_Namee = @"speaker_Namee";





@implementation NSUserDefaults (Category)


+(void)setObject:(id)value forKey:(NSString*)defaultName
{
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(void)setBoolObject:(BOOL)value forKey:(NSString*)defaultName
{
    [[NSUserDefaults standardUserDefaults] setBool:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(BOOL)objectBoolForKey:(NSString*)defaultName
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:defaultName];
}



+(id)objectForKey:(NSString*)defaultName
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
}


#pragma mark - 张锐新加
#pragma mark - companyCode

- (void)saveObject:(id)obj forKey:(NSString* )key
{
    [self setObject:obj forKey:key];
    [self synchronize];
}


//
- (void)setMusicIndex:(NSInteger)musicIndex
{
    [self saveObject:[NSString stringWithFormat:@"%ld",(long)musicIndex] forKey:ZMDefaultsMusicIndex];
}

- (NSInteger)musicIndex
{
    return [[self stringForKey:ZMDefaultsMusicIndex] integerValue];
}


- (void)setFirstLoad:(NSInteger)firstLoad
{
    [self saveObject:[NSString stringWithFormat:@"%ld",(long)firstLoad] forKey:ZMDefaultsFirstLoad];

}


- (NSInteger)firstLoad
{
    return [[self stringForKey:ZMDefaultsFirstLoad] integerValue];

}

- (void)setSelectedMusicPath:(NSString *)selectedMusicPath
{
    [self saveObject:selectedMusicPath forKey:ZMDefaultsSelectedMusicPath];

}

- (NSString *)selectedMusicPath
{
    return [self stringForKey:ZMDefaultsSelectedMusicPath];

}

- (void)setFaceDetectorImageStr:(NSString *)faceDetectorImageStr
{
    [self saveObject:faceDetectorImageStr forKey:ZMDefaultsFaceDetectorImageStr];

}

- (NSString *)faceDetectorImageStr
{
    return [self stringForKey:ZMDefaultsFaceDetectorImageStr];
}

- (void)setFaceDetectorImageStr2:(NSString *)faceDetectorImageStr2
{
    [self saveObject:faceDetectorImageStr2 forKey:ZMDefaultsFaceDetectorImageStr2];
    
}

- (NSString *)faceDetectorImageStr2
{
    return [self stringForKey:ZMDefaultsFaceDetectorImageStr2];
}




- (void)setRobot_Nickname:(NSString *)robot_Nickname
{

    [self saveObject:robot_Nickname forKey:ZMDefaultsRobot_Nickname];

}

- (NSString *)robot_Nickname
{


    return [self stringForKey:ZMDefaultsRobot_Nickname];

}


- (void)setYouWantListen_Nickname:(NSString *)youWantListen_Nickname
{


    [self saveObject:youWantListen_Nickname forKey:ZMDefaultsYouWantListen_Nickname];

}

- (NSString *)youWantListen_Nickname
{

    return [self stringForKey:ZMDefaultsYouWantListen_Nickname];

}



- (void)setRobot_AvatarImgStr:(NSString *)robot_AvatarImgStr
{
    [self saveObject:robot_AvatarImgStr forKey:ZMDefaultsRobot_AvatarImgStr];

}


- (NSString *)robot_AvatarImgStr
{

    return [self stringForKey:ZMDefaultsRobot_AvatarImgStr];
    
}


- (void)setUserr_AvatarImgStr:(NSString *)userr_AvatarImgStr
{

    [self saveObject:userr_AvatarImgStr forKey:ZMDefaultsUserr_AvatarImgStr];

}


- (NSString *)userr_AvatarImgStr
{

    return [self stringForKey:ZMDefaultsUserr_AvatarImgStr];


}



- (void)setDiy_saveImgStr:(NSString *)diy_saveImgStr
{


    [self saveObject:diy_saveImgStr forKey:ZMDefaultsDiy_saveImgStr];

}


- (NSString *)diy_saveImgStr
{

    return [self stringForKey:ZMDefaultsDiy_saveImgStr];
}




- (void)setMainUserHeadPortaitStr:(NSString *)mainUserHeadPortaitStr
{


    [self saveObject:mainUserHeadPortaitStr forKey:ZMDefaultsMainUserHeadPortaitStr];
    
}
- (NSString *)mainUserHeadPortaitStr
{

    return [self stringForKey:ZMDefaultsMainUserHeadPortaitStr];
    
}

- (void)setMainUserLoveLevelStr:(NSString *)mainUserLoveLevelStr
{
    
    
    [self saveObject:mainUserLoveLevelStr forKey:ZMDefaultsMainUserLoveLevelStr];
    
}

- (NSString *)mainUserLoveLevelStr
{
    
    return [self stringForKey:ZMDefaultsMainUserLoveLevelStr];
    
}


//个人资料
- (void)setMe_userImageUrl:(NSString *)me_userImageUrl
{
    
    
    [self saveObject:me_userImageUrl forKey:ZMDefaultsMe_userImageUrl];
    
}

- (NSString *)me_userImageUrl
{
    
    return [self stringForKey:ZMDefaultsMe_userImageUrl];
    
}


- (void)setDiy_firstOrSecond:(NSString *)diy_firstOrSecond
{
    
    
    [self saveObject:diy_firstOrSecond forKey:ZMDefaultsDiy_firstOrSecond];
    
}

- (NSString *)diy_firstOrSecond
{
    
    return [self stringForKey:ZMDefaultsDiy_firstOrSecond];
    
}

- (void)setNotLoginOrLogin:(NSString *)notLoginOrLogin
{

    [self saveObject:notLoginOrLogin forKey:ZMDefaultsNotLoginOrLogin];

}


- (NSString *)notLoginOrLogin
{

    return [self stringForKey:ZMDefaultsNotLoginOrLogin];
    
}


- (void)setCutt_Imgg:(NSString *)cutt_Imgg
{

    [self saveObject:cutt_Imgg forKey:ZMDefaultsCutt_Imgg];

}

- (NSString *)cutt_Imgg
{


   return [self stringForKey:ZMDefaultsCutt_Imgg];

}

- (void)setPhoto_From:(NSString *)photo_From
{


    [self saveObject:photo_From forKey:ZMDefaultsPhoto_From];

}

- (NSString *)photo_From
{

    return [self stringForKey:ZMDefaultsPhoto_From];

}

- (void)setDiy_DapeiBtnClicked:(NSString *)diy_DapeiBtnClicked
{

    [self saveObject:diy_DapeiBtnClicked forKey:ZMDefaultsDiy_DapeiBtnClicked];
}

- (NSString *)diy_DapeiBtnClicked
{

    return [self stringForKey:ZMDefaultsDiy_DapeiBtnClicked];

}


- (void)setClock_Key:(NSString *)clock_Key
{

    [self saveObject:clock_Key forKey:ZMDefaultsClock_Key];
}


- (NSString *)clock_Key

{

    return [self stringForKey:ZMDefaultsClock_Key];

}



- (void)setClockListHeadPoritStr:(NSString *)clockListHeadPoritStr
{

    [self saveObject:clockListHeadPoritStr forKey:ZMDefaultsClockListHeadPoritStr];

}


- (NSString *)clockListHeadPoritStr
{

    return [self stringForKey:ZMDefaultsClockListHeadPoritStr];

}

- (void)setClockRRinggStr:(NSString *)clockRRinggStr
{

     [self saveObject:clockRRinggStr forKey:ZMDefaultsClockRRinggStr];
}


- (NSString *)clockRRinggStr
{

    return [self stringForKey:ZMDefaultsClockRRinggStr];

}



- (void)setClockTiShiiStt:(NSString *)clockTiShiiStt
{

    [self saveObject:clockTiShiiStt forKey:ZMDefaultsClockTiShiiStt];

}


- (NSString *)clockTiShiiStt
{

    return [self stringForKey:ZMDefaultsClockTiShiiStt];
    
}




- (void)setAidouNickName:(NSString *)aidouNickName
{

    [self saveObject:aidouNickName forKey:ZMDefaultsAidouNickName];

}


- (NSString *)aidouNickName
{
    
    return [self stringForKey:ZMDefaultsAidouNickName];
    
}





- (void)setNotifyDownloaddStt:(NSString *)notifyDownloaddStt
{
     [self saveObject:notifyDownloaddStt forKey:ZMDefaultsNotifyDownloaddStt];

}

- (NSString *)notifyDownloaddStt
{
    
    return [self stringForKey:ZMDefaultsNotifyDownloaddStt];

}





- (void)setNotifyDnloadPaath:(NSString *)notifyDnloadPaath
{


     [self saveObject:notifyDnloadPaath forKey:ZMDefaultsNotifyDnloadPaath];
    


}




- (NSString *)notifyDnloadPaath
{


    return [self stringForKey:ZMDefaultsNotifyDnloadPaath];

}





- (void)setSpeaker_Namee:(NSString *)speaker_Namee
{


     [self saveObject:speaker_Namee forKey:ZMDefaultsSpeaker_Namee];

}


- (NSString *)speaker_Namee
{


     return [self stringForKey:ZMDefaultsSpeaker_Namee];

}









//- (void)setFirstPage_robtChatSearchSong:(NSString *)firstPage_robtChatSearchSong
//{
//    [self saveObject:firstPage_robtChatSearchSong forKey:ZMDefaultsFirstPage_robtChatSearchSong];
//
//
//}
//
//
//- (NSString *)firstPage_robtChatSearchSong
//{
//
//    return [self stringForKey:ZMDefaultsFirstPage_robtChatSearchSong];
//}



@end










