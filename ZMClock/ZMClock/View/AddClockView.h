//
//  AddClockView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/3/3.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMView.h"

@interface AddClockView : ZMView


/**
 标题标签
 */
@property (nonatomic,strong) ZMLabel *titlabel;

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


-(instancetype)initWithFrame:(CGRect)frame withType:(int)type;


@end
