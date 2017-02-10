//
//  ZMInterationItemInfoModel2.h
//  ZMClock
//
//  Created by ZhongMeng on 16/9/7.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMBaseModel.h"

@interface ZMInterationItemInfoModel2 : ZMBaseModel


@property (nonatomic, copy) NSString *item_cfg_add_love_val;//赠送这种道具增加的亲密度数值
@property (nonatomic, copy) NSString *item_cfg_unit_price;//这种道具的单价
@property (nonatomic, copy) NSString *item_count;//道具数量
@property (nonatomic, copy) NSString *item_id;//道具Id



+ (NSMutableArray *)parseRespondsInterationItemInfo22Data:(NSDictionary *)dictionary;


@end
