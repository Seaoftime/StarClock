//
//  baobaomodel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/6/1.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface baobaomodel : NSObject

@property (nonatomic,retain) NSString *baobaonickName;  //!< 昵称
@property (nonatomic,retain) NSString *describe; //!< 每行描述
@property (nonatomic,retain) NSString *dengjistr; //!< 每行描述
@property (nonatomic,retain) NSString *jingbistr; //!< 每行描述

@property (nonatomic,retain) NSString *headPortraitUrl; //!< 头像Url地址

@end
