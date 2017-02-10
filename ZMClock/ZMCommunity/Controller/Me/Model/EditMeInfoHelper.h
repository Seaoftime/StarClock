//
//  EditMeInfoModel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/10.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EditMeInfoHelper : NSObject

@property (nonatomic,retain) NSString *nickName; //!< 昵称
@property (nonatomic,retain) NSString *sex; //!< 性别
@property (nonatomic,retain) NSString *birthday; //!< 生日
@property (nonatomic,retain) NSData *imageData;

@property (nonatomic, copy) NSString *phone;//手机号
@property (nonatomic, copy) NSString *robot_nickname;//机器人昵称
@property (nonatomic, copy) NSString *robot_avatar;//机器人头像





+ (EditMeInfoHelper*)shareHelper;

@end
