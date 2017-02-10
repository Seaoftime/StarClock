//
//  HonourModel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/9.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//





typedef NS_ENUM(NSInteger,HonourType)
{
    /**
     昵称类型
     */
    honourNickNameType = 1,
    
    /**
     头衔类型
     */
    honourHonourType = 2,
    
    /**
     经验类型
     */
    experienceType = 3,
    
    /**
     操作类型
     */
    actionType = 4,
    
    /**
     其他类型
     */
    otherType = 5,
};



#import <Foundation/Foundation.h>

@interface HonourModel : NSObject


@property (nonatomic,retain) NSString *headPortraitUrl; //!< 头像
@property (nonatomic,retain) NSString *nickName;  //!< 昵称 头部昵称
@property (nonatomic,retain) NSString *points; //!< 积分 头部积分
@property (nonatomic,retain) NSString *level; //!< 等级 头部等级



@property (nonatomic,retain) NSString *editorExperience; //!<编辑经验值
@property (nonatomic,retain) NSString *nextLevelExperience; //!< 离下一个等级还需要的经验值
@property (nonatomic,retain) NSString *editorLevel; //!< 编辑等级 “编辑1级，编辑2级，编辑3级”
@property (nonatomic,retain) NSString *editorLevelNmae; //!< 等级名称 “初级小编、中级小编”



@property (nonatomic,retain) NSString *title; //!< 每行的标题
@property (nonatomic,retain) NSString *describe; //!< 每行的描述
@property (nonatomic,retain) NSString *remark; //!< 备注




@property (nonatomic) HonourType honourType; //!< 类型
@property (nonatomic) CGFloat cellHight; //!< 行高


@end
