//
//  WeatherTableViewContentView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/21.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//
//  单元格内容视图视图
//
//

#import <UIKit/UIKit.h>

@interface WeatherTableViewContentView : UIView


/**
 播放按钮
 */
@property (nonatomic,strong) ZMButton *playButton;

/**
 多功能按钮
 */
@property (nonatomic,strong) ZMButton *functionButton;

/**
 标题
 */
@property (nonatomic,strong) UILabel *titleLabel;

@end
