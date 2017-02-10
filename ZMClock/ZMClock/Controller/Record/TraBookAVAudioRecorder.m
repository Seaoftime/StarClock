//
//  TraBookAVAudioRecorder.m
//  Dropper
//
//  Created by ZhongMeng on 16/4/5.
//  Copyright © 2016年 yaolizhi. All rights reserved.
//


#import "TraBookAVAudioRecorder.h"
#import <AVFoundation/AVFoundation.h>
#import "TraBookVoiceConverter.h"

@interface TraBookAVAudioRecorder () <AVAudioRecorderDelegate>

@property (nonatomic,strong) AVAudioRecorder *audioRecorder;//音频录音机
@property (nonatomic,strong) AVAudioPlayer   *audioPlayer;//音频播放器，用于播放录音文件
@property (nonatomic,strong) NSTimer *timer;//录音声波监控（注意这里暂时不对播放进行监控
@property (nonatomic,strong) NSString *recordUrlPath;

@end





@implementation TraBookAVAudioRecorder
@synthesize audioRecorder;
@synthesize audioPlayer;

#pragma mark  LifeStyle Method

static TraBookAVAudioRecorder *sharedTraBook = nil; //第一步：静态实例，并初始化。

/**
 单例形式
 */
+(TraBookAVAudioRecorder*)shareAVAudioRecorder
{
    static dispatch_once_t once;
    
    dispatch_once(&once,^{
        
        sharedTraBook = [[self alloc]init];
        
    });
    
    return sharedTraBook;
}

#pragma mark  Response Method

// 开始录音
-(void)asyncStartRecordingWithPreparePathFileName:(NSString *)fileName withRecordType:(RecordType)recordType completion:(void(^)(NSError *error))completion
{
    //创建录音文件保存路径
    NSURL *recordUrl = [self getSaveUrlPathWithFileName:fileName withRecordType:recordType];
   
    //创建录音格式设置
    NSDictionary *setting = [self getAudioSetting];
    
    //创建错误提示
    NSError *error = nil;
    
    audioRecorder =[[AVAudioRecorder alloc]initWithURL:recordUrl settings:setting error:&error];
    [audioRecorder setDelegate:self];
    [audioRecorder setMeteringEnabled:NO]; //如果要监控声波则必须设置为YES
    
    
    if(!audioRecorder || error)
    {
        [self setAudioRecorder:nil];
        
        if (completion)
        {
            error = [NSError errorWithDomain:[NSString stringWithFormat:@"创建录音机对象时发生错误，错误信息：%@",error.localizedDescription]
                                        code:500
                                    userInfo:nil];
            completion(error);
        }
    }
    else
    {
        [audioRecorder record];
    }
}

// 停止录音
-(void)asyncStopRecordingWithCompletion:(void(^)(NSString *recordPath))completion
{
    [audioRecorder stop];
    [self setAudioRecorder:nil];
    completion(self.recordUrlPath);
}



// 播放录音
-(void)asyncSartPlayWithPreparePathFileName:(NSString *)fileName withRecordType:(RecordType)recordType Completion:(void(^)(NSString *recordPath))completion
{
    NSString *wavPath = [self audioPlayerWithFileName:fileName withRecordType:recordType];
    if (![audioPlayer isPlaying])
    {
        [audioPlayer play];
    }
    completion(wavPath);
}


#pragma mark  Getter/Setter Method
/**
 *  创建播放器
 *
 *  @return 播放器
 */
