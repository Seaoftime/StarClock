//
//  MemberPM25Model.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/14.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark PM2.5数据模型
/**
 成员数据模型，用于存放PM2.5的天气预报
 */
@interface MemberPM25Model : NSObject

@property (nonatomic,strong) NSString *curPm;
@property (nonatomic,strong) NSString *pm25;
@property (nonatomic,strong) NSString *pm10;  //污染程度
@property (nonatomic,strong) NSString *level;
@property (nonatomic,strong) NSString *quality;  //空气质量
@property (nonatomic,strong) NSString *des;


@end
