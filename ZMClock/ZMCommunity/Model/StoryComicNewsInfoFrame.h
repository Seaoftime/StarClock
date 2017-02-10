//
//  StoryComicNewsInfoFrame.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/27.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StoryComicNewsInfoModel.h"

@interface StoryComicNewsInfoFrame : NSObject


/**
 数据模型
 */
@property (nonatomic,strong) StoryComicNewsInfoModel *model;

@property (nonatomic) CGFloat cellHight;   //!< 行高
@property (nonatomic) CGRect titleLabelFrame;  //!< 标题标签Frame
@property (nonatomic) CGRect dateLabelFrame;  //!< 标题栏中的时间标签Frame
@property (nonatomic) CGRect sourceLabelFrame;  //!< 内容来源标签Frame
@property (nonatomic) CGRect describeLabelFrame;  //!< 内容的标签Frame
@property (nonatomic) CGRect imageFrame;     //!< 图片视图的大小

@property (nonatomic) CGRect topLineViewFrame; //!< 上面分割线Frame
@property (nonatomic) CGRect authorLabelFrame; //!< 作者标签Frame
@property (nonatomic) CGRect bottomLineViewFrame; //!< 下面分割线Frame
@property (nonatomic) CGRect readLabelFrame; //!< 文章阅读数标签Frame
@property (nonatomic) CGRect commentLabelFrame; //!< 评论数标签Frame
@property (nonatomic) CGRect supportLabelFrame; //!< 点赞数标签Frame
@property (nonatomic) CGRect headPortraitFrame; //!< 头像图片视图Frame
@property (nonatomic) CGRect nickNameLabelFrame; //!< 昵称Frame
@property (nonatomic) CGRect commentLevelFrame; //!< 等级视图
@property (nonatomic) CGRect commentDateLabelFrame; //!< 评论里面时间标签的Frame
@property (nonatomic) CGRect supportViewFrame; //!< 评论里面的点赞视图Frame
@property (nonatomic) CGRect commentDescribeLabelFrame; //!< 评论里面的内容标签的Frame



@property (nonatomic) CGRect titleViewFrame; //!< 标题视图Frame
@property (nonatomic) CGRect describeViewFrame; //!< 文章内容视图Frame
@property (nonatomic) CGRect imageViewFrame;   //!< 图片视图Frame
@property (nonatomic) CGRect authorViewFrame;   //!< 作者、阅读数、评论数、点赞数视图的Frame
@property (nonatomic) CGRect commentViewFrame; //!< 评论视图Frame






@end
