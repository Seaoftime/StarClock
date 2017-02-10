//
//  GameItemTypeModel.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/7.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "GameItemTypeModel.h"

@implementation GameItemTypeModel


-(NSMutableArray*)itemArray
{
    if (_itemArray == nil)
    {
        _itemArray = [NSMutableArray array];
    }
    return _itemArray;
}



@end
