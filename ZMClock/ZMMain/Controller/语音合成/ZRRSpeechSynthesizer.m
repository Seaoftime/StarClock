//
//  ZRRSpeechSynthesizer.m
//  ZMClock
//
//  Created by ZhongMeng on 16/10/21.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZRRSpeechSynthesizer.h"

@implementation ZRRSpeechSynthesizer

- (instancetype)init
{
    if (self = [super init]) {
        
        _enabled = YES;
        
        _voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];
        
        _speechSynthesizer = [[AVSpeechSynthesizer alloc] init];
        
    }
    return self;
}



+ (ZRRSpeechSynthesizer *)sharedSpeechInstance
{
    __strong static ZRRSpeechSynthesizer *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}


- (BOOL)setSpeechLanguage:(NSString *)language
{
    AVSpeechSynthesisVoice *voice = [AVSpeechSynthesisVoice voiceWithLanguage:language];
    
    if (voice) {
        self.voice = voice;
        return YES;
    }
    
    return NO;

}



- (void)startSpeechText:(NSString *)text
{
    if(_enabled == NO)
        return;
    
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:text];
    
    utterance.voice = _voice;
    utterance.volume = 1.0; // 设置音量 [0-1] Default = 1
    utterance.rate = 0.5;   // 设置语速
    utterance.pitchMultiplier = 1;    // 设置语调，可能是高低音 [0.5 - 2] Default = 1
    
    [_speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];    //播放前清空其他语音
    [_speechSynthesizer speakUtterance:utterance];

}




- (void)pauseSpeechText
{
    
    if ([self.speechSynthesizer isSpeaking]) {
        
        [self.speechSynthesizer pauseSpeakingAtBoundary:AVSpeechBoundaryImmediate];
        
        
    }

}


- (void)stopSpeechText
{
    if ([self.speechSynthesizer isSpeaking]) {
        
        [self.speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    }

}







@end
