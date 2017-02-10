//
//  DropperAVAudioPlayer.h
//  Dropper
//
//  Created by ZhongMeng on 16/2/29.
//  Copyright © 2016年 yaolizhi. All rights reserved.
//
//
//   音频播放案例
//
//
//

typedef NS_ENUM(NSInteger,PlayType)
{
    ClockPlay = 0,
    WeatherPlay = 1,
};




#import <Foundation/Foundation.h>

@interface DropperAVAudioPlayer : NSObject


+(DropperAVAudioPlayer*)sharedAVAudioPlayer;


-(void)startWithArray:(NSMutableArray*)array withType:(PlayType)type;


@end
