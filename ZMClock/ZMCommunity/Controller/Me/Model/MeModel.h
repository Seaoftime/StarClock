//
//  MeModel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/28.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//



typedef NS_ENUM(NSInteger,MeType)
{
    nickNameType = 1, //!< 昵称类型
    fansType = 2,  //粉丝类型
    honourType = 3, //!< 头衔类型
    messageType = 4, //!< 信息类型
    startType = 5, //!< 明星类型
};



#import <Foundation/Foundation.h>

@interface MeModel : NSObject

@property (nonatomic,retain) NSString *userId; //!< 用户id
@property (nonatomic,retain) NSString *headPortraitUrl; //!< 头像
@property (nonatomic,retain) NSString *nickName;  //!< 昵称
@property (nonatomic,retain) NSString *points; //!< 积分
@property (nonatomic,retain) NSString *level; //!< 等级
@property (nonatomic,retain) NSString *concernNumer; //!< 关注
@property (nonatomic,retain) NSString *fansNumber; //!< 粉丝
@property (nonatomic,retain) NSString *title; //!< 每行的标题
@property (nonatomic,retain) NSString *describe; //!< 每行的描述





@property (nonatomic) MeType meType; //!< 类型
@property (nonatomic) CGFloat cellHight; //!< 行高





@end
