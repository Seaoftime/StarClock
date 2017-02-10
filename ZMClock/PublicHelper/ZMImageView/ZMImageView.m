//
//  ZMImageView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/1.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMImageView.h"

@implementation ZMImageView
@synthesize image;

-(void)setDrawImageName:(NSString*)imageName
{
    //设置题片
    [self setImage:[UIImage imageNamed:imageName]];
    //刷新视图
    [self setNeedsDisplay];
    
}


-(void)drawRect:(CGRect)rect
{
    [image drawInRect:rect];
}


-(instancetype)initWithAlertViewFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addSubview:self.tiptitleLable];
    }
    return self;
}


-(UILabel *)tiptitleLable
{
    if (_tiptitleLable == nil)
    {
        _tiptitleLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 45)];
        [_tiptitleLable setTextAlignment:NSTextAlignmentCenter];
        [_tiptitleLable setFont:[UIFont fontWithName:@"Helvetica-Bold" size:25.0]];
        [_tiptitleLable setShadowColor:RGB(35.0, 72.0, 83.0)];
        [_tiptitleLable setShadowOffset:CGSizeMake(1, 1)];
        [_tiptitleLable setTextColor:[UIColor whiteColor]];
    }
    return _tiptitleLable;
}

@end
