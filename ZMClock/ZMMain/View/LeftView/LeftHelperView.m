//
//  LeftHelperView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/16.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "LeftHelperView.h"

@implementation LeftHelperView

#pragma mark 更改漂浮侧面板展开图片

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        [self.layer setCornerRadius:5.0];
        [self.layer setMasksToBounds:YES];
        //[self setBackgroundColor:RGBAlpha(255.0, 255.0, 255.0, 0.4)];
        //更改漂浮侧面板展开图片
        UIImageView*leftimage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"漂浮侧面板展开"]];
        leftimage.frame=CGRectMake(0, -6.8, 81, 260);
        
        [self addSubview:leftimage];
        
        
        [self addSubview:self.topButton];
        //[self addSubview:self.middleButton];
        [self addSubview:self.bottomButton];
    }
    return self;
}



-(ZMButton*)topButton
{
    if (_topButton == nil)
    {
        _topButton = [[ZMButton alloc]initWithTopImageAndTitleBottom];
        //[_topButton.navTitileLabel setText:@"星座"];
        [_topButton.navImageView setImage:[UIImage imageNamed:@"漂浮星座"]];
        [_topButton setTag:1];
    }
    return _topButton;
}



-(ZMButton*)middleButton
{
    if (_middleButton == nil)
    {
        _middleButton = [[ZMButton alloc]initWithTopImageAndTitleBottom];
        [_middleButton.navImageView setImage:[UIImage imageNamed:@"漂浮社区"]];
        //[_middleButton.navTitileLabel setText:@"社区"];
        [_middleButton setTag:2];
    }
    return _middleButton;
}



-(ZMButton*)bottomButton
{
    if (_bottomButton == nil)
    {
        _bottomButton = [[ZMButton alloc]initWithTopImageAndTitleBottom];
        [_bottomButton.navImageView setImage:[UIImage imageNamed:@"漂浮设置"]];
       // [_bottomButton.navTitileLabel setText:@"设置"];
        [_bottomButton setTag:3];
    }
    return _bottomButton;
}

#pragma mark 修改主页侧边图片
-(void)resetLeftHelperFrame:(CGRect)frame
{
    [self setFrame:frame];
    
//    [self.topButton resetWithTopImageAndTitleBottomFrame:CGRectMake(-4, 8, frame.size.width*1.2, frame.size.height/3*1.2)];
    
    [self.topButton resetWithTopImageAndTitleBottomFrame:CGRectMake(-4, (frame.size.height/3)/2 - 15, frame.size.width*1.2, frame.size.height/3*1.2)];
    
    [self.middleButton resetWithTopImageAndTitleBottomFrame:CGRectMake(-4, frame.size.height/3, frame.size.width*1.2, frame.size.height/3*1.2)];
    
    [self.bottomButton resetWithTopImageAndTitleBottomFrame:CGRectMake(-4, 2*(frame.size.height/3) - ((frame.size.height/3)/2) + 15, frame.size.width*1.2, frame.size.height/3*1.2)];
}


@end
