//
//  ZMInterationItemInfoModel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/9/7.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMBaseModel.h"


//道具类型
@interface ZMInterationItemInfoModel : ZMBaseModel


@property (nonatomic, copy) NSString *item_type;//道具的类型 1 鲜花 2 礼物 3 约会
@property (nonatomic, copy) NSString *can_handsel_count;//今天这种类型的道具可以赠送的数量(鲜花和礼物可以赠送五次，约会只能3次)


//{
//    "can_handsel_count" = 5;
//    "item_detail" =         (
//                             {
//                                 "item_cfg_add_love_val" = 3;
//                                 "item_cfg_unit_price" = 5;
//                                 "item_count" = 0;
//                                 "item_id" = 111;
//                             },
//                             {
//                                 "item_cfg_add_love_val" = 14;
//                                 "item_cfg_unit_price" = 20;
//                                 "item_count" = 0;
//                                 "item_id" = 121;
//                             },
//                             {
//                                 "item_cfg_add_love_val" = 35;
//                                 "item_cfg_unit_price" = 50;
//                                 "item_count" = 0;
//                                 "item_id" = 122;
//                             },
//                             {
//                                 "item_cfg_add_love_val" = 500;
//                                 "item_cfg_unit_price" = 520;
//                                 "item_count" = 0;
//                                 "item_id" = 131;
//                             }
//                             );
//    "item_type" = 1;
//},
//


+ (NSMutableArray *)parseRespondsInterationItemInfoData:(NSDictionary *)dictionary;



@end












