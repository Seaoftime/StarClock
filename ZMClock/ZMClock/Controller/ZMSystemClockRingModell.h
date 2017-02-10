//
//  ZMSystemClockRingModell.h
//  ZMClock
//
//  Created by ZhongMeng on 16/6/29.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "JKDBModel.h"

@interface ZMSystemClockRingModell : JKDBModel

@property(nonatomic, copy) NSString *systemName;
@property(nonatomic, copy) NSString *systemUrl;



//选中状态
@property(nonatomic, assign) BOOL isSelected;


@end
