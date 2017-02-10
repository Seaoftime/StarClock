//
//  ZMCommunityTabBarController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/3.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMCommunityTabBarController.h"
#import "ZMCommunityViewController.h"
#import "ZMMeViewController.h"
#import "ZMStartViewController.h"

@implementation ZMCommunityTabBarController



-(instancetype)init
{
    self = [super init];
    if (self)
    {
        [self.tabBar setSelectedImageTintColor:MainColor];
        
        
        ZMCommunityViewController *community = [[ZMCommunityViewController alloc]init];
        community.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"社区" image:[UIImage imageNamed:@"社区主页"] tag:1];
        
        
        ZMStartViewController *start = [[ZMStartViewController alloc]init];
        start.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"明星" image:[UIImage imageNamed:@"明星"] tag:1];
        [self.tabBar setSelectedImageTintColor:MainColor];
    
        
        ZMMeViewController *me = [[ZMMeViewController alloc]init];
        me.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我" image:[UIImage imageNamed:@"社区我"] tag:3];
        
        
        [self setViewControllers:@[community,start,me] animated:YES];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}




@end
