//
//  ZMCheckinConfiiggModel.m
//  ZMClock
//
//  Created by ZhongMeng on 16/9/30.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMCheckinConfiiggModel.h"

@implementation ZMCheckinConfiiggModel

+ (NSMutableArray *)parseRespondsCheckinConfiiggData:(NSDictionary *)dictionary
{

    NSMutableArray *cfgArray = [NSMutableArray array];
    
    NSArray *dataArray = dictionary[@"data"];

    
    for (NSDictionary *dic in dataArray) {
        
        ZMCheckinConfiiggModel *model = [[ZMCheckinConfiiggModel alloc] init];
        
        model.day = dic[@"day"];
        model.gold = dic[@"gold"];
        model.item_id = dic[@"item_id"];
       
        
        [cfgArray addObject:model];
        
        
    }
    
    return cfgArray;
 
}





@end
