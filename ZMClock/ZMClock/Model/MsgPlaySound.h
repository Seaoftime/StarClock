//
//  MsgPlaySound.h
//  ClockTest
//
//  Created by ZhongMeng on 16/2/20.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>
#import <CoreFoundation/CoreFoundation.h>
#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import <CoreFoundation/CoreFoundation.h>

#pragma mark ************ 程序的沙盒目录 ****************
#define HomeDirectoryDocumentFilePath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)/*这是获取沙盒目录*/ objectAtIndex:0]

@interface MsgPlaySound : NSObject
{
    SystemSoundID sound;//系统声音的id 取值范围为：1000-2000
    void *sample;
    SystemSoundID soundID;
}
- (id)initSystemShake;//系统 震动
- (id)initSystemSoundWithName:(NSString *)soundName SoundType:(NSString *)soundType;//初始化系统声音
- (void)play;//播放
- (void)playWithID:(int)systemeID;


@end
