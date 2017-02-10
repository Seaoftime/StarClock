//
//  ClockItemView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/3/2.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMView.h"
#import "ZMSwitch.h"

@interface ClockItemView : ZMView

/**
 几点的闹钟标签
 */
@property (nonatomic,strong) ZMLabel *titleLabel;

/**
 描述标签
 */
@property (nonatomic,strong) ZMLabel *describeLabel;


/**
 开关按钮
 */
@property (nonatomic,strong) ZMSwitch *onOrOffSwitch;


/**
 分割线
 */
@property (nonatomic,strong) ZMView *lineView;


-(void)resetWithTitle:(NSString*)title withDescribe:(NSString*)describe withOnorOff:(NSString*)onoff;

@end
