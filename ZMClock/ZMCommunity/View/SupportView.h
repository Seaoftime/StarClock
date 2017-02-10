//
//  SupportView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/27.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//
//  点赞视图，内部包含一个点赞图片视图和点赞数量
//
//

#import <UIKit/UIKit.h>
#import "StoryComicNewsInfoModel.h"

@interface SupportView : UIControl

@property (nonatomic,strong) StoryComicNewsInfoModel *model; //!< 数据模型

@property (nonatomic,strong) UILabel *numberLabel; //!< 点赞数量
@property (nonatomic,strong) UIImageView *supportImageView; //!< 点赞图标

/**
 该视图大小为宽度为45，高度为15
 */
-(instancetype)initWithFrame:(CGRect)frame;

@end
