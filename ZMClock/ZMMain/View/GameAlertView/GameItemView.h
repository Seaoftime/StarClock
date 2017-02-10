//
//  GameItemView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/6.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//  游戏控件ItemView
//
//




#import <UIKit/UIKit.h>
#import "GameItemFunctionView.h"

@interface GameItemView : UIControl


@property (nonatomic,strong) UILabel *rationLabel; //!< 百分比显示控件
@property (nonatomic,strong) GameItemFunctionView *itemFunctionView; //!< 功能实现视图





-(instancetype)initWithFunctionFrame:(CGRect)frame;





@end
