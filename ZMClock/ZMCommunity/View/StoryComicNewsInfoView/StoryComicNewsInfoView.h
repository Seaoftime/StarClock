//
//  StoryComicNewsInfoView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/27.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//
//  该视图为“小说”、“漫画”、“资讯”详情页面中共同使用
//
//

#import <UIKit/UIKit.h>
#import "SupportView.h"
#import "LevelView.h"

@interface StoryComicNewsInfoView : UIView

#pragma mark 标题内容使用
@property (nonatomic,strong) UILabel *titleLael; //!<标题
@property (nonatomic,strong) UILabel *dateLabel; //!<时间标签
@property (nonatomic,strong) UILabel *sourceLabel; //!<来源标签



#pragma mark  内容使用
@property (nonatomic,strong) UILabel *describeLabel; //!< 文章内容




#pragma mark 图片使用
@property (nonatomic,strong) UIImageView *imageView; //!< 内容图片视图





#pragma mark 作者、文章阅读量、评论数、点赞数
@property (nonatomic,strong) UILabel *authorLabel; //!< 作者标签
@property (nonatomic,strong) SupportView *readNumberView; //!< 阅读量
@property (nonatomic,strong) SupportView *commentView; //!<评论视图
@property (nonatomic,strong) SupportView *supportView; //!<点赞视图
@property (nonatomic,strong) LevelView *levelView; //!< 等级视图




#pragma mark 评论视图需要使用的内容
@property (nonatomic,strong) UILabel *nickNameLael; //!< 昵称标签


@property (nonatomic,strong) UIView *topLineView;  //!< 上面的分割线
@property (nonatomic,strong) UIView *bottomLineView; //!< 下面的分割线

/**
 使用上面控件元素
 titleLael; //!<标题 --> 评论用户昵称
 dateLabel; //!<时间标签 --> 评论时间
 describeLabel; //! 文章内容 --> 评论内容
 imageView; //! 内容图片视图 --> 作为头像
 supportView; //!<点赞视图 --> 点赞视图
 */



#pragma mark - 初始化视图方法
#pragma mark  标题初始化视图
-(instancetype)initWithTitle;

#pragma mark  内容初始化视图
-(instancetype)initWithDescribe;


#pragma mark 图片视图初始化视图
-(instancetype)initWithImageView;


#pragma mark  小编、阅读、评论、点赞 初始化视图
-(instancetype)initWithAuthorAndSupportComment;


#pragma mark  评论内容初始化视图
-(instancetype)initWithComment;


@end
