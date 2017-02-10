//
//  ZMBaseNavigationController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/1.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMBaseNavigationController.h"
#import "SQLiteDBManage.h"

@interface ZMBaseNavigationController ()

@end

@implementation ZMBaseNavigationController


-(instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (self)
    {
//        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"创建表"];
        if ([NSUserDefaults objectForKey:@"创建表"])
        {
            [[SQLiteDBManage sharedInstance] createWeatherTable];
            [[SQLiteDBManage sharedInstance] createClockTable];
            [[SQLiteDBManage sharedInstance] createClockRingTable];
        }
        else
        {
            [[SQLiteDBManage sharedInstance] createWeatherTable];
            [[SQLiteDBManage sharedInstance] insertIntoWeatherTable];
            
            [[SQLiteDBManage sharedInstance] createClockTable];
            [[SQLiteDBManage sharedInstance] insertIntoClockTable];
            
            
            [[SQLiteDBManage sharedInstance] createClockRingTable];
            
            [NSUserDefaults setObject:@"已经创建过" forKey:@"创建表"];
        }
        
        [[NSFileManagerHelper sharedInstance] createDirectoryAtPath:KWeatherPath];
        [[NSFileManagerHelper sharedInstance] createDirectoryAtPath:KColockPath];
        
        
        
        /**
         隐藏导航栏
         */
        [self setNavigationBarHidden:YES animated:NO];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
