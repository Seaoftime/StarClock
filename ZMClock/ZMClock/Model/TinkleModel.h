//
//  TinkleModel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/17.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//


typedef NS_ENUM(NSInteger,SelectType)
{
    no_select_type = 0, //!< 未选中
    select_type = 1, //!< 选中
};

#import <Foundation/Foundation.h>

@interface TinkleModel : NSObject



@property (nonatomic,retain) NSString *ringName; //!< 铃声
@property (nonatomic,retain) NSString *ringId; //!< 对应的系统铃声id
@property (nonatomic) SelectType selectType; //!< 选择状态




@end
