//
//  TraBookAVAudioRecorder.h
//  Dropper
//
//  Created by ZhongMeng on 16/4/5.
//  Copyright © 2016年 yaolizhi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,RecordType)
{
    WeatherRecord = 0,
    ColockRecord = 1,
    
};


@interface TraBookAVAudioRecorder : NSObject


/**
 单例形式
 */
+(TraBookAVAudioRecorder*)shareAVAudioRecorder;



#pragma mark 开始录音
/**
 开始录音
 */
-(void)asyncStartRecordingWithPreparePathFileName:(NSString *)fileName withRecordType:(RecordType)recordType completion:(void(^)(NSError *error))completion;


#pragma mark 停止录音
/**
 停止录音
 */
-(void)asyncStopRecordingWithCompletion:(void(^)(NSString *recordPath))completion;


// 播放录音
-(void)asyncSartPlayWithPreparePathFileName:(NSString *)fileName withRecordType:(RecordType)recordType Completion:(void(^)(NSString *recordPath))completion;


@end
