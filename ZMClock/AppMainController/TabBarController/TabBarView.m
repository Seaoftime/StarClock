//
//  TabBarView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/1.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "TabBarView.h"

@implementation TabBarView
@synthesize MainTabBarButton;
@synthesize ClockTabBarButton;
@synthesize CommunityTabBarButton;
@synthesize SettingTabBarButton;
@synthesize tabBardeletage;


-(instancetype)initWithTabBarFrame:(CGRect)frame withDeletage:(id)deletage
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setTabBardeletage:deletage];
        NSInteger numbers = 4;
        MainTabBarButton = [[TabBarButton alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width/numbers, 49) wittTitle:@"主页" withImage:@"KeCheng-N.png" selectedImage:@"KeCheng-S.png"];
        [MainTabBarButton addTarget:self action:@selector(TabBarAction:) forControlEvents:UIControlEventTouchUpInside];
        [MainTabBarButton setTag:0];
        [self addSubview:MainTabBarButton];
        
        ClockTabBarButton = [[TabBarButton alloc]initWithFrame:CGRectMake(kScreen_Width/numbers*1, 0, kScreen_Width/numbers, 49) wittTitle:@"闹钟" withImage:@"TiKu-N.png" selectedImage:@"TiKu-S.png"];
        [ClockTabBarButton addTarget:self action:@selector(TabBarAction:) forControlEvents:UIControlEventTouchUpInside];
        [ClockTabBarButton setTag:1];
        [self addSubview:ClockTabBarButton];
        
        CommunityTabBarButton = [[TabBarButton alloc]initWithFrame:CGRectMake(kScreen_Width/numbers*2, 0, kScreen_Width/numbers, 49) wittTitle:@"社区" withImage:@"ZiXun-N.png" selectedImage:@"ZiXun-S.png"];
        [CommunityTabBarButton addTarget:self action:@selector(TabBarAction:) forControlEvents:UIControlEventTouchUpInside];
        [CommunityTabBarButton setTag:2];
        [self addSubview:CommunityTabBarButton];
        
        SettingTabBarButton = [[TabBarButton alloc]initWithFrame:CGRectMake(kScreen_Width/numbers*3, 0, kScreen_Width/numbers, 49) wittTitle:@"设置" withImage:@"Wo-N.png" selectedImage:@"Wo-S.png"];
        [SettingTabBarButton addTarget:self action:@selector(TabBarAction:) forControlEvents:UIControlEventTouchUpInside];
        [SettingTabBarButton setTag:3];
        [self addSubview:SettingTabBarButton];
    }
    return self;
}




-(void)TabBarAction:(TabBarButton*)sender
{
    [MainTabBarButton setBackgroundColor:MainColor];
    [ClockTabBarButton setBackgroundColor:MainColor];
    [CommunityTabBarButton setBackgroundColor:MainColor];
    [SettingTabBarButton setBackgroundColor:MainColor];
    
    {
        switch (sender.tag)
        {
            case 0:
            {
                [MainTabBarButton setTabBarButtonActionType:2];
                [ClockTabBarButton setTabBarButtonActionType:1];
                [CommunityTabBarButton setTabBarButtonActionType:1];
                [SettingTabBarButton setTabBarButtonActionType:1];
                [MainTabBarButton setBackgroundColor:SelectColor];
                
            }
                break;
            case 1:
            {
                [MainTabBarButton setTabBarButtonActionType:1];
                [ClockTabBarButton setTabBarButtonActionType:2];
                [CommunityTabBarButton setTabBarButtonActionType:1];
                [SettingTabBarButton setTabBarButtonActionType:1];
                [ClockTabBarButton setBackgroundColor:SelectColor];
            }
                break;
            case 2:
            {
                
                [MainTabBarButton setTabBarButtonActionType:1];
                [ClockTabBarButton setTabBarButtonActionType:1];
                [CommunityTabBarButton setTabBarButtonActionType:2];
                [SettingTabBarButton setTabBarButtonActionType:1];
                [CommunityTabBarButton setBackgroundColor:SelectColor];
        
            }
                break;
            case 3:
            {
                
                [MainTabBarButton setTabBarButtonActionType:1];
                [ClockTabBarButton setTabBarButtonActionType:1];
                [CommunityTabBarButton setTabBarButtonActionType:1];
                [SettingTabBarButton setTabBarButtonActionType:2];
                [SettingTabBarButton setBackgroundColor:SelectColor];
            }
                break;
        }
    }
    
    
    
    if ([tabBardeletage respondsToSelector:@selector(tabBarButtonAction:)])
    {
        [tabBardeletage tabBarButtonAction:sender];
    }
}


-(void)setTabBarViewActionType:(NSInteger)type
{
    [MainTabBarButton setBackgroundColor:MainColor];
    [ClockTabBarButton setBackgroundColor:MainColor];
    [CommunityTabBarButton setBackgroundColor:MainColor];
    [SettingTabBarButton setBackgroundColor:MainColor];
    switch (type)
    {
        case 0:
        {
            [MainTabBarButton setTabBarButtonActionType:2];
            [ClockTabBarButton setTabBarButtonActionType:1];
            [CommunityTabBarButton setTabBarButtonActionType:1];
            [SettingTabBarButton setTabBarButtonActionType:1];
            [MainTabBarButton setBackgroundColor:SelectColor];
            
        }
            break;
        case 1:
        {
            [MainTabBarButton setTabBarButtonActionType:1];
            [ClockTabBarButton setTabBarButtonActionType:2];
            [CommunityTabBarButton setTabBarButtonActionType:1];
            [SettingTabBarButton setTabBarButtonActionType:1];
            [ClockTabBarButton setBackgroundColor:SelectColor];
        }
            break;
        case 2:
        {
            
            [MainTabBarButton setTabBarButtonActionType:1];
            [ClockTabBarButton setTabBarButtonActionType:1];
            [CommunityTabBarButton setTabBarButtonActionType:2];
            [SettingTabBarButton setTabBarButtonActionType:1];
            [CommunityTabBarButton setBackgroundColor:SelectColor];
            
        }
            break;
        case 3:
        {
            
            [MainTabBarButton setTabBarButtonActionType:1];
            [ClockTabBarButton setTabBarButtonActionType:1];
            [CommunityTabBarButton setTabBarButtonActionType:1];
            [SettingTabBarButton setTabBarButtonActionType:2];
            [SettingTabBarButton setBackgroundColor:SelectColor];
        }
            break;
    }
    
    if ([tabBardeletage respondsToSelector:@selector(tabBarViewAction:)])
    {
        [tabBardeletage tabBarViewAction:type];
    }
}

#pragma mark -  动态隐藏TabBarView
-(void)TabBarViewHidden:(int)Hidden
{
    switch (Hidden)
    {
        case 0:
        {
            [UIView animateWithDuration:0.3 animations:^{
                [self setFrame:CGRectMake(0.0, kScreen_Height - 49.0, kScreen_Width, 49.0)];
            }];
        }
            break;
        case 1:
        {
            [UIView animateWithDuration:0.3 animations:^{
                [self setFrame:CGRectMake(0.0, kScreen_Height, kScreen_Width, 49.0)];
            }];
        }
            break;
    }
    
}

@end
