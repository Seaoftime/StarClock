//
//  ZMBaseModel.m
//  ZMClock
//
//  Created by ZhongMeng on 16/6/24.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMBaseModel.h"

@implementation ZMBaseModel


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
    NSLog(@"捕获了一个未定义的[ key = %@ ]",key);
}

- (id)valueForUndefinedKey:(NSString *)key
{
    
    
    return nil;
}



@end
