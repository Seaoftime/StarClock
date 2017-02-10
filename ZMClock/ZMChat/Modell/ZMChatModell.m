//
//  ZMChatModell.m
//  ZMClock
//
//  Created by ZhongMeng on 16/8/18.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMChatModell.h"




////////张锐
@implementation ZMChatModell


- (instancetype)initWithModel:(NSDictionary *)mess{
    
    if (self=[super init]) {
        self.imageName=mess[@"imageName"];
        self.desc=mess[@"desc"];
        self.time=mess[@"time"];
        self.person=[mess[@"person"] boolValue]; //转为Bool类型
    }
    return self;
}


+ (instancetype)messModel:(NSDictionary *)mess{
    return [[self alloc]initWithModel:mess];
}



@end
