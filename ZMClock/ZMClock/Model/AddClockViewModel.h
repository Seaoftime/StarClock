//
//  AddClockViewModel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/3/3.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>







@interface AddClockViewModel : NSObject


/**
 每行分割线的类型
 因为设计图设计分割线风格不一样所以需要自定义分割线的长短和位置
 */
@property (nonatomic) MeCellType cellType;


/**
 是否要显示箭头信息
 */
@property (nonatomic) AccessoryType accessoryType;


/**
 标题
 */
@property (nonatomic,retain) NSString *title;

/**
 描述
 */
@property (nonatomic,retain) NSString *describe;

@property (nonatomic,retain) NSString *ringName; //!< 铃声
@property (nonatomic,retain) NSString *mark; //!< 标签
@property (nonatomic,retain) NSString *switchOn; //!< 铃声关闭状态
@property (nonatomic,retain) NSString *repeatType; //!< 闹钟响铃方式
@property (nonatomic,retain) NSString *dateTime; //!< 闹钟定制时间

@property (nonatomic,retain) NSString *primary_id; //!< 这个是数据库中的主键id号



@end
