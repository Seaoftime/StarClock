//
//  MoreProgramView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/4.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SupportView.h"
#import "MoreProgramModel.h"


@interface MoreProgramView : UIView

@property (nonatomic,strong) UILabel *dateLabel; //!< 日期标签
@property (nonatomic,strong) UILabel *titleLabel; //!< 标题标签
@property (nonatomic,strong) UILabel *dayLabel; //!< 行程日标签
@property (nonatomic,strong) UILabel *weekLabel; //!< 行程星期标签
@property (nonatomic,strong) UIView *lineView; //!< 分割线

@property (nonatomic,strong) SupportView *localctionView; //!< 位置信息视图
@property (nonatomic,strong) SupportView *timeView; //!< 时间视图



#pragma mark 初始化更多行程列详情表视图Frame
/**
 初始化行程列表视图Frame
 */
-(instancetype)initWithMoreProgramInfoFrame;

-(void)resetWithMoreProgramInfoFrame:(CGRect)frame withdateLabelFrame:(CGRect)dateLabelFrame withtitleLabelFrame:(CGRect)titleLabelFrame withlocalctionViewFrame:(CGRect)localctionViewFrame withtimeViewFrame:(CGRect)timeViewFrame withModel:(MoreProgramModel*)model;



#pragma mark 初始化行程列表视图Frame
/**
 初始化行程列表视图Frame
 */
-(instancetype)initWithProgramListFrame;
-(void)resetWithProgramListFrame:(CGRect)frame withdayLabelFrame:(CGRect)dayLabelFrame withtweekLabelFrame:(CGRect)weekLabelFrame withtitleLabelFrame:(CGRect)titleLabelFrame withlocalctionViewFrame:(CGRect)localctionViewFrame withtimeViewFrame:(CGRect)timeViewFrame withlineViewFrame:(CGRect)lineViewFrame withModel:(MoreProgramModel*)model;

@end
