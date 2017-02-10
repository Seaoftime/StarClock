//
//  ZMBaseViewController.h
//  ZMClock
//
//  Created by ZhongMeng on 16/3/1.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarView.h"
#import "BaseNavigationView.h"
#import "AnyObjectActivityView.h"

@interface ZMBaseViewController : UIViewController

@property (nonatomic,strong) BaseNavigationView *baseNavigation;
@property (nonatomic,strong) TabBarView *TabBarButtonView;
@property (nonatomic,strong) AnyObjectActivityView *activityView; //!< 网络等待指示器

/**
 初始化并设置标题
 */
-(void)setTitle:(NSString*)title;


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
