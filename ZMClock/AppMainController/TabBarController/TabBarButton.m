//
//  TabBarButton.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/1.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "TabBarButton.h"


@interface TabBarButton ()

@property (nonatomic,strong) UIImageView *imageView;   //图片视图
@property (nonatomic,strong) UILabel     *TitleLabel;  //标题标签
@property (nonatomic,strong) UIImage *normalImage;    //正常的图片
@property (nonatomic,strong) UIImage *selectedImage;  //选择后的图片

@end


@implementation TabBarButton
@synthesize imageView;
@synthesize normalImage;
@synthesize selectedImage;
@synthesize TitleLabel;



#pragma mark - 初始化按钮，并设置正常和选中状态的图片
-(instancetype)initWithFrame:(CGRect)frame wittTitle:(NSString*)title withImage:(NSString*)imageName selectedImage:(NSString*)selectedImageName
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        normalImage = [UIImage imageNamed:imageName];
        selectedImage = [UIImage imageNamed:selectedImageName];
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width/2-30/2, 0, 30, 30)];
        [imageView setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:imageView];
        
        
        TitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 32, frame.size.width, 15)];
        [TitleLabel setFont:[UIFont systemFontOfSize:12.0 weight:12.0]];
        [TitleLabel setTextAlignment:NSTextAlignmentCenter];
        [TitleLabel setTextColor:[UIColor whiteColor]];
        [TitleLabel setText:title];
        [self addSubview:TitleLabel];
        
        //调试控件的颜色
//        [imageView setBackgroundColor:[UIColor purpleColor]];
//        [TitleLabel setBackgroundColor:[UIColor purpleColor]];
    }
    return self;
}


-(void)setTabBarButtonActionType:(int)type
{
    switch (type)
    {
        case 1:
        {
            [imageView setImage:normalImage];
            [self setEnabled:YES];
        }
            break;
        case 2:
        {
            [imageView setImage:selectedImage];
            [self setEnabled:NO];
        }
            break;
    }
}

@end
