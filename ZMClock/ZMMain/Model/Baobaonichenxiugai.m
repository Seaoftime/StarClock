//
//  Baobaonichenxiugai.m
//  ZMClock
//
//  Created by ZhongMeng on 16/6/1.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "Baobaonichenxiugai.h"

@implementation Baobaonichenxiugai

static Baobaonichenxiugai *shareHelper1 = nil;
+ (Baobaonichenxiugai*)shareHelper1
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        shareHelper1 = [[self alloc]init];
        
    });
    
    return shareHelper1;
}


@end
