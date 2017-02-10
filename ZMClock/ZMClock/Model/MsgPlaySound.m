//
//  MsgPlaySound.m
//  ClockTest
//
//  Created by ZhongMeng on 16/2/20.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "MsgPlaySound.h"

@implementation MsgPlaySound





- (id)initSystemShake
{
    self = [super init];
    if (self) {
        sound = kSystemSoundID_Vibrate;//震动
    }
    return self;
}

- (id)initSystemSoundWithName:(NSString *)soundName SoundType:(NSString *)soundType
{
    return nil;
}

- (void)playWithID:(int)systemeID
{
    soundID  = systemeID;
    /**
     因为在模拟器上可能不能播放，所以必须真机才能使用
     */
    /*添加音频结束时的回调*/
    AudioServicesAddSystemSoundCompletion(soundID, NULL, NULL, SoundFinished,sample);
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    AudioServicesPlaySystemSound(soundID);
    
}


//当音频播放完毕会调用这个函数
static void SoundFinished(SystemSoundID soundID,void *smss)
{
    /*播放全部结束，因此释放所有资源 */
    AudioServicesDisposeSystemSoundID(soundID);
    CFRunLoopStop(CFRunLoopGetCurrent());
}



-(void)play
{
    
    //,@"google",@"ios",@"google",@"ios"
    NSArray *na = @[@"ios"];
    for (int i = 0; i<[na count]; i++)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:na[i] ofType:@"mp3"];
        
        if (path)
        {
            
            OSStatus error =  AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path], &soundID);
            
            if (error == kAudioServicesNoError)
            {
                /*添加音频结束时的回调*/
                AudioServicesAddSystemSoundCompletion(soundID, NULL, NULL, SoundFinished,sample);
                AudioServicesPlaySystemSound(soundID);
                CFRunLoopRun();
            }
            else
            {
                NSLog(@"Failed to create sound");
            }
        }
    }
    
}







@end
