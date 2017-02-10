//
//  IFlyFaceHelper.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/19.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IFlyFaceHelper : NSObject


+(IFlyFaceHelper*)sharedFaceHelper;




#pragma mark - 开始解析图片，识别人脸的位置，然后截取并返回图片
/**
 开始解析图片，识别人脸的位置，然后截取并返回图片
 */
- (UIImage*)startFaceDetectorWithImage:(UIImage*)detectorImage;

- (UIImage*)startFaceDetectorWithImagecuttt:(UIImage*)detectorImage;

//两眼之间距离为 0   男方
- (UIImage *)startFaceDetectorWithImagecutttzerozero:(UIImage *)detectorImage;


//两眼之间距离为 0   女方
- (UIImage *)startFaceDetectorImagecutttzerozeroGirll:(UIImage *)detectorImage;






//位置判断
- (CGRect )startDetectorWithImage:(UIImage *)detectorImage;



@end
