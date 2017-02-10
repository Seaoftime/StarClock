//
//  NSMutableArray+Repeat.h
//  GaGaMatch
//
//  Created by yaolizhi on 14-11-11.
//  Copyright (c) 2014年 ZhongYeKeJiJiShuBu. All rights reserved.
//
//
//
// 该分类可变数组的分类，用于数组中去重、数组元素排序
//
//
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Repeat)

/**
 该方法是分类中定义的方法,在往数组中添加元素时,如果该元素存在,则不添加到该数组中,否则就添加该元素
 */
-(BOOL)setArrayObject:(id)Object;


/**
 该分类方法是用于数组元素排序
 */
-(BOOL)orderByDesc:(id)Object;


/**
 该分类方法是用于数组元素排序（升序）
 */
-(BOOL)orderByAsc:(id)Object;

@end
