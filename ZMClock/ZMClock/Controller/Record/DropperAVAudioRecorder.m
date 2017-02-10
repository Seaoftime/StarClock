//
//  DropperAVAudioRecorder.m
//  Dropper
//
//  Created by ZhongMeng on 16/2/29.
//  Copyright © 2016年 yaolizhi. All rights reserved.
//

#import "DropperAVAudioRecorder.h"
#import <AVFoundation/AVFoundation.h>

#define CGFloat_y  350

#define RecorderWidthAndHight 80



@interface DropperAVAudioRecorder () <AVAudioRecorderDelegate>

@property (nonatomic,strong) AVAudioRecorder *audioRecorder;//音频录音机
@property (nonatomic,strong) AVAudioPlayer *audioPlayer;//音频播放器，用于播放录音文件

@property (strong, nonatomic)  UIButton *record;//开始录音
@property (strong, nonatomic)  UIButton *pause;//暂停录音
@property (strong, nonatomic)  UIButton *resume; //恢复录音
@property (strong, nonatomic)  UIButton *stop;//停止录音


@end



@implementation DropperAVAudioRecorder


-(instancetype)initWithObject:(UIViewController*)object
{
    self = [super init];
    if (self)
    {
        [self setAudioSession];
//        [object.view addSubview:self.record];
//        [object.view addSubview:self.pause];
//        [object.view addSubview:self.resume];
//        [object.view addSubview:self.stop];
    }
    return self;
}



