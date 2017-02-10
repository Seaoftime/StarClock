//
//  ImagePickerHelper.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/6.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ImagePickerHelper.h"

@interface ImagePickerHelper () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic,strong) UIImagePickerController *imagePickerController; //!< 图片捡取视图控制器

//张锐
@property (nonatomic, strong) UIImageView *faceImgV;//脸部框



@end



@implementation ImagePickerHelper

 static ImagePickerHelper *shareHelper = nil;

+ (ImagePickerHelper*)sharedImagePickerHelper
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        shareHelper = [[self alloc]init];
        
    });
    
    return shareHelper;
}



/**
 type:1 为后置摄像头 2 为前置摄像头 3 相册捡取图片
 edit: YES 选择的图片为可编辑图片   NO 选择的图片不可编辑
 viewController: 传进来的承载模态“UIImagePickerController” 的视图控制器
 */
-(void)initWithImagePickerHelperWithType:(int)type withEdit:(BOOL)edit withViewController:(UIViewController*)viewController setDeletate:(id<ImagePickerHelperDeletage>)deletage
{
    [self setImagePickerdeletage:deletage];
    switch (type)
    {
#pragma mark case 1 后置摄像头
        case 1:
        {
            if ([self isSourceTypeCamera])  //判断是否有相机
            {
                [self.imagePickerController setSourceType:UIImagePickerControllerSourceTypeCamera];
                [self.imagePickerController setVideoMaximumDuration:UIImagePickerControllerQualityTypeHigh]; //图片高质量
            }
            else
            {
                [self.imagePickerController setSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
            }
        }
            break;
#pragma mark case 2 前置摄像头
        case 2:
        {
            if ([self isSourceTypeCamera])
            {
                [self.imagePickerController setSourceType:UIImagePickerControllerSourceTypeCamera];
                [self.imagePickerController setCameraDevice:UIImagePickerControllerCameraDeviceFront];
                [self.imagePickerController setVideoMaximumDuration:UIImagePickerControllerQualityTypeHigh]; //图片高质量
                
                
                
            }
            else
            {
                [self.imagePickerController setSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
            }
        }
            break;
#pragma mark case 3 相册捡取图片
        case 3:
        {
            if ([self isSourceTypePhotosAlbum])
            {
                [self.imagePickerController setSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
            }
        }
    }
    
    
    [self.imagePickerController setAllowsEditing:edit];
    [self.imagePickerController setDelegate:self];
    
    
    
    
    [viewController presentViewController:self.imagePickerController animated:YES completion:^{}];

}



#pragma mark - Deletage Method

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo
{
    if ([self.imagePickerdeletage respondsToSelector:@selector(imagePickerController:didFinishPickingImage:)])
    {
        [self.imagePickerdeletage imagePickerController:picker didFinishPickingImage:image];
    }
    [picker dismissViewControllerAnimated:YES completion:^{}];
}







#pragma mark Getter / Setter
-(UIImagePickerController *)imagePickerController
{
    if (_imagePickerController == nil)
    {
        _imagePickerController = [[UIImagePickerController alloc] init];
    }
    return _imagePickerController;
}




#pragma mark Private Method
#pragma mark  以下三个方法是判断用户手机中是否有摄像头、相册和使用浏览模式显示相册
#pragma mark --- 图片库
-(BOOL)isSourceTypePhotosAlbum
{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
}

#pragma mark --- 列表形式浏览目录
-(BOOL)isSourceTypePhotoLibrary
{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary];
}

#pragma mark --- 相机
-(BOOL)isSourceTypeCamera
{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}








@end
