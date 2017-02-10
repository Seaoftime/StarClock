//
//  WeatherTableViewContentView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/21.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "WeatherTableViewContentView.h"

@implementation WeatherTableViewContentView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        /**
         添加标题
         */
        self.titleLabel  = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, frame.size.width-140, frame.size.height)];
        [self.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20.0]];
        [self.titleLabel setTextColor:[UIColor whiteColor]];
        [self.titleLabel setShadowColor:RGB(35.0, 72.0, 83.0)];
        [self.titleLabel setShadowOffset:CGSizeMake(1, 1)];
        [self.titleLabel setText:@"河南话"];
        [self addSubview:self.titleLabel];
        
        /**
         添加播放按钮
         */
        self.playButton = [[ZMButton alloc]initWithFrame:CGRectMake(frame.size.width-130, frame.size.height/2-30/2, 30, 30)];
        [self.playButton setImage:[UIImage imageNamed:@"播放DIY.png"] forState:UIControlStateNormal];
        [self addSubview:self.playButton];
        
        
        /**
         添加多功能按钮
         */
        self.functionButton = [[ZMButton alloc]initWithFrame:CGRectMake(kScreen_Width - 95, frame.size.height/2 - 40/2, 80, 40)];
        [self.functionButton setImage:[UIImage imageNamed:@"下载.png"] forState:UIControlStateNormal];
        [self addSubview:self.functionButton];
        
    }
    return self;
}

@end
