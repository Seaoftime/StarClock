//
//  ZMScrollView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/1.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMScrollView.h"

@implementation ZMScrollView
@synthesize experienceButton;


#pragma mark - 初始化引导页视图控制器
-(instancetype)initWithGuideFrame:(CGRect)frame withImageArray:(NSArray*)imageArray withExperienceTitle:(NSString*)title withDeletage:(id)deletage
{
    self = [super initWithFrame:frame];
    if (self && [imageArray count])
    {
        [self setBounces:NO];                       /*控制控件遇到边框是否反弹*/
        [self setPagingEnabled:YES];
        [self setScrollsToTop:NO];                  /*控制控件滚动到顶部*/
        [self setShowsHorizontalScrollIndicator:NO];/*控制是否显示水平方向的滚动条*/
        [self setShowsVerticalScrollIndicator:NO];  /*控制是否显示垂直方向的滚动条*/
        [self setDelegate:deletage];
        [self setScrollViewDeletage:deletage];
        
        for (int i = 0; i < [imageArray count]; i++)
        {
            NSString *guideImageName  = imageArray[i];
            
            ZMImageView *GuideDrawImageView =  [[ZMImageView alloc]initWithFrame:CGRectMake(kScreen_Width*i, 0, kScreen_Width, kScreen_Height)];
            [GuideDrawImageView setDrawImageName:guideImageName];
            [GuideDrawImageView setBackgroundColor:[UIColor purpleColor]];
            [self addSubview:GuideDrawImageView];
        }
        
        experienceButton = [[ZMButton alloc]initWithFrame:CGRectMake(kScreen_Width*2+(kScreen_Width/2-120.0/2), kScreen_Height-90.0, 120.0,30.0)];
        [experienceButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [experienceButton setBackgroundColor:RGBAlpha(143.0,224.0,254.0,1.0)];
        [experienceButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [experienceButton setTitle:title forState:UIControlStateNormal];
        [experienceButton setAlpha:0.0];
        [self addSubview:experienceButton];
    }
    return self;
}

-(void)buttonAction:(ZMButton*)sender
{
    if ([self.scrollViewDeletage respondsToSelector:@selector(zmScrollViewButtonAction:)])
    {
        [self.scrollViewDeletage zmScrollViewButtonAction:sender];
    }
}



@end
