//
//  BaseNavigationView.m
//  TraBook
//
//  Created by Yaolizhi on 16/3/15.
//  Copyright © 2016年 zhs. All rights reserved.
//

#import "BaseNavigationView.h"

@implementation BaseNavigationView

-(instancetype)initWithFrame:(CGRect)frame withType:(int)type
{
    self = [super initWithFrame:frame];
    if (self)
    {
        switch (type)
        {
#pragma amrk case 1 ZMGameBaseViewController
            case 1:
            {
                [self addSubview:self.backGroundImageView];
                //[self.backGroundImageView setImage:[UIImage imageNamed:@"navigation"]];
                self.backGroundImageView.backgroundColor = NavigationBGColor;
                [self addSubview:self.leftButton];
                [self.leftButton setImage:[UIImage imageNamed:@"导航返回"] forState:UIControlStateNormal];
                [self addSubview:self.titleLabel];
                [self addSubview:self.rightButton];
                [self.rightButton setImageEdgeInsets:UIEdgeInsetsMake(5, 20,15, 0)];
                [self.rightButton setImage:[UIImage imageNamed:@"导航完成"] forState:UIControlStateNormal];
                [self.moreButton setHidden:NO];
            }
                break;
#pragma amrk case 2 ZMBaseViewController
            case 2:
            {
                [self addSubview:self.backGroundImageView];
                [self.backGroundImageView setImage:[UIImage imageNamed:@"CommunityNavigation.png"]];
                [self addSubview:self.titleLabel];
                [self addSubview:self.leftButton];
                [self.leftButton setImage:[UIImage imageNamed:@"社区导航返回.png"] forState:UIControlStateNormal];
                [self addSubview:self.rightButton];
                [self.rightButton setFrame:CGRectMake(kScreen_Width-100, 20, 90, 40)];
                [self.rightButton setImage:[UIImage imageNamed:@"社区导航完成"] forState:UIControlStateNormal];
                [self.rightButton setImageEdgeInsets:UIEdgeInsetsMake(5, 60, 5, 0)];
            }
                break;
#pragma amrk case 3 ZMGameMoreDesignBaseViewController
            case 3:
            {
                [self addSubview:self.backGroundImageView];
                //[self.backGroundImageView setImage:[UIImage imageNamed:@"navigation"]];
                [self addSubview:self.leftButton];
                [self.leftButton setImage:[UIImage imageNamed:@"导航返回.png"] forState:UIControlStateNormal];
                [self addSubview:self.titleLabel];
                [self addSubview:self.moreButton];
                [self addSubview:self.rightButton];
                [self.rightButton setImage:[UIImage imageNamed:@"社区导航完成"] forState:UIControlStateNormal];
                
            }
                break;
#pragma amrk case 4 ZMMoreDesignBaseViewController
            case 4:
            {
                [self addSubview:self.backGroundImageView];
                //[self.backGroundImageView setImage:[UIImage imageNamed:@"CommunityNavigation.png"]];
                [self addSubview:self.leftButton];
                [self.leftButton setImage:[UIImage imageNamed:@"社区导航返回.png"] forState:UIControlStateNormal];
                [self addSubview:self.titleLabel];
                [self addSubview:self.moreButton];
                [self addSubview:self.rightButton];
                [self.rightButton setImage:[UIImage imageNamed:@"切换明星"] forState:UIControlStateNormal];
                
            }
                break;
#pragma amrk case 5 ZMGameDesignBaseViewController
            case 5:
            {
                [self addSubview:self.backGroundImageView];
                [self.backGroundImageView setImage:[self GetImageWithColor:MAIN_MAIN_APP_COLOR andHeight:64]];
                [self addSubview:self.leftButton];
                [self.leftButton setImage:[UIImage imageNamed:@"导航返回.png"] forState:UIControlStateNormal];
                [self addSubview:self.navDescribeView];
                [self addSubview:self.rightButton];
                [self.rightButton setImage:[UIImage imageNamed:@"导航完成"] forState:UIControlStateNormal];
                
            }
                break;
#pragma amrk case 6 ZMDesignBaseViewController
            case 6:
            {
                [self addSubview:self.backGroundImageView];
                //[self.backGroundImageView setImage:[UIImage imageNamed:@"CommunityNavigation.png"]];
                [self addSubview:self.leftButton];
                [self.leftButton setImage:[UIImage imageNamed:@"社区导航返回.png"] forState:UIControlStateNormal];
                [self addSubview:self.navDescribeView];
                [self addSubview:self.rightButton];
                [self.rightButton setImage:[UIImage imageNamed:@"社区导航完成"] forState:UIControlStateNormal];
                
                
            }
                break;
        }
//        [self showBackgroundColor:YES];
    }
    return self;
}



