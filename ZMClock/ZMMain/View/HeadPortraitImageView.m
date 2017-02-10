//
//  HeadPortraitImageView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/19.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "HeadPortraitImageView.h"

@implementation HeadPortraitImageView


-(instancetype)initWithFrame:(CGRect)frame setDeletage:(id<HeadPortraitImageViewDeletage>)deletage
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setHeadPortraitDeletage:deletage];
        
        
        //不注释掉注释下边的可以改变图片的大小,移动,旋转
        //[self addSubview:self.backGroundImageView];
       // [self addSubview:self.partImageView];
       /*
        人脸识别改变图片大小,移动,旋转这个的话我劝你从新做个遮挡吧!我实现不了俩图片遮挡怎么让后边的图片改变,以及从服务器里请求出来的图片大小满足遮挡的图片
        
        
        
        */
        
       // [self addSubview:self.backGroundImageView];
       // [self addSubview:self.partImageView];
       

         //_backGroundImageView.backgroundColor=[UIColor yellowColor];
        
        
         
        //宝宝头像图片的先后顺序
        [self addSubview:self.partImageView];
        [self addSubview:self.backGroundImageView];
        
        [self.backGroundImageView setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    }
    return self;
}


-(UIImageView*)backGroundImageView
{
    if (_backGroundImageView == nil)
    {
        _backGroundImageView = [[UIImageView alloc]init];
                [_backGroundImageView setUserInteractionEnabled:YES];
        [_backGroundImageView setContentMode:UIViewContentModeScaleAspectFit];
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureRecognizer:)];
        [_backGroundImageView addGestureRecognizer:tapGestureRecognizer];
    }
    return _backGroundImageView;
}


#pragma mark - 人脸识别头像视图
//人脸识别的头像
-(UIImageView*)partImageView
{
    if (_partImageView == nil)
    {
        CGFloat widthAndHight = 120;
         _partImageView = [[UIImageView alloc]initWithFrame:CGRectMake(225/2-widthAndHight/2 - 17, 100, widthAndHight, widthAndHight)];
       // _partImageView = [[UIImageView alloc]initWithFrame:CGRectMake(50,150, kScreen_Width-100, 400)];
        _partImageView.backgroundColor=[UIColor yellowColor];
       // [_partImageView.layer setCornerRadius:300/4];
        [_partImageView.layer setCornerRadius:widthAndHight/4];
        [_partImageView.layer setMasksToBounds:YES];
        [_partImageView setBackgroundColor:[UIColor whiteColor]];
    }
    return _partImageView;
}


-(void)tapGestureRecognizer:(UITapGestureRecognizer*)sender
{
    if ([self.headPortraitDeletage respondsToSelector:@selector(tapGestureRecognizer:)])
    {
        [self.headPortraitDeletage tapGestureRecognizer:sender];
    }
    
}




@end
