//
//  ZMGuideViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/1.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMGuideViewController.h"

#define ContentOffPageSize 3

@interface ZMGuideViewController () <ZMScrollViewDetegate>

@property (nonatomic,strong) ZMScrollView *guideScrollView;

@end

@implementation ZMGuideViewController


#pragma mark - DataRequest Method


#pragma mark - LifeStyle Method
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.guideScrollView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - Getter/Setter Method
-(ZMScrollView *)guideScrollView
{
    if (_guideScrollView == nil)
    {
        NSArray *imageArray = @[@"GuideImage1.png",@"GuideImage2.png",@"GuideImage3.png"];
        _guideScrollView = [[ZMScrollView alloc]initWithGuideFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height) withImageArray:imageArray withExperienceTitle:@"点击进入" withDeletage:self];
        [_guideScrollView setContentSize:CGSizeMake(kScreen_Width*ContentOffPageSize, kScreen_Height)];
    }
    return _guideScrollView;
}


#pragma mark - Delegate Method
#pragma mark  UIScrollViewDelegate 代理方法
//scrollView已经停止滚动
-(void)scrollViewDidEndDecelerating:(ZMScrollView *)scrollView
{
    if (scrollView.contentOffset.x  >= kScreen_Width*(ContentOffPageSize-1))
    {
        [UIView animateWithDuration:1.0 animations:^{
            [scrollView.experienceButton setAlpha:1.0];
        }];
        
    }
}

#pragma mark - TaskstudyScrollViewDetegate 代理方法
-(void)zmScrollViewButtonAction:(ZMButton *)sender
{
    //判断是不是第一次启动
    [[NSUserDefaults standardUserDefaults] setValue:AppVersion forKey:@"GUIDE"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - Response Method
#pragma mark - PrivateMethod
@end