#pragma mark ----------------------------根据颜色 得到图片
////
- (UIImage*) GetImageWithColor:(UIColor*)color andHeight:(CGFloat)height
{
    CGRect r= CGRectMake(0.0f, 0.0f, 1.0f, height);
    UIGraphicsBeginImageContext(r.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, r);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}






-(void)showBackgroundColor:(BOOL)backgroundColor
{
    [self setBackgroundColor:RGB(106.0, 221.0, 255.0)];
    [_leftButton setBackgroundColor:[UIColor purpleColor]];
    [_rightButton setBackgroundColor:[UIColor orangeColor]];
    [_titleLabel setBackgroundColor:[UIColor purpleColor]];

}



- (UIImageView *)backGroundImageView
{
    if (_backGroundImageView == nil)
    {
        _backGroundImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 64)];
        [_backGroundImageView setUserInteractionEnabled:YES];
    }
    return _backGroundImageView;
}



#pragma mark Getter / Setter
#pragma mark 初始化左侧按钮
-(NavigationButton *)leftButton
{
    if (_leftButton == nil)
    {
        _leftButton = [[NavigationButton alloc]initWithFrame:CGRectMake(10, 15, 50, 50)];
        [_leftButton.titleLabel setFont:[UIFont systemFontOfSize:14.0]];
        [_leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //[_leftButton setImageEdgeInsets:UIEdgeInsetsMake(8, 5, 5, 70)];
        
        //CGFloat top,
        //CGFloat left,
        //CGFloat bottom,
        //CGFloat right
        
        
    }
    return _leftButton;
}

#pragma mark  初始化标题
-(UILabel *)titleLabel
{
    if (_titleLabel == nil)
    {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(kScreen_Width/2-180/2, 20, 180, 44)];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
        [_titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20.0]];
        [_titleLabel setTextColor:[UIColor whiteColor]];
        [_titleLabel setShadowColor:RGB(35.0, 72.0, 83.0)];
        [_titleLabel setShadowOffset:CGSizeMake(1, 1)];
    }
    return _titleLabel;
}

#pragma mark 初始化右侧按钮
-(NavigationButton *)moreButton
{
    if (_moreButton == nil)
    {
        _moreButton = [[NavigationButton alloc]initWithFrame:CGRectMake(kScreen_Width-110, 20, 50, 50)];
        [_moreButton.titleLabel setFont:[UIFont systemFontOfSize:14.0]];
        [_moreButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_moreButton setImage:[UIImage imageNamed:@"签到.png"] forState:UIControlStateNormal];
    }
    return _moreButton;
}




-(NavigationButton *)rightButton
{
    if (_rightButton == nil)
    {
        //_rightButton = [[NavigationButton alloc]initWithFrame:CGRectMake(kScreen_Width-60, 20, 50, 50)];
        
        
        _rightButton = [[NavigationButton alloc]initWithFrame:CGRectMake(kScreen_Width-60, 20, 50,50)];
        
       // _rightButton.backgroundColor=[UIColor blueColor];
        [_rightButton.titleLabel setFont:[UIFont systemFontOfSize:14.0]];
        [_rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _rightButton;
}







-(NavigationDescribeView*)navDescribeView
{
    if (_navDescribeView == nil)
    {
        _navDescribeView = [[NavigationDescribeView alloc]initWithFrame:CGRectMake(kScreen_Width/2-120/2, 15, 120, 50)];
        
    }
    return _navDescribeView;
}


@end
