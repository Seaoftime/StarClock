//
//  ZMDesignBaseViewController.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/21.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//  游戏风格
//  该模板主要用于天气预报里面的导航视图控制器，有定位图标、日期
//  中间标题位置有控件元素
//
//
//

#import <UIKit/UIKit.h>
#import "BaseNavigationView.h"


@interface ZMGameDesignBaseViewController : UIViewController

@property (nonatomic,strong) BaseNavigationView *baseNavigation;

/**
 初始化并设置标题
 */
-(void)setTitle:(NSString*)title;


/**
 设置定位标题
 */
-(void)setLoationTitle:(NSString *)title;


/**
 设置背景颜色
 */
-(void)setBaseRootViewBackGroundColor:(UIColor*)color;
/**
 导航栏右侧按钮方法
 */
-(void)navRightBtnAction:(UIButton*)sender;
/**
 导航栏左右按钮方法
 */
-(void)navLeftBtnAction:(UIButton*)sender;
/**
 设置左侧按钮图标
 */
-(void)setNavLeftBtnImage:(NSString*)imageName;
/**
 设置右侧按钮图标
 */
-(void)setNavRightBtnImage:(NSString*)imageName;
/**
 设置左侧按钮标题
 */
-(void)setNavLeftBtnTitle:(NSString*)title setImageHidden:(BOOL)hidden;
/**
 设置右侧按钮标题
 */
-(void)setNavRightBtnTitle:(NSString*)title setImageHidden:(BOOL)hidden;
/**
 隐藏右侧侧按钮图标
 */
-(void)setNavLeftBtnHidden:(BOOL)hidden;
/**
 隐藏右侧侧按钮图标
 */
-(void)setNavRightBtnHidden:(BOOL)hidden;

@end
