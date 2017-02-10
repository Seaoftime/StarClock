//
//  IFlyFaceHelper.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/19.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "IFlyFaceHelper.h"
#import "iflyMSC/IFlyFaceSDK.h"
#import "AnyObjectActivityView.h"


//张锐


@interface IFlyFaceHelper ()

@property (nonatomic,strong) IFlyFaceDetector *faceDetector; //!< 本地人脸检测类，可以人脸检测、视频流检测功能。


//@property (nonatomic,strong) IFlyFaceRequest *faceRequest;





@end




@implementation IFlyFaceHelper

#define USER_APPID           @"573bd426"

static IFlyFaceHelper *sharedObject = nil; //第一步：静态实例，并初始化。

+(IFlyFaceHelper*)sharedFaceHelper
{
    static dispatch_once_t once;
    dispatch_once(&once,^{
        
        sharedObject = [[self alloc]init];
        
        
        //设置log等级，此处log为默认在app沙盒目录下的msc.log文件
        [IFlySetting setLogFile:LVL_ALL];
        
        //输出在console的log开关
        [IFlySetting showLogcat:YES];
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *cachePath = [paths objectAtIndex:0];
        //设置msc.log的保存路径
        [IFlySetting setLogFilePath:cachePath];
        
        NSLog(@"%@",cachePath);
        
        
        //创建语音配置,appid必须要传入，仅执行一次则可
        NSString *initString = [[NSString alloc] initWithFormat:@"appid=%@,",USER_APPID];
        
        //所有服务启动前，需要确保执行createUtility
        [IFlySpeechUtility createUtility:initString];
        
        
        
    });
    return sharedObject;
}




#pragma mark - Getter / Setter
-(IFlyFaceDetector*)faceDetector
{
    if (_faceDetector == nil)
    {
        _faceDetector = [IFlyFaceDetector sharedInstance];
        
        [_faceDetector setParameter:@"1" forKey:@"align"];
        //[_faceDetector setParameter:[IFlyFaceConstant ALIGN] forKey:@"1"];
    }
    
    return _faceDetector;
    
}




#pragma mark - 开始解析图片，识别人脸的位置，然后截取并返回图片
/**
 开始解析图片，识别人脸的位置，然后截取并返回图片
 */
