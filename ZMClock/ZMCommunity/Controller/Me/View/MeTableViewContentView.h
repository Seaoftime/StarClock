//
//  MeTableViewContentView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/28.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//  我的个人表视图，单元格内容视图
//
//



#import <UIKit/UIKit.h>
#import "ZMView.h"



@interface MeTableViewContentView : UIView


@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *nickNameLabel; //!< 昵称标签
@property (nonatomic,strong) UILabel *pointsLabel; //!< 积分标签
@property (nonatomic,strong) UILabel *levelLabel;  //!< 等级标签


@property (nonatomic,strong) UILabel *titleLabel; //!< 标题标签
@property (nonatomic,strong) UILabel *describeLabel; //!< 描述标签


@property (nonatomic,strong) UILabel *concernLabel; //!< 关注标签
@property (nonatomic,strong) UILabel *concernNumberLabel; //!< 关注人数标签
@property (nonatomic,strong) UILabel *fansLabel;   //!< 粉丝标签
@property (nonatomic,strong) UILabel *fansNumberLabel;   //!< 粉丝人数标签

@property (nonatomic,strong) ZMView *oneView; //!<第一个星星视图
@property (nonatomic,strong) ZMView *twoView; //!<第一个星星视图
@property (nonatomic,strong) ZMView *threeView; //!<第一个星星视图
@property (nonatomic,strong) ZMView *fourView; //!<第一个星星视图



#pragma mark  初始化昵称类型视图
-(instancetype)initWithNickName;
-(void)resetNickNameFrame:(CGRect)frame;


#pragma mark 初始化粉丝和关注类型视图
-(instancetype)initWithFansAndConcern;
-(void)resetFansAndConcernFrame:(CGRect)frame;



#pragma mark 初始化社区头衔类型视图
-(instancetype)initWithHonour;
-(void)resetHonourFrame:(CGRect)frame;



#pragma mark 初始化消息类型视图
-(instancetype)initWithMessage;
-(void)resetMessageFrame:(CGRect)frame;




#pragma mark 初始化明星类型视图
-(instancetype)initWithStar;
-(void)resetStarFrame:(CGRect)frame;







#pragma mark - 我的头衔视图信息
#pragma mark 头衔视图
/**
 头衔视图
 */
-(instancetype)initWithHonourHonourFrame;

-(void)resetHonourHonourFrame:(CGRect)frame;


#pragma mark 头衔中经验视图
/**
 头衔中经验视图
 */
-(instancetype)initWithHonourExperienceFrame;

-(void)resetHonourExperienceFrame:(CGRect)frame;


#pragma mark 头衔中操作视图
/**
 头衔中操作视图
 */
-(instancetype)initWithHonourActionFrame;

-(void)resetHonourActionFrame:(CGRect)frame;






@end
