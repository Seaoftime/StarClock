//
//  MoreProgramFrame.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/4.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//
//  更多行程Frame
//
//
//

#import <Foundation/Foundation.h>
#import "MoreProgramModel.h"

@interface MoreProgramFrame : NSObject

@property (nonatomic) CGRect dateLabelFrame;  //!< 日期标签Frame
@property (nonatomic) CGRect titleLabelFrame; //!< 标题表情Frame
@property (nonatomic) CGRect dayLabelFrame; //!< 行程日标签Frame
@property (nonatomic) CGRect weekLabelFrame; //!< 星期标签Frame
@property (nonatomic) CGRect localctionViewFrame; //!< 行程位置Frame
@property (nonatomic) CGRect timeViewFrame; //!< 开始的时间Frame
@property (nonatomic) CGRect MoreProgramViewFrame; //!< 整个更多行程承载视图Frame
@property (nonatomic) CGRect lineViewFrame; //!< 整个更多行程承载视图Frame
@property (nonatomic) CGFloat cellHight; //!< 行高

@property (nonatomic,strong) MoreProgramModel *model; //!< 数据模型

@end
