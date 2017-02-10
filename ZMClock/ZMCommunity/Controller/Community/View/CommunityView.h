//
//  CommunityView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/3.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//
//
//
//
//
//
//

#import <UIKit/UIKit.h>
#import "SupportView.h"
#import "LevelView.h"
#import "CommunityModel.h"

@protocol CommunityViewDeletage <NSObject>


-(void)moreProgramButtonAction:(ZMButton*)sender;

@end


@interface CommunityView : UIView




/**
 头像图片视图
 */
@property (nonatomic,strong) UIImageView *commentImageView;


/**
 作者标签
 */
@property (nonatomic,strong) UILabel *authorLabel;


/**
 评论图片视图
 */
@property (nonatomic,strong) SupportView *commentView;



@property (nonatomic,strong) UIView *lineView; //!< 分割线

@property (nonatomic,strong) UIImageView *imageView; //!< 图片视图
@property (nonatomic,strong) UILabel *dateLabel; //!< 日期标签
@property (nonatomic,strong) UILabel *titleLabel; //!< 标题标签
@property (nonatomic,strong) UILabel *describeLabel; //!< 内容标签
@property (nonatomic,strong) SupportView *supportView; //!< 评论、点赞视图
@property (nonatomic,strong) SupportView *localctionView; //!< 位置信息视图
@property (nonatomic,strong) SupportView *timeView; //!< 时间视图
@property (nonatomic,strong) SupportView *nextProgramView; //!< 下个行程视图
@property (nonatomic,strong) ZMButton *moreProgramButton; //!< 下个行程视图

@property (nonatomic,assign) id <CommunityViewDeletage> communityDeletage;







#pragma mark 初始化图片视图Frame
/**
 初始化图片视图Frame
 */
-(instancetype)initWithStartImageViewFrame;
-(void)resetStartImageViewFrame:(CGRect)frame withimageViewFame:(CGRect)imageViewFrame withModel:(CommunityModel*)model;




#pragma mark 初始化行程详细信息视图Frame
/**
 初始化图片视图Frame
 */
-(instancetype)initWithCommunityInfoFrame;
-(void)resetWithCommunityInfoFrame:(CGRect)frame withnextProgramView:(CGRect)nextProgramViewFrame withmoreProgramButtonFrame:(CGRect)moreProgramButtonFrame withdateLabelFrame:(CGRect)dateLabelFrame withtitleLabelFrame:(CGRect)titleLabelFrame withlocalctionViewFrame:(CGRect)localctionViewFrame withtimeViewFrame:(CGRect)timeViewFrame withModel:(CommunityModel*)model;



#pragma mark 初始化资讯信息视图Frame
/**
 初始化资讯信息视图
 */
-(instancetype)initWithCommunityFrame;
/**
 重置正常类型Frame
 */
-(void)resetWithCommunityFrame:(CGRect)frame withModel:(CommunityModel*)model;



@end
