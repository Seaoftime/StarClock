//
//  ZMCheckinConfiiggModel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/9/30.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMBaseModel.h"

@interface ZMCheckinConfiiggModel : ZMBaseModel




@property (nonatomic, copy) NSString *day;//第几天

@property (nonatomic, copy) NSString *gold;//奖励的金币

@property (nonatomic, copy) NSString *item_id;//道具Id



+ (NSMutableArray *)parseRespondsCheckinConfiiggData:(NSDictionary *)dictionary;





@end
