//
//  ZRRSpeechSynthesizer.h
//  ZMClock
//
//  Created by ZhongMeng on 16/10/21.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AVFoundation/AVFoundation.h>

////------------------------------------------------
////------------------------------------------------
////封装 iOS 自带的语音合成器
@interface ZRRSpeechSynthesizer : NSObject



//单例模式
+ (ZRRSpeechSynthesizer *)sharedSpeechInstance;

//设置单例的播放语言
- (BOOL)setSpeechLanguage:(NSString *)language;

//开始语音播报
- (void)startSpeechText:(NSString *)text;

//暂停语音播报
- (void)pauseSpeechText;

//停止语音播报
- (void)stopSpeechText;


//语音合成器
@property (nonatomic, strong) AVSpeechSynthesizer *speechSynthesizer;

//是否启用，默认为YES
@property (nonatomic, assign) BOOL enabled;

//语音播报的的语音，默认中文，zh-CN
@property (nonatomic, strong) AVSpeechSynthesisVoice *voice;






@end
