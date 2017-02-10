//
//  DropperAVAudioPlayer.m
//  Dropper
//
//  Created by ZhongMeng on 16/2/29.
//  Copyright © 2016年 yaolizhi. All rights reserved.
//

#import "DropperAVAudioPlayer.h"
#import <AVFoundation/AVFoundation.h>



@interface DropperAVAudioPlayer () <AVAudioPlayerDelegate>
@property (nonatomic,strong) NSMutableArray *playArray; //!< 需要播放的内容的数组
@property (nonatomic,strong) AVAudioPlayer *audioPlayer; //播放器
@property (nonatomic) NSInteger indexNumber; //!< 当前播放的序号
@property (nonatomic) NSInteger count; //!< 当前数组的元素个数
@property (nonatomic) NSInteger PlayType; // !< 播放



@end




@implementation DropperAVAudioPlayer

static DropperAVAudioPlayer *sharedObject = nil; //第一步：静态实例，并初始化。

+(DropperAVAudioPlayer*)sharedAVAudioPlayer
{
    static dispatch_once_t once;
    dispatch_once(&once,^{
        
        sharedObject = [[self alloc]init];
    });
    return sharedObject;
}



-(void)startWithArray:(NSMutableArray*)array withType:(PlayType)type
{
    [self setPlayType:type];
    [self setIndexNumber:0];
    [self setCount:[array count]];
    [self.playArray setArray:array];
    NSString *name = [array objectAtIndex:self.indexNumber];
    [self audioPlayerWithName:name withPlayType:type];
}



#pragma mark - Getter/Setter Method

-(NSMutableArray*)playArray
{
    if (_playArray == nil)
    {
        _playArray = [NSMutableArray array];
    }
    return _playArray;
}




#warning 提示 “ColockTemp” 文件夹名字一定要是用户设置确定的文件夹
/**
 *  创建播放器
 *
 *  @return 音频播放器
 */
-(void)audioPlayerWithName:(NSString*)name withPlayType:(PlayType)playType
{
     NSString *urlStr = @"播放路径";
    switch (playType)
    {
        case ClockPlay:
        {
            urlStr = [HomeDirectoryDocumentLastObjectFilePath stringByAppendingPathComponent:@"ColockTemp"];
        }
            break;
        case WeatherPlay:
        {
            urlStr = [HomeDirectoryDocumentLastObjectFilePath stringByAppendingPathComponent:@"WeatherTemp"];
        }
            break;
    }
   
    urlStr = [urlStr stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.wav",name]];
    NSLog(@"file path:%@",urlStr);
    NSURL *url=[NSURL fileURLWithPath:urlStr];
    NSError *error=nil;
    //初始化播放器，注意这里的Url参数只能时文件路径，不支持HTTP Url
    _audioPlayer=[[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
    //设置播放器属性
    [_audioPlayer setNumberOfLoops:0];   //设置为0不循环
    [_audioPlayer setDelegate:self];
    [_audioPlayer prepareToPlay];   //加载音频文件到缓存
    [_audioPlayer play];
    
    if(error)
    {
        NSLog(@"初始化播放器过程发生错误,错误信息:%@",error.localizedDescription);
    }
}





#pragma mark - Delegate Method
#pragma mark  播放器代理方法
-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    [self setIndexNumber:self.indexNumber+1];
    if (self.indexNumber < self.count)
    {
        NSString *name = [self.playArray objectAtIndex:self.indexNumber];
        [self audioPlayerWithName:name withPlayType:self.PlayType];
    }
}

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError * __nullable)error
{
    
}


#pragma mark - Response Method



#pragma mark - PrivateMethod

/**
 *  播放音频
 */
-(void)play
{
    if (![self.audioPlayer isPlaying])
    {
        [self.audioPlayer play];
    }
}


/**
 *  暂停播放
 */
-(void)pause
{
    if ([self.audioPlayer isPlaying])
    {
        [self.audioPlayer pause];
        
    }
}




@end
