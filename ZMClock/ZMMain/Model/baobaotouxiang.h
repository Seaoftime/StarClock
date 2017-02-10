//
//  baobaotouxiang.h
//  ZMClock
//
//  Created by ZhongMeng on 16/6/17.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface baobaotouxiang : NSObject

@property (nonatomic,retain) NSString *nickName; //!< 昵称
@property (nonatomic,retain) NSString *sex; //!< 性别
@property (nonatomic,retain) NSString *birthday; //!< 生日
@property (nonatomic,retain) NSData *imageData;

+ (baobaotouxiang*)shareHelper;


@end
