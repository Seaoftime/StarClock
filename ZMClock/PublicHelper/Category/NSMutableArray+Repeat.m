//
//  NSMutableArray+Repeat.m
//  GaGaMatch
//
//  Created by yaolizhi on 14-11-11.
//  Copyright (c) 2014年 ZhongYeKeJiJiShuBu. All rights reserved.
//

#import "NSMutableArray+Repeat.h"

@implementation NSMutableArray (Repeat)


/**
 该方法是分类中定义的方法,在往数组中添加元素时,如果该元素存在,则不添加到该数组中,否则就添加该元素
 */
-(BOOL)setArrayObject:(id)Object
{
    BOOL Ok = NO;
    if ([self containsObject:Object])
    {
        Ok = NO;
    }
    else
    {
        [self addObject:Object];
        Ok = YES;
    }
    return Ok;
}


/**
 该分类方法是用于数组元素排序（倒序）
 */
-(BOOL)orderByDesc:(id)Object
{
    BOOL OK = NO;
    //把“Object”的元素添加到该数组中0 - [Object count]的位置上
    NSRange range = NSMakeRange(0, [Object count]);
    NSIndexSet *IndexSet = [NSIndexSet indexSetWithIndexesInRange:range];
    [self insertObjects:Object atIndexes:IndexSet];
    //判断添加是否成功，本数组的元素个数大于等于传进来的数组元素个数
    if ([self count] >= [Object count])
    {
        OK = YES;
    }
    return OK;
}

/**
 该分类方法是用于数组元素排序（升序）
 */
-(BOOL)orderByAsc:(id)Object
{
    BOOL OK = NO;
    //把“Object”的元素添加到该数组中0 - [Object count]的位置上
    for (int i=0; i<[Object count]; i++)
    {
        [self addObject:Object[i]];
    }
    //判断添加是否成功，本数组的元素个数大于等于传进来的数组元素个数
    if ([self count] >= [Object count])
    {
        OK = YES;
    }
    return OK;
}

@end
