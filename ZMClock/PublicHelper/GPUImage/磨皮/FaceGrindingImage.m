//
//  FaceGrindingImage.m
//  ZMClock
//
//  Created by ZhongMeng on 16/7/6.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "FaceGrindingImage.h"

#import "GPUImage.h"

@implementation FaceGrindingImage

+ (UIImage*)imageByBilateralFilterImage:(UIImage*)img distance:(CGFloat)distance{
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:img];
    
    
    GPUImageBilateralFilter *filter = [[GPUImageBilateralFilter alloc] init];
    
    
    [stillImageSource addTarget:filter];
    filter.distanceNormalizationFactor = distance;
    
    
    [filter useNextFrameForImageCapture];
    [stillImageSource processImage];
    
    return [filter imageFromCurrentFramebuffer];
    
}


@end
