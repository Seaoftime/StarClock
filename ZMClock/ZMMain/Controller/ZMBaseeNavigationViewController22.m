//
//  ZMBaseeNavigationViewController22.m
//  ZMClock
//
//  Created by ZhongMeng on 16/9/14.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMBaseeNavigationViewController22.h"

@interface ZMBaseeNavigationViewController22 ()

@end

@implementation ZMBaseeNavigationViewController22

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    
    self.title = @"";
    [self setNavRightBtnImage:@""];
    [self setNavLeftBtnImage:@"返回-图标navigation"];
    self.baseNavigation.backGroundImageView.image = IMAGE(@"");
    //self.baseNavigation.backgroundColor = NavigationBGColor;
    
    self.baseNavigation.backgroundColor = RGB(127, 127, 127);
    

    
    
    
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
