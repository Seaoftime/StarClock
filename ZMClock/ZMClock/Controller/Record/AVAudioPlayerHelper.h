//
//  AVAudioPlayerHelper.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/19.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//
//  主要用于组织播放当前时间和天气预报的代码组织问题
//
//

#import <Foundation/Foundation.h>
#import "WeatherModel.h"
#import "WeatherHelper.h"
#import "MemberWeatherModel.h"

@interface AVAudioPlayerHelper : NSObject

@property (nonatomic,strong) WeatherModel *weatherModel;  //!< 传递进来用于判断当前天气的数据模型

+(AVAudioPlayerHelper*)sharedPlayerHelper;


-(NSMutableArray*)startPlayClockRecord:(BOOL)startPlay;



-(NSMutableArray*)startPlayWeatherRecord:(BOOL)startPlay;




@end
