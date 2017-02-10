//
//  TabBarView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/3/1.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMView.h"
#import "TabBarButton.h"

@protocol TabBarButtonViewDeletage <NSObject>

/**
 TabBarButton按钮的触发方法
 */
-(void)tabBarButtonAction:(ZMButton*)sender;

/**
 设置默认显示的视图
 */
-(void)tabBarViewAction:(NSInteger)sender;

@end


@interface TabBarView : ZMView


#pragma mark TabBar
@property (nonatomic,strong) TabBarButton *MainTabBarButton;        //课程按钮
@property (nonatomic,strong) TabBarButton *ClockTabBarButton;        //题库按钮
@property (nonatomic,strong) TabBarButton *CommunityTabBarButton;        //资讯按钮
@property (nonatomic,strong) TabBarButton *SettingTabBarButton;        //我按钮

@property (nonatomic) NSInteger TabBarViewActionType;   //被选择

@property (nonatomic) id <TabBarButtonViewDeletage> tabBardeletage;   //代理对象


#pragma mark -  动态隐藏TabBarView
-(void)TabBarViewHidden:(int)Hidden;

-(instancetype)initWithTabBarFrame:(CGRect)frame withDeletage:(id)deletage;



@end