#pragma mark 开始录音
-(UIButton*)record
{
    if (_record == nil)
    {
        _record = [UIButton buttonWithType:UIButtonTypeCustom];
        [_record setFrame:CGRectMake(10, CGFloat_y, RecorderWidthAndHight, RecorderWidthAndHight)];
        [_record setTitle:@"录音" forState:UIControlStateNormal];
        [_record setBackgroundColor:[UIColor greenColor]];
        [_record addTarget:self action:@selector(recordClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _record;
}


#pragma mark 暂停录音
-(UIButton*)pause
{
    if (_pause == nil)
    {
        _pause = [UIButton buttonWithType:UIButtonTypeCustom];
        [_pause setFrame:CGRectMake(100, CGFloat_y, RecorderWidthAndHight, RecorderWidthAndHight)];
        [_pause setTitle:@"暂停录音" forState:UIControlStateNormal];
        [_pause setBackgroundColor:[UIColor greenColor]];
        [_pause addTarget:self action:@selector(pauseClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pause;
}


#pragma mark 恢复录音
-(UIButton*)resume
{
    if (_resume == nil)
    {
        _resume = [UIButton buttonWithType:UIButtonTypeCustom];
        [_resume setFrame:CGRectMake(190,CGFloat_y, RecorderWidthAndHight, RecorderWidthAndHight)];
        [_resume setTitle:@"恢复录音" forState:UIControlStateNormal];
        [_resume setBackgroundColor:[UIColor greenColor]];
        [_resume addTarget:self action:@selector(resumeClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _resume;
}

#pragma mark 停止录音
-(UIButton*)stop
{
    if (_stop == nil)
    {
        _stop = [UIButton buttonWithType:UIButtonTypeCustom];
        [_stop setFrame:CGRectMake(280, CGFloat_y, RecorderWidthAndHight, RecorderWidthAndHight)];
        [_stop setTitle:@"停止录音" forState:UIControlStateNormal];
        [_stop setBackgroundColor:[UIColor greenColor]];
        [_stop addTarget:self action:@selector(stopClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _stop;
}




#pragma mark - 设置方法
/**
 *  设置音频会话
 */
-(void)setAudioSession
{
    AVAudioSession *audioSession=[AVAudioSession sharedInstance];
    //设置为播放和录音状态，以便可以在录制完之后播放录音
    [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    [audioSession setActive:YES error:nil];
}

/**
 *  取得录音文件保存路径
 *
 *  @return 录音文件路径
 */
-(NSURL *)getSavePath
{

    NSString *urlStr = [HomeDirectoryDocumentLastObjectFilePath stringByAppendingPathComponent:kRecordAudioFile];
    NSLog(@"file path:%@",urlStr);
    NSURL *url=[NSURL fileURLWithPath:urlStr];
    return url;
}

/**
 *  取得录音文件设置
 *
 *  @return 录音设置
 */
-(NSDictionary *)getAudioSetting
{
    NSMutableDictionary *dicM=[NSMutableDictionary dictionary];
    //设置录音格式kAudioFormatMPEGLayer3 kAudioFormatLinearPCM
    [dicM setObject:@(kAudioFormatLinearPCM) forKey:AVFormatIDKey];
    //设置录音采样率，8000是电话采样率，对于一般录音已经够了
    [dicM setObject:@(8000) forKey:AVSampleRateKey];
    //设置通道,这里采用单声道
    [dicM setObject:@(1) forKey:AVNumberOfChannelsKey];
    //每个采样点位数,分为8、16、24、32
    [dicM setObject:@(8) forKey:AVLinearPCMBitDepthKey];
    //是否使用浮点数采样
    [dicM setObject:@(YES) forKey:AVLinearPCMIsFloatKey];
    
    
    
//    [dicM setValue :[NSNumber numberWithInt:kAudioFormatMPEGLayer3] forKey:AVFormatIDKey];
//    [dicM setValue:[NSNumber numberWithFloat:22050.0] forKey:AVSampleRateKey];
//    [dicM setValue:[NSNumber numberWithInt: 2] forKey:AVNumberOfChannelsKey];
//    
//    [dicM setValue :[NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];
//    [dicM setValue :[NSNumber numberWithBool:NO] forKey:AVLinearPCMIsBigEndianKey];
//    [dicM setValue :[NSNumber numberWithBool:NO] forKey:AVLinearPCMIsFloatKey];
    
    
    
    //....其他设置等
    return dicM;
}

/**
 *  获得录音机对象
 *
 *  @return 录音机对象
 */
-(AVAudioRecorder *)audioRecorder
{
    if (!_audioRecorder)
    {
        //创建录音文件保存路径
        NSURL *url=[self getSavePath];
        //创建录音格式设置
        NSDictionary *setting = [self getAudioSetting];
        //创建录音机
        NSError *error=nil;
        _audioRecorder=[[AVAudioRecorder alloc]initWithURL:url settings:setting error:&error];
        _audioRecorder.delegate=self;
//        [_audioRecorder recordForDuration:10];
        _audioRecorder.meteringEnabled=YES;//如果要监控声波则必须设置为YES
        if (error)
        {
            NSLog(@"创建录音机对象时发生错误，错误信息：%@",error.localizedDescription);
            return nil;
        }
    }
    
    return _audioRecorder;
}

/**
 *  创建播放器
 *
 *  @return 播放器
 */
-(AVAudioPlayer *)audioPlayer
{
    if (!_audioPlayer)
    {
        NSURL *url = [self getSavePath];
        NSError *error=nil;
        _audioPlayer=[[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
        _audioPlayer.numberOfLoops=0;
        [_audioPlayer prepareToPlay];
        if (error)
        {
            NSLog(@"创建播放器过程中发生错误，错误信息：%@",error.localizedDescription);
            return nil;
        }
    }
    return _audioPlayer;
}


#pragma mark - UI事件
/**
 *  点击录音按钮
 *
 *  @param sender 录音按钮
 */
- (void)recordClick:(UIButton *)sender
{
    if (![self.audioRecorder isRecording])
    {
        [self.audioRecorder record];//首次使用应用时如果调用record方法会询问用户是否允许使用麦克风
    }
}

/**
 *  点击暂定按钮
 *
 *  @param sender 暂停按钮
 */
- (void)pauseClick:(UIButton *)sender
{
    if ([self.audioRecorder isRecording])
    {
        [self.audioRecorder pause];
    }
}

/**
 *  点击恢复按钮
 *  恢复录音只需要再次调用record，AVAudioSession会帮助你记录上次录音位置并追加录音
 *
 *  @param sender 恢复按钮
 */
- (void)resumeClick:(UIButton *)sender
{
    [self recordClick:sender];
}

/**
 *  点击停止按钮
 *
 *  @param sender 停止按钮
 */
- (void)stopClick:(UIButton *)sender
{
    [self.audioRecorder stop];
}

#pragma mark - 录音机代理方法
/**
 *  录音完成，录音完成后播放录音
 *
 *  @param recorder 录音机对象
 *  @param flag     是否成功
 */
-(void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag
{
    if (![self.audioPlayer isPlaying])
    {
        [self.audioPlayer play];
    }
    NSLog(@"录音完成!");
}



@end
