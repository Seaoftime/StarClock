//
//  StoryComicNewsInfoModel.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/27.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#define width_20 (kScreen_Width-20)


#import "StoryComicNewsInfoModel.h"

@interface StoryComicNewsInfoModel ()

@property (nonatomic) CGFloat rationHightAndWidth; //!< 宽高比率

@end


@implementation StoryComicNewsInfoModel


-(void)setImageWidth:(NSString *)imageWidth
{
    CGFloat width = [imageWidth floatValue];
    if ([imageWidth isEqualToString:@""])
    {
        width = 1.0;
    }
    
    [self setRationHightAndWidth:(width_20/width)];
    [self setImage_Width:(width*self.rationHightAndWidth)];
    
}



-(void)setImageHight:(NSString *)imageHight
{
    CGFloat hight = [imageHight floatValue];
    if ([imageHight isEqualToString:@""])
    {
        hight = 1.0;
    }
    
    [self setImage_Hight:(self.rationHightAndWidth*hight)];
}



@end
