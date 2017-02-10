//
//  StoryComicNewsInfoModel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/27.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//  用于“资讯”、“动漫”、“小说”详情视图里面的数据模型
//
//




typedef NS_ENUM(NSInteger,StoryComicNewsType)
{
    /**
     标题类型
     */
    titleType = 1,
    
    /**
     内容类型
     */
    describeType = 2,
    
    /**
     图片类型
     */
    imageType = 3,
    
    /**
     作者、阅读数、评论数、点赞数类型的
     */
    authorType = 4,
    
    /**
     评论类型
     */
    commentType = 5,
};




#import <Foundation/Foundation.h>

@interface StoryComicNewsInfoModel : NSObject

@property (nonatomic,retain) NSString *article_id; //!< 该文章的详情
@property (nonatomic,retain) NSString *commentId; //!< 评论id
@property (nonatomic,retain) NSString *userId; //!< 用户id
@property (nonatomic,retain) NSString *startId; //!< 明星id
@property (nonatomic,retain) NSString *categoryType;  //!<1 资讯 2小说 3漫画 4行程详情
@property (nonatomic) NSInteger can_like; //!< 是否可赞 1 为还没有赞过，可以点赞 2 为已经赞过，不可以点赞
@property (nonatomic,retain) NSString *editor_level;  //!< 编辑等级
@property (nonatomic,retain) NSString *editor_exp; //!<编辑积分
@property (nonatomic,retain) NSString *score;  //!< 个人积分

@property (nonatomic,retain) NSString *title; //!< 标题
@property (nonatomic,retain) NSString *dateTime; //!< 日期时间
@property (nonatomic,retain) NSString *source; //!< 来源
@property (nonatomic,retain) NSString *describe; //!< 内容描述
@property (nonatomic,retain) NSString *imageUrl; //!< 图片Url地址
@property (nonatomic,retain) NSString *imageHight; //!< 图片高
@property (nonatomic,retain) NSString *imageWidth; //!< 图片宽
@property (nonatomic) CGFloat image_Hight; //!< 图片高
@property (nonatomic) CGFloat image_Width; //!< 图片宽
@property (nonatomic,retain) NSString *author; //!< 作者
@property (nonatomic,retain) NSString *readNumer; //!< 阅读数
@property (nonatomic,retain) NSString *commentNumer; //!< 评论数
@property (nonatomic,retain) NSString *supportNumer; //!< 点赞数
@property (nonatomic,retain) NSString *level; //!< 等级


@property (nonatomic,retain) NSString *headPortraitUrl; //!< 头像Url地址
@property (nonatomic,retain) NSString *nickName; //!< 昵称
@property (nonatomic,retain) NSString *commentDate; //!< 评论时间
@property (nonatomic,retain) NSString *commentSupportNumer; //!< 点赞数
@property (nonatomic,retain) NSString *commentDescribe; //!< 评论描述


@property (nonatomic) StoryComicNewsType type; //!< 消息类型

@end
