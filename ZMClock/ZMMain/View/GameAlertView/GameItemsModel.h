//
//  GameItemsModel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/7.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//  每个item的数据模型，如食物、鲜花
//
//
//

#import <Foundation/Foundation.h>

@interface GameItemsModel : NSObject

@property (nonatomic,retain) NSString *count; //!< 个数
@property (nonatomic,retain) NSString *item_id; //!< id
@property (nonatomic,retain) NSString *item_type; //!< 所属类型


@property (nonatomic,retain) NSString *jingbicount; //!< 金币个数







@end
