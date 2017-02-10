//
//  ZMInterationItemInfoModel.m
//  ZMClock
//
//  Created by ZhongMeng on 16/9/7.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMInterationItemInfoModel.h"

@implementation ZMInterationItemInfoModel


+ (NSMutableArray *)parseRespondsInterationItemInfoData:(NSDictionary *)dictionary
{
    NSMutableArray *interationItemInfoAry = [NSMutableArray array];
    
    NSDictionary *resultDic = dictionary[@"data"];
    
    NSArray *dataArray = resultDic[@"item_detail_by_type"];
    
    
    
    for (NSDictionary *dic in dataArray) {
        
        ZMInterationItemInfoModel *model = [[ZMInterationItemInfoModel alloc] init];
        model.item_type = dic[@"item_type"];
        model.can_handsel_count = dic[@"can_handsel_count"];
        //model.item_detail = dic[@"item_detail"];
        //NSArray *item_detail = dic[@"item_detail"];
        
        
        
        [interationItemInfoAry addObject:model];
        
        
    }
    
    return interationItemInfoAry;
}


@end
