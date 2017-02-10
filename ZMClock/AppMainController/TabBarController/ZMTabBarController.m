//
//  ZMTabBarController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/1.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMTabBarController.h"
#import "ZMBaseNavigationController.h"

@interface ZMTabBarController ()

@end

@implementation ZMTabBarController
@synthesize MainViewController;
@synthesize ClockViewController;
@synthesize CommunityViewController;
@synthesize SettingViewController;
@synthesize TabBarButtonView;


-(instancetype)init
{
    self = [super init];
    if (self)
    {
        [self.view setBackgroundColor:[UIColor whiteColor]];
        //添加自定义的TabbarView视图
        TabBarButtonView = [[TabBarView alloc]initWithTabBarFrame:CGRectMake(0.0, kScreen_Height - 49.0, kScreen_Width, 49.0) withDeletage:self];
        [self.view addSubview:TabBarButtonView];
        
        //添加"课程"
        MainViewController = [[ZMMainViewController alloc] init];
        [MainViewController setTabBarButtonView:TabBarButtonView];
        ZMBaseNavigationController *MainView = [[ZMBaseNavigationController alloc]initWithRootViewController:MainViewController];

        
        
        
        ClockViewController = [[ZMClockViewController alloc] init];
        [ClockViewController setTabBarButtonView:TabBarButtonView];
        
         ZMBaseNavigationController *ClockView = [[ZMBaseNavigationController alloc]initWithRootViewController:ClockViewController];
        
        
        CommunityViewController = [[ZMCommunityViewController alloc] init];
         ZMBaseNavigationController *Community = [[ZMBaseNavigationController alloc]initWithRootViewController:CommunityViewController];
        
        
        SettingViewController = [[ZMSettingViewController alloc] init];
         ZMBaseNavigationController *SettingView = [[ZMBaseNavigationController alloc]initWithRootViewController:SettingViewController];
        
        
        self.viewControllers = [NSArray arrayWithObjects:MainView, ClockView, Community,
                                SettingView, nil];
        
        
        
        
        [TabBarButtonView setTabBarViewActionType:0];
        [self.tabBar setHidden:YES];
        
        /**
         这句话很重要，作用是当推送到下个视图后主动隐藏TabBar控件
         [self setHidesBottomBarWhenPushed:YES];
         */
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - TabBarButtonViewDeletage
-(void)tabBarButtonAction:(ZMButton*)sender
{
    [self setSelectedIndex:sender.tag];
}


-(void)tabBarViewAction:(NSInteger)sender
{
    [self setSelectedIndex:sender];
}


-(void)TabBarViewHidden:(BOOL)Hidden
{
    [UIView animateWithDuration:0.3 animations:^{
        
        [TabBarButtonView setHidden:Hidden];
        
        
    }];
}
@end