-(void)audioPlayerWithFileName:(NSString*)fileName
{

    NSString *amrPath = [HomeDirectoryDocumentLastObjectFilePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.amr",fileName]];
    
    NSString *wavPath = [HomeDirectoryDocumentLastObjectFilePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.wav",fileName]];
    
    
    if ([TraBookVoiceConverter amrToWav:amrPath wavSavePath:wavPath])
    {
        NSLog(@"");
    }
    else
    {
         NSURL *url = [NSURL URLWithString:wavPath];
        NSError *error=nil;
        audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
        audioPlayer.numberOfLoops=0;
        [audioPlayer prepareToPlay];
        if (error)
        {
            NSLog(@"创建播放器过程中发生错误，错误信息：%@",error.localizedDescription);
        }
    }
}



-(NSString*)audioPlayerWithFileName:(NSString*)fileName withRecordType:(RecordType)recordType
{
    NSString *wavPath = nil;
    switch (recordType)
    {
        case WeatherRecord:
        {
            wavPath = [HomeDirectoryDocumentFilePath stringByAppendingPathComponent:KWeatherPath];
            wavPath = [wavPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.wav",fileName]];
        }
            break;
        case ColockRecord:
        {
            wavPath = [HomeDirectoryDocumentFilePath stringByAppendingPathComponent:KColockPath];
            wavPath = [wavPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.wav",fileName]];
        }
            break;
    }

    NSURL *url = [NSURL URLWithString:wavPath];
    NSError *error=nil;
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
    audioPlayer.numberOfLoops=0;
    [audioPlayer prepareToPlay];
    if (error)
    {
        NSLog(@"创建播放器过程中发生错误，错误信息：%@",error.localizedDescription);
    }
    
    return wavPath;
}





#pragma mark  Private Method
/**
 *  取得录音文件保存路径
 *
 *  @return 录音文件路径
 */
-(NSURL *)getSaveUrlPathWithFileName:(NSString*)fileName withRecordType:(RecordType)recordType
{
    switch (recordType)
    {
        case WeatherRecord:
        {
            [self setRecordUrlPath:[HomeDirectoryDocumentLastObjectFilePath stringByAppendingPathComponent:KWeatherPath]];
            [self setRecordUrlPath:[self.recordUrlPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.wav",fileName]]];
            
            
        }
            break;
        case ColockRecord:
        {
            [self setRecordUrlPath:[HomeDirectoryDocumentLastObjectFilePath stringByAppendingPathComponent:KColockPath]];
            [self setRecordUrlPath:[self.recordUrlPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.wav",fileName]]];
        }
            break;
    }
    
    NSLog(@"返回录音文件的URL地址:%@",self.recordUrlPath);
    NSURL *url=[NSURL fileURLWithPath:self.recordUrlPath];
    return url;
}

-(NSString *)getSavePathWithFileName:(NSString*)fileName
{
    NSString *urlStr = [HomeDirectoryDocumentLastObjectFilePath stringByAppendingPathComponent:fileName];
    NSLog(@"返回录音文件的地址:%@",urlStr);

    return urlStr;
}

/**
 *  取得录音文件设置
 *
 *  @return 录音设置
 */
-(NSDictionary *)getAudioSetting
{
    NSMutableDictionary *dicM=[NSMutableDictionary dictionary];
    //设置录音格式
    [dicM setObject:@(kAudioFormatLinearPCM) forKey:AVFormatIDKey];
    //设置录音采样率，8000是电话采样率，对于一般录音已经够了
    [dicM setObject:@(8000) forKey:AVSampleRateKey];
    //设置通道,这里采用单声道
    [dicM setObject:@(1) forKey:AVNumberOfChannelsKey];
    //每个采样点位数,分为8、16、24、32
    [dicM setObject:@(16) forKey:AVLinearPCMBitDepthKey];
    //是否使用浮点数采样
    [dicM setObject:@(YES) forKey:AVLinearPCMIsFloatKey];
    //....其他设置等
    return dicM;
}


#pragma mark  Delegate Method
#pragma mark - AVAudioRecorderDelegate 录音机代理方法
/**
 *  录音完成，录音完成后播放录音
 */
-(void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag
{
    NSLog(@"录音完成!");
}

- (void)audioRecorderEncodeErrorDidOccur:(AVAudioRecorder *)recorder
                                   error:(NSError *)error
{
    NSLog(@"audioRecorderEncodeErrorDidOccur");
}


@end
