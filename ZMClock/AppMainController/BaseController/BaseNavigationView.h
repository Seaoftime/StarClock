//
//  BaseNavigationView.h
//  TraBook
//
//  Created by Yaolizhi on 16/3/15.
//  Copyright © 2016年 zhs. All rights reserved.
//
//
//
//
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "NavigationButton.h"
#import "NavigationDescribeView.h"

@interface BaseNavigationView : UIView




/**
 背景图片视图
 */
@property (nonatomic,strong) UIImageView *backGroundImageView;


/**
 左侧按钮
 */
@property (nonatomic,strong) NavigationButton *leftButton;


/**
 标题标签
 */
@property (nonatomic,strong) UILabel *titleLabel;

/**
 描述标签
 */
@property (nonatomic,strong) UILabel *describeLabel;



/**
 导航上的特殊视图
 */
@property (nonatomic,strong) NavigationDescribeView *navDescribeView;



/**
 右侧按钮
 */
@property (nonatomic,strong) NavigationButton *rightButton;


/**
 右侧按钮
 */
@property (nonatomic,strong) NavigationButton *moreButton;


/**
 1.ZMGameBaseViewController
 2.ZMBaseViewController
 3.ZMGameMoreDesignBaseViewController
 4.ZMMoreDesignBaseViewController
 5.ZMGameDesignBaseViewController
 6.ZMDesignBaseViewController
 */
-(instancetype)initWithFrame:(CGRect)frame withType:(int)type;

@end
