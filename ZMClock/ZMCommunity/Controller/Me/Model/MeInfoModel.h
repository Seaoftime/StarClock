//
//  MeInfoModel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/28.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//




typedef NS_ENUM(NSInteger,MeInfoType)
{
    headPortraitType = 1,
    normalType = 2,
};

#import <Foundation/Foundation.h>

@interface MeInfoModel : NSObject


@property (nonatomic,retain) NSString *title; //!< 每行的标题
@property (nonatomic,retain) NSString *headPortraitUrl; // !< 头像Url
@property (nonatomic,retain) NSString *describe; //!< 每行描述
@property (nonatomic,retain) NSString *sex; //!< 性别


@property (nonatomic) MeInfoType meInfoType; //!< 每行单元格类型

@property (nonatomic) CGFloat cellHight; //!< 行高 

@end
