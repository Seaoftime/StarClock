//
//  ImagePickerHelper.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/6.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol ImagePickerHelperDeletage <NSObject>

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image;


@end




@interface ImagePickerHelper : NSObject

@property (nonatomic,assign) id <ImagePickerHelperDeletage> imagePickerdeletage; //!< 图片代理

+ (ImagePickerHelper*)sharedImagePickerHelper;


/**
 type:1 为后置摄像头 2 为前置摄像头 3 相册捡取图片 4 相册捡取图片并编辑图片
 */
-(void)initWithImagePickerHelperWithType:(int)type withEdit:(BOOL)edit withViewController:(UIViewController*)viewController setDeletate:(id<ImagePickerHelperDeletage>)deletage;

@end
