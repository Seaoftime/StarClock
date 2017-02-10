//
//  SubmitScrollView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/6.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "SubmitScrollView.h"
#define widthAndHight 60

@implementation SubmitScrollView

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        [self setShowsVerticalScrollIndicator:NO];
        [self setShowsHorizontalScrollIndicator:NO];
    }
    return self;
}


-(void)setImageArray:(NSArray*)imageArray
{
    for (int i = 0; i < [imageArray count]; i++)
    {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*widthAndHight+i*5, 0, widthAndHight, widthAndHight)];
        [imageView setContentMode:UIViewContentModeScaleAspectFit];
        [imageView setImage:[imageArray objectAtIndex:i]];
        [self addSubview:imageView];
        [self setContentSize:CGSizeMake(i*widthAndHight+i*5 + widthAndHight, widthAndHight)];
    }
   
}

@end
