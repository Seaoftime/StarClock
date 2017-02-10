//
//  EditMeInfoModel.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/10.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "EditMeInfoHelper.h"

@implementation EditMeInfoHelper

static EditMeInfoHelper *shareHelper = nil;
+ (EditMeInfoHelper*)shareHelper
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        shareHelper = [[self alloc]init];
        
    });
    
    return shareHelper;
}

@end
