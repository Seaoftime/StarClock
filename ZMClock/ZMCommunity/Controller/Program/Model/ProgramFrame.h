//
//  ProgramFrame.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/30.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProgramModel.h"

@interface ProgramFrame : NSObject



/**
 数据模型
 */
@property (nonatomic,strong) ProgramModel *model;




@property (nonatomic) CGFloat cellHight;   //!< 行高


//明星图片视图
@property (nonatomic) CGRect startImageFrame; //!< 明星图片视图的Frame
@property (nonatomic) CGRect startImageViewFrame; //!< 明星图片视图的Frame



//行程详情视图
@property (nonatomic) CGRect programinfoTitleLabelFrame;  //!< 行程详情标题标签Frame
@property (nonatomic) CGRect programinfoDescribeLabelFrame;  //!< 行程详情内容的标签Frame
@property (nonatomic) CGRect programinfoDateFrame;     //!< 行程详情日期Frame
@property (nonatomic) CGRect programinfoLocationFrame; //!< 行程位置信息
@property (nonatomic) CGRect programinfoTimeFrame;  //!< 行程详情时间Frame
@property (nonatomic) CGRect programinfoViewFrame; //!< 行程详情视图Frame






//行程评论数视图
@property (nonatomic) CGRect commentNumberViewFrame; //!< 评论数视图Frame
@property (nonatomic) CGRect commentFrame; //!< “评论” Frame
@property (nonatomic) CGRect supportViewFrame; //!< 点赞、评论、视图Frame



//行程评论内容视图
@property (nonatomic) CGRect commentNickNameFrame; //!< 昵称Frame
@property (nonatomic) CGRect commentLevelFrame; //!< 等级Frame
@property (nonatomic) CGRect commentDateFrame; //!< 标题视图Frame
@property (nonatomic) CGRect commentDescribeFrame; //!< 评论视图Frame
@property (nonatomic) CGRect commentheadPortraiteImageFrame;   //!< 头像图片视图Frame

@property (nonatomic) CGRect commentViewFrame; //!< 整个评论视图Frame







@end