- (UIImage *)startFaceDetectorWithImage:(UIImage *)detectorImage
{
    //AnyObjectActivityView *activityView = [[AnyObjectActivityView alloc]initWithTitle:@"正在人脸识别...请稍等" withActivityMode:ActivityModeIndicatorAndText wittImageName:nil withAddedSuperView:kWindow withMargin:ActivityMargin10];
    
    
    detectorImage = [detectorImage fixOrientation];
    
    
    // 检测
    
    NSString *strResult = [self.faceDetector detectARGB:detectorImage];
    
    
    
    
    
    //NSLog(@"讯飞 face+++++++++++++++   %@    +++++++++++++++f",strResult);
    
       
    NSError *error = nil; //!< 先设置错误为nil,如果错误为真了，说明识别出错，否则正确
    NSData *resultData = [strResult dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *faceDetectorDictionary = [NSJSONSerialization JSONObjectWithData:resultData options:NSJSONReadingMutableContainers error:&error];
    
    
    //NSLog(@"%@",faceDetectorDictionary);
    
    
    if(faceDetectorDictionary)
    {
        if ([[faceDetectorDictionary objectForKey:@"ret"] integerValue] == 0)
        {
            NSArray *faceArray=[faceDetectorDictionary objectForKey:@"face"];
            if ([faceArray count])
            {
                
                NSDictionary *itemDictionary = [faceArray firstObject];
                NSDictionary *positionDictionary = [itemDictionary objectForKey:@"position"];
                
                CGFloat bottom = [[positionDictionary objectForKey:@"bottom"] floatValue];
                CGFloat left = [[positionDictionary objectForKey:@"left"] floatValue];
                CGFloat right = [[positionDictionary objectForKey:@"right"] floatValue];
                CGFloat top = [[positionDictionary objectForKey:@"top"] floatValue];
                
                
                
                float x = left;
                float y = top;
                float width = right- left;
                float height = bottom - top;

                
                
                
                //[activityView initResetWithTitle:@"识别成功" withActivityMode:ActivityModeText wittImageName:nil withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                
                //return [detectorImage imageAtRect:CGRectMake(x , y , width, height)];
                
                //return [detectorImage imageAtRect:CGRectMake(0, 0, 300, 400)];
                
                
                UIImage *faceImg = [detectorImage imageAtRect:CGRectMake(x - 60 , y - 60, width + 120, height + 120)];
                
                
                
                
                return faceImg;
                

                
                
                
            }
            else
            {
                //[activityView initResetWithTitle:@"识别失败" withActivityMode:ActivityModeText wittImageName:nil withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                
                return nil;
            }
            
        }
        else
        {
            //[activityView initResetWithTitle:@"识别失败" withActivityMode:ActivityModeText wittImageName:nil withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
            
            return nil;
        }
        
    }
    else
    {
        //[activityView initResetWithTitle:@"识别失败" withActivityMode:ActivityModeText wittImageName:nil withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
        
        return nil;
    }
    
    
    return nil;
}







/**
 开始解析图片，识别人脸的位置，然后截取并返回图片
 */
- (UIImage *)startFaceDetectorWithImagecuttt:(UIImage *)detectorImage
{
    //AnyObjectActivityView *activityView = [[AnyObjectActivityView alloc]initWithTitle:@"正在人脸识别...请稍等" withActivityMode:ActivityModeIndicatorAndText wittImageName:nil withAddedSuperView:kWindow withMargin:ActivityMargin10];
    
    
    detectorImage = [detectorImage fixOrientation];
    
    
    // 检测
    
    NSString *strResult = [self.faceDetector detectARGB:detectorImage];
    
    
    
    
    
    //NSLog(@"讯飞 face+++++++++++++++   %@    +++++++++++++++f",strResult);
    
    
    NSError *error = nil; //!< 先设置错误为nil,如果错误为真了，说明识别出错，否则正确
    NSData *resultData = [strResult dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *faceDetectorDictionary = [NSJSONSerialization JSONObjectWithData:resultData options:NSJSONReadingMutableContainers error:&error];
    
    
    //NSLog(@"%@",faceDetectorDictionary);
    
    
    if(faceDetectorDictionary)
    {
        if ([[faceDetectorDictionary objectForKey:@"ret"] integerValue] == 0)
        {
            NSArray *faceArray=[faceDetectorDictionary objectForKey:@"face"];
            if ([faceArray count])
            {
                
                NSDictionary *itemDictionary = [faceArray firstObject];
                NSDictionary *positionDictionary = [itemDictionary objectForKey:@"position"];
                
                CGFloat bottom = [[positionDictionary objectForKey:@"bottom"] floatValue];
                CGFloat left = [[positionDictionary objectForKey:@"left"] floatValue];
                CGFloat right = [[positionDictionary objectForKey:@"right"] floatValue];
                CGFloat top = [[positionDictionary objectForKey:@"top"] floatValue];
                
                
                
                float x = left;
                float y = top;
                float width = right- left;
                float height = bottom - top;
                
                
                
                
                //[activityView initResetWithTitle:@"识别成功" withActivityMode:ActivityModeText wittImageName:nil withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                
                
                
                if ([ZMSystemTool iPhone5Device]) {
                    
                    
                    UIImage *faceImg = [detectorImage imageAtRect:CGRectMake(x  , y - 10, width , height + 10)];
                    
                    return faceImg;

                    
                } else if ([ZMSystemTool iPhone6Device]) {
                    
                    
                    UIImage *faceImg = [detectorImage imageAtRect:CGRectMake(x   , y - 20, width , height + 30)];
                    
                    return faceImg;

                    
                    
                } else {
                
                    
                    UIImage *faceImg = [detectorImage imageAtRect:CGRectMake(x  , y - 10, width , height + 10)];
                    
                    return faceImg;

                
                }
                
                
                
                
                
                
            }
            else
            {
                //[activityView initResetWithTitle:@"识别失败" withActivityMode:ActivityModeText wittImageName:nil withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                
                return nil;
            }
            
        }
        else
        {
            //[activityView initResetWithTitle:@"识别失败" withActivityMode:ActivityModeText wittImageName:nil withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
            
            return nil;
        }
        
    }
    else
    {
        //[activityView initResetWithTitle:@"识别失败" withActivityMode:ActivityModeText wittImageName:nil withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
        
        return nil;
    }
    
    
    return nil;
}




////两眼之间距离为 0   男方
- (UIImage *)startFaceDetectorWithImagecutttzerozero:(UIImage *)detectorImage
{
    //AnyObjectActivityView *activityView = [[AnyObjectActivityView alloc]initWithTitle:@"正在人脸识别...请稍等" withActivityMode:ActivityModeIndicatorAndText wittImageName:nil withAddedSuperView:kWindow withMargin:ActivityMargin10];
    
    
    detectorImage = [detectorImage fixOrientation];
    
    
    // 检测
    
    NSString *strResult = [self.faceDetector detectARGB:detectorImage];
    
    
    
    
    
    //NSLog(@"讯飞 face+++++++++++++++   %@    +++++++++++++++f",strResult);
    
    
    NSError *error = nil; //!< 先设置错误为nil,如果错误为真了，说明识别出错，否则正确
    NSData *resultData = [strResult dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *faceDetectorDictionary = [NSJSONSerialization JSONObjectWithData:resultData options:NSJSONReadingMutableContainers error:&error];
    
    
    //NSLog(@"%@",faceDetectorDictionary);
    
    
    if(faceDetectorDictionary)
    {
        if ([[faceDetectorDictionary objectForKey:@"ret"] integerValue] == 0)
        {
            NSArray *faceArray=[faceDetectorDictionary objectForKey:@"face"];
            if ([faceArray count])
            {
                
                NSDictionary *itemDictionary = [faceArray firstObject];
                NSDictionary *positionDictionary = [itemDictionary objectForKey:@"position"];
                
                CGFloat bottom = [[positionDictionary objectForKey:@"bottom"] floatValue];
                CGFloat left = [[positionDictionary objectForKey:@"left"] floatValue];
                CGFloat right = [[positionDictionary objectForKey:@"right"] floatValue];
                CGFloat top = [[positionDictionary objectForKey:@"top"] floatValue];
                
                
                
                float x = left;
                float y = top;
                float width = right- left;
                float height = bottom - top;
                
                
                
                
                //[activityView initResetWithTitle:@"识别成功" withActivityMode:ActivityModeText wittImageName:nil withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                
                
                
                if ([ZMSystemTool iPhone5Device]) {
                    
                    
                    UIImage *faceImg = [detectorImage imageAtRect:CGRectMake(x  , y - 10, width , height + 10)];
                    
                    return faceImg;
                    
                    
                } else if ([ZMSystemTool iPhone6Device]) {
                    
                    
                    UIImage *faceImg = [detectorImage imageAtRect:CGRectMake(x - 20  , y - 40, width + 40, height + 60)];
                    
                    return faceImg;
                    
                    
                    
                } else {
                    
                    
                    UIImage *faceImg = [detectorImage imageAtRect:CGRectMake(x  , y - 10, width , height + 10)];
                    
                    return faceImg;
                    
                    
                }
                
                
                
                
                
                
            }
            else
            {
                //[activityView initResetWithTitle:@"识别失败" withActivityMode:ActivityModeText wittImageName:nil withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                
                return nil;
            }
            
        }
        else
        {
            //[activityView initResetWithTitle:@"识别失败" withActivityMode:ActivityModeText wittImageName:nil withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
            
            return nil;
        }
        
    }
    else
    {
        //[activityView initResetWithTitle:@"识别失败" withActivityMode:ActivityModeText wittImageName:nil withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
        
        return nil;
    }
    
    
    return nil;
}



////两眼之间距离为 0  女方
- (UIImage *)startFaceDetectorImagecutttzerozeroGirll:(UIImage *)detectorImage
{
    //AnyObjectActivityView *activityView = [[AnyObjectActivityView alloc]initWithTitle:@"正在人脸识别...请稍等" withActivityMode:ActivityModeIndicatorAndText wittImageName:nil withAddedSuperView:kWindow withMargin:ActivityMargin10];
    
    
    detectorImage = [detectorImage fixOrientation];
    
    
    // 检测
    
    NSString *strResult = [self.faceDetector detectARGB:detectorImage];
    
    
    
    
    
    //NSLog(@"讯飞 face+++++++++++++++   %@    +++++++++++++++f",strResult);
    
    
    NSError *error = nil; //!< 先设置错误为nil,如果错误为真了，说明识别出错，否则正确
    NSData *resultData = [strResult dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *faceDetectorDictionary = [NSJSONSerialization JSONObjectWithData:resultData options:NSJSONReadingMutableContainers error:&error];
    
    
    //NSLog(@"%@",faceDetectorDictionary);
    
    
    if(faceDetectorDictionary)
    {
        if ([[faceDetectorDictionary objectForKey:@"ret"] integerValue] == 0)
        {
            NSArray *faceArray=[faceDetectorDictionary objectForKey:@"face"];
            if ([faceArray count])
            {
                
                NSDictionary *itemDictionary = [faceArray firstObject];
                NSDictionary *positionDictionary = [itemDictionary objectForKey:@"position"];
                
                CGFloat bottom = [[positionDictionary objectForKey:@"bottom"] floatValue];
                CGFloat left = [[positionDictionary objectForKey:@"left"] floatValue];
                CGFloat right = [[positionDictionary objectForKey:@"right"] floatValue];
                CGFloat top = [[positionDictionary objectForKey:@"top"] floatValue];
                
                
                
                float x = left;
                float y = top;
                float width = right- left;
                float height = bottom - top;
                
                
                
                
                //[activityView initResetWithTitle:@"识别成功" withActivityMode:ActivityModeText wittImageName:nil withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                
                
                
                if ([ZMSystemTool iPhone5Device]) {
                    
                    
                    UIImage *faceImg = [detectorImage imageAtRect:CGRectMake(x  , y - 10, width , height + 10)];
                    
                    return faceImg;
                    
                    
                } else if ([ZMSystemTool iPhone6Device]) {
                    
                    
                    UIImage *faceImg = [detectorImage imageAtRect:CGRectMake(x - 50  , y - 100, width + 100, height + 100 + 10)];
                    
                    return faceImg;
                    
                    
                    
                } else {
                    
                    
                    UIImage *faceImg = [detectorImage imageAtRect:CGRectMake(x  , y - 10, width , height + 10)];
                    
                    return faceImg;
                    
                    
                }
                
                
                
                
                
                
            }
            else
            {
                //[activityView initResetWithTitle:@"识别失败" withActivityMode:ActivityModeText wittImageName:nil withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                
                return nil;
            }
            
        }
        else
        {
            //[activityView initResetWithTitle:@"识别失败" withActivityMode:ActivityModeText wittImageName:nil withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
            
            return nil;
        }
        
    }
    else
    {
        //[activityView initResetWithTitle:@"识别失败" withActivityMode:ActivityModeText wittImageName:nil withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
        
        return nil;
    }
    
    
    return nil;
}










//位置判断
- (CGRect )startDetectorWithImage:(UIImage *)detectorImage{


    // 检测
    NSString *strResult = [self.faceDetector detectARGB:detectorImage];
    
    NSError *error = nil; //!< 先设置错误为nil,如果错误为真了，说明识别出错，否则正确
    NSData *resultData=[strResult dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *faceDetectorDictionary = [NSJSONSerialization JSONObjectWithData:resultData options:NSJSONReadingMutableContainers error:&error];
    
    
    
    if ([[faceDetectorDictionary objectForKey:@"ret"] integerValue] == 0)
    {
        NSArray *faceArray=[faceDetectorDictionary objectForKey:@"face"];
        if ([faceArray count])
        {
            
            NSDictionary *itemDictionary = [faceArray firstObject];
            NSDictionary *positionDictionary = [itemDictionary objectForKey:@"position"];
            
            CGFloat bottom = [[positionDictionary objectForKey:@"bottom"] floatValue];
            CGFloat left = [[positionDictionary objectForKey:@"left"] floatValue];
            CGFloat right = [[positionDictionary objectForKey:@"right"] floatValue];
            CGFloat top = [[positionDictionary objectForKey:@"top"] floatValue];
            
            
            
            float x = left;
            float y = top;
            float width = right- left;
            float height = bottom - top;
            
            //                float x = left - 30;
            //                float y = top - 40;
            //                float width = right- left + 60;
            //                float height = bottom - top + 30;
            
            
            
            
            //UIImage *faceImg = [detectorImage imageAtRect:CGRectMake(x , y , width, height)];
            
            CGRect faceR = CGRectMake(x , y , width, height);
            
            return faceR;
            
            
            
        }else {
        
            return CGRectZero;
        }
    }else {
    
        return CGRectZero;
    }
        
}






@end

