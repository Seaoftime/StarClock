//
//  CommunityModel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/3.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//
//
//  社区主页里面数据模型
//
//


typedef NS_ENUM(NSInteger,CommunityType)
{
    /**
     明星图片视图类型
     */
    startImageType = 1,
    
    /**
     行程详情类型
     */
    infoType = 2,
    
    /**
     社区主页消息内容类型
     */
    commentitemsType = 4,
};






#import <Foundation/Foundation.h>

@interface CommunityModel : NSObject

@property (nonatomic,retain) NSString *startName; //!< 明星的名字
@property (nonatomic,retain) NSString *startImageUrl; //!< 行程详情图片Url
@property (nonatomic,retain) NSString *programinfoTitle; //!< 行程详情标题
@property (nonatomic,retain) NSString *programinfoDate; //!< 行程详情日期
@property (nonatomic,retain) NSString *locationInfo; //!<行程位置信息
@property (nonatomic,retain) NSString *time; //!< 行程开始时间
@property (nonatomic,retain) NSString *schedule_id;  //! < 行程信息id


@property (nonatomic,retain) NSString *commentUrl; //!< 图片Url地址
@property (nonatomic,retain) NSString *title; //!< 标题
@property (nonatomic,retain) NSString *describe; //!< 描述
@property (nonatomic,retain) NSString *author; //!< 作者
@property (nonatomic,retain) NSString *date; //!< 日期
@property (nonatomic,retain) NSString *supportNumber; //!< 点赞数量
@property (nonatomic,retain) NSString *examinationFail; //!< 审核失败的原因
@property (nonatomic,retain) NSString *supportImageName;  //!<点赞、评论、阅读图片名字
@property (nonatomic,retain) NSString *category_type; 

@property (nonatomic) CGFloat cellHight; //行高
@property (nonatomic) CommunityType communityType; //!< 社区主页数据内容的类型


@end
