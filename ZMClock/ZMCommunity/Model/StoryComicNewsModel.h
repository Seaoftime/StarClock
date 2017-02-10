//
//  StoryComicNewsModel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/28.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//



typedef NS_ENUM(NSInteger,StoryComicNewsModelType)
{
    /**
     正常类型 行高 100
     */
    normalType = 1,
    
    /**
     审核未通过类型 行高 120
     */
    examinationFailType = 2,
};


typedef NS_ENUM(NSInteger,SupportType)
{
    /**
     显示点赞
     */
    showType = 0,
    
    /**
     不显示点赞
     */
    hiddenType = 1,
};



#import <Foundation/Foundation.h>




@interface StoryComicNewsModel : NSObject


@property (nonatomic,retain) NSString *category_type; //!< 分类
@property (nonatomic,retain) NSString *article_id; //!< id信息
@property (nonatomic,retain) NSString *url; //!< 图片Url地址
@property (nonatomic,retain) NSString *title; //!< 标题
@property (nonatomic,retain) NSString *describe; //!< 描述
@property (nonatomic,retain) NSString *author; //!< 作者
@property (nonatomic,retain) NSString *date; //!< 日期
@property (nonatomic,retain) NSString *supportNumber; //!< 点赞数量
@property (nonatomic,retain) NSString *examinationFail; //!< 审核失败的原因
@property (nonatomic,retain) NSString *supportImageName;  //!<点赞、评论、阅读图片名字

@property (nonatomic) CGFloat cellHight; //行高 100 120
@property (nonatomic) StoryComicNewsModelType storyComicNewsModelType; //!< 类型
@property (nonatomic) SupportType supportType; //!< 点赞类类型

@end
