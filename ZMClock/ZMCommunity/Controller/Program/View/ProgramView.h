//
//  ProgramView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/29.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SupportView.h"
#import "ProgramModel.h"
#import "LevelView.h"
#import "MoreProgramModel.h"



@interface ProgramView : UIView

@property (nonatomic,strong) UIImageView *imageView; //!< 图片视图
@property (nonatomic,strong) UILabel *dateLabel; //!< 日期标签
@property (nonatomic,strong) UILabel *titleLabel; //!< 标题标签
@property (nonatomic,strong) UILabel *describeLabel; //!< 内容标签
@property (nonatomic,strong) UILabel *dayLabel; //!< 行程日标签
@property (nonatomic,strong) UILabel *weekLabel; //!< 行程星期标签

@property (nonatomic,strong) SupportView *supportView; //!< 评论、点赞视图
@property (nonatomic,strong) SupportView *localctionView; //!< 位置信息视图
@property (nonatomic,strong) SupportView *timeView; //!< 时间视图
@property (nonatomic,strong) LevelView *levelView; //!< 等级视图



#pragma mark 初始化图片视图Frame
/**
 初始化图片视图Frame
 */
-(instancetype)initWithimageViewFrame;
-(void)resetWithimageViewFrame:(CGRect)frame withimageViewFame:(CGRect)imageViewFrame withModel:(ProgramModel*)model;




#pragma mark 初始化行程详细信息视图Frame
/**
 初始化图片视图Frame
 */
-(instancetype)initWithProgramInfoFrame;
-(void)resetWithProgramInfoFrame:(CGRect)frame withdateLabelFrame:(CGRect)dateLabelFrame withtitleLabelFrame:(CGRect)titleLabelFrame withlocalctionViewFrame:(CGRect)localctionViewFrame withtimeViewFrame:(CGRect)timeViewFrame withModel:(ProgramModel*)model;


#pragma  mark 初始化评论信息视图 “评论"
/**
 初始化评论信息视图
 */
-(instancetype)initWithCommentFrame;
-(void)resetWithCommentFrame:(CGRect)frame withtitleLabelFrame:(CGRect)titleLabelFrame withsupportViewFrame:(CGRect)supportViewFrame withModel:(ProgramModel*)model;


#pragma  mark 初始化评论信息视图
/**
 初始化评论信息视图
 */
-(instancetype)initWithCommentItemsFrame;
-(void)resetWithCommentItemsFrame:(CGRect)frame withimageViewFrame:(CGRect)imageViewFrame withtitleLabelFrame:(CGRect)titleLabelFrame withLevelViewFrame:(CGRect)LevelViewFrame withdateLabelFrame:(CGRect)dateLabelFrame withdescribeLabelFrame:(CGRect)describeLabelFrame withModel:(ProgramModel*)model;






@end
