//
//  ZMChatModell.h
//  ZMClock
//
//  Created by ZhongMeng on 16/8/18.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>



////////张锐
@interface ZMChatModell : NSObject



@property (nonatomic, copy)   NSString *imageName;
@property (nonatomic, copy)   NSString *desc;
@property (nonatomic, copy)   NSString *time;
@property (nonatomic, assign) BOOL person;

/** 将plist里的data转为model */
- (instancetype)initWithModel:(NSDictionary *)mess;
//同理
+ (instancetype)messModel:(NSDictionary *)mess;




@end
