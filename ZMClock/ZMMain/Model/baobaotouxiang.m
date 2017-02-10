//
//  baobaotouxiang.m
//  ZMClock
//
//  Created by ZhongMeng on 16/6/17.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "baobaotouxiang.h"

@implementation baobaotouxiang

static baobaotouxiang *shareHelper = nil;
+ (baobaotouxiang*)shareHelper
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        shareHelper = [[self alloc]init];
        
    });
    
    return shareHelper;
}


@end
