//
//  ProgramModel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/30.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

typedef NS_ENUM(NSInteger,programInfoType)
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
     “评论”数类型
     */
    commentNumberType = 3,
    
    /**
     评论内容类型
     */
    commentitemsType = 4,
};




#import <Foundation/Foundation.h>

@interface ProgramModel : NSObject


@property (nonatomic,retain) NSString *userid;  //!<这条评论的用户id
@property (nonatomic,retain) NSString *commentId; //!< 这个评论的id
@property (nonatomic,retain) NSString *startImageUrl; //!<行程详情图片Url
@property (nonatomic,retain) NSString *programinfoTitle; //!< 行程详情标题
@property (nonatomic,retain) NSString *programinfoDate; //!< 行程详情日期
@property (nonatomic,retain) NSString *locationInfo; //!<行程位置信息
@property (nonatomic,retain) NSString *time; //!< 行程开始时间
@property (nonatomic,retain) NSString *level; //! 等级
@property (nonatomic,retain) NSString *starId; //!< 明星id
@property (nonatomic) NSInteger can_like; //!< 是否可点击



@property (nonatomic,retain) NSString *comment; //!< “评论” 二字
@property (nonatomic,retain) NSString *redNumber; //!< 阅读数
@property (nonatomic,retain) NSString *commentNumber; //!< 评论数
@property (nonatomic,retain) NSString *likeNumber; //!<点赞数
@property (nonatomic,strong) NSString *headPortraiteUrl; //!< 头像url
@property (nonatomic,retain) NSString *commentNickName;  //!< 评论标题
@property (nonatomic,retain) NSString *commentDate;   //评论时间
@property (nonatomic,retain) NSString *commentDescribe;   //评论内容描述信息


@property (nonatomic) programInfoType programType; //!< 行程类型



@end
