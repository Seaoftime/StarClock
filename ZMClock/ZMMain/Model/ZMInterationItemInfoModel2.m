//
//  ZMInterationItemInfoModel2.m
//  ZMClock
//
//  Created by ZhongMeng on 16/9/7.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMInterationItemInfoModel2.h"

@implementation ZMInterationItemInfoModel2


+ (NSMutableArray *)parseRespondsInterationItemInfo22Data:(NSDictionary *)dictionary
{
    
    NSMutableArray *interationItemInfoAry22 = [NSMutableArray array];
    
    NSDictionary *resultDic = dictionary[@"data"];
    
    NSArray *dataArray = resultDic[@"item_detail_by_type"];
    
    
    
    for (NSDictionary *dic in dataArray) {
        
        
        NSArray *item_detail = dic[@"item_detail"];
        
        
        for (NSDictionary *item_dic in item_detail) {
            //
            
            ZMInterationItemInfoModel2 *model = [[ZMInterationItemInfoModel2 alloc] init];
            model.item_cfg_add_love_val = item_dic[@"item_cfg_add_love_val"];
            model.item_cfg_unit_price = item_dic[@"item_cfg_unit_price"];
            model.item_count = item_dic[@"item_count"];
            model.item_id = item_dic[@"item_id"];
                
            
            
            [interationItemInfoAry22 addObject:model];
        }
        
        
        
    }
    
    
    return interationItemInfoAry22;

}




@end
