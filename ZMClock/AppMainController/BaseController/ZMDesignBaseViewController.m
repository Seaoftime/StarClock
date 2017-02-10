//
//  ZMDesignBaseViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/21.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMDesignBaseViewController.h"

@implementation ZMDesignBaseViewController


-(instancetype)init
{
    self = [super init];
    if (self)
    {
        [self.view addSubview:self.baseNavigation];
        [self.baseNavigation.leftButton addTarget:self action:@selector(navLeftBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.baseNavigation.rightButton addTarget:self action:@selector(navRightBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.baseNavigation];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


/**
 初始化并设置标题
 */
-(void)setTitle:(NSString*)title
{
    [self.baseNavigation.titleLabel setText:title];
}


/**
 设置定位标题
 */
-(void)setLoationTitle:(NSString *)title
{
    [self.baseNavigation.navDescribeView.titleLabel setText:title];
}


#pragma mark - 设置背景颜色
-(void)setBaseRootViewBackGroundColor:(UIColor*)color
{
    [self.view setBackgroundColor:color];
}


#pragma mark - 返回按钮触发的方法
-(void)navLeftBtnAction:(UIButton*)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:^{}];
}

#pragma mark - 右侧按钮触发的方法
-(void)navRightBtnAction:(UIButton*)sender
{
    
}



#pragma mark - 设置左侧按钮图标
-(void)setNavLeftBtnImage:(NSString*)imageName
{
    [self.baseNavigation.leftButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}


#pragma mark - 设置右侧按钮图标
-(void)setNavRightBtnImage:(NSString*)imageName
{
    [self.baseNavigation.rightButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

#pragma mark - 设置左侧按钮标题
-(void)setNavLeftBtnTitle:(NSString*)title setImageHidden:(BOOL)hidden
{
    [self.baseNavigation.leftButton.imageView setHidden:hidden];
    [self.baseNavigation.leftButton setTitle:title forState:UIControlStateNormal];
}

#pragma mark - 设置右侧按钮标题
-(void)setNavRightBtnTitle:(NSString*)title setImageHidden:(BOOL)hidden
{
    [self.baseNavigation.rightButton.imageView setHidden:hidden];
    [self.baseNavigation.rightButton setTitle:title forState:UIControlStateNormal];
}


#pragma mark - 隐藏右侧侧按钮图标
-(void)setNavLeftBtnHidden:(BOOL)hidden
{
    [self.baseNavigation.leftButton setHidden:hidden];
}


#pragma mark - 隐藏右侧侧按钮图标
-(void)setNavRightBtnHidden:(BOOL)hidden
{
    [self.baseNavigation.rightButton setHidden:hidden];
}



#pragma mark - Getter / Setter
-(BaseNavigationView *)baseNavigation
{
    if (_baseNavigation == nil)
    {
        _baseNavigation = [[BaseNavigationView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 64) withType:5];
        
    }
    return _baseNavigation;
}


@end
