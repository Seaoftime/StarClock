//
//  UIView+AttributeValue.m
//  ZMClock
//
//  Created by ZhongMeng on 16/10/27.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "UIView+AttributeValue.h"

@implementation UIView (AttributeValue)

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
    
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}


@end
