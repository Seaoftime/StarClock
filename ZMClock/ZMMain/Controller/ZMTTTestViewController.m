//
//  ZMTTTestViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/7/6.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//


///测试测试
#import "ZMTTTestViewController.h"

#import "FaceGrindingImage.h"
#import "ZRRImageTool.h"
#import "UIImage+RTTint.h"
#import "ZMHeaderPoartColorSetModel.h"
#import "GPUImage.h"
#import <objc/runtime.h>
#import <objc/message.h>


#import "UIImage+Colors.h"
#import "UIColor+Convert.h"


#define SKINColor RGB(253, 219, 189)
//#define SKINColor RGB(237, 232, 224)
//#define SKINColor RGB(235, 235, 235)
#define COLORR 253
#define COLORG 219
#define COLORB 189


@interface ZMTTTestViewController ()<UIGestureRecognizerDelegate>
{
    CGFloat _lastScale;
    CGRect _oldFrame;    //保存图片原来的大小
    CGRect _smallFrame;  //最小缩放
    CGRect _largeFrame;  //图片放大最大的程度
    
    GPUImageFilter *_stillImageFilter;
    
    GPUImageFilter *_stillImageFilter2;
    
    float _mainR;
    float _mainG;
    float _mainB;
    
}


@property (nonatomic, strong) UIView *headBgV;

@property (nonatomic, strong) UIImageView *headPortraitImgV;
@property (nonatomic, strong) UIImageView *headMaskImgV;//头像遮罩




@property (nonatomic, strong) UIImage *faceGrindingImg;//磨皮
@property (nonatomic, strong) UIImage *ligtImg;//亮度对比度
@property (nonatomic, strong) UIImage *destImg;//


@property (nonatomic, strong) UIImage *faceGrindingImg2;//磨皮
@property (nonatomic, strong) UIImage *ligtImg2;//亮度对比度

@property (nonatomic, strong) UIImageView *imggg12;
///////
@property (nonatomic, strong) NSArray *colorrs;
@property (nonatomic, strong) UIColor *mainColor;


@property (nonatomic, strong) NSMutableArray *filterNameArray;//滤镜名称
@property (nonatomic, strong) NSMutableArray *filetersArray;

@end

@implementation ZMTTTestViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    //
    self.title = @"头像滤镜调试";
//滤镜名称数据
    self.filterNameArray = [[NSMutableArray alloc] initWithObjects:
                        @"CIColorPosterize",//
                        @"CIPhotoEffectChrome",
                        @"CIPhotoEffectMono",//黑白
                        @"CILinearToSRGBToneCurve",//丽日
                        @"CIPhotoEffectInstant",//流年
                        @"CIPhotoEffectChrome",//淡雅  5
                            @"CIPhotoEffectFade",
                            @"CIMinimumComponent",
                        @"CIColorControls",
                        @"CIColorMatrix",
                        @"CIExposureAdjust",
                        @"CIBlendWithAlphaMask",
                        @"CIBlendWithMask",
                        @"CIBloom",
                        @"CIBumpDisTortion",
                        @"CIBumpDisTortionLinear",
                        @"CICheckerboardGenerator",
                        @"CICircleSplashDistortion",
                        @"CICircularScreen",
                        @"CIColorBlendMode",
                        @"CIColorBurnBlendMode",
                        @"CIColorClamp",
                        @"CIColorCrossPolynomial",
                        @"CIColorCube",
                        @"CIColorCubeWithColorSpace",
                        @"CIColorDodgeBlendMode",
                        @"CIColorInvert",
                        @"CIColorMap",
                        @"CIColorMonochrome",
                        @"CIColorPolynomial",
                        @"CIColorPosterize",
                        @"CIConvolution3X3",
                        @"CIConvolution5X5",
                        @"CIConvolution9Horizontal",
                        @"CIConvolution9Vertical",
                        @"CICopyMachineTransition",
                        @"CICrop",
                        @"CIDarkenBlendMode",
                        @"CIDifferenceBlendMode",
                            @"CIDisintegrateWithMaskTransition",
                        @"CIDissolveTransition",
                        @"CIPhotoEffectInstant",
                        @"CIPhotoEffectTransfer",//
                        @"CIEightfoldReflectedTile",
                        @"CIExclusionBlendMode",//39
                        @"CIPhotoEffectChrome",//40
                        @"CILineOverlay",
                        @"CIColorMatrix",//42
                            
                        nil];

    
    [self addFilterArray];
    
    
//识别的头像处理
    [self progressHeaderPortarait];
    
    //NSArray *filterNames=[CIFilter filterNamesInCategory:kCICategoryBuiltIn];
    
    
    
    
    
}


#pragma mark - 数据
-(void)addFilterArray
{
    _filetersArray = [NSMutableArray array];
    ZMHeaderPoartColorSetModel *fileterModel = nil;
    
    fileterModel = [[ZMHeaderPoartColorSetModel alloc] init];
    fileterModel.classname = @"GPUImageBrightnessFilter";
    fileterModel.selector = @"setBrightness:";
    fileterModel.showname = @"亮度";
    fileterModel.maxValue = 0.5;
    fileterModel.minValue = -0.5;
    [_filetersArray addObject:fileterModel];
    
    fileterModel = [[ZMHeaderPoartColorSetModel alloc] init];
    fileterModel.classname = @"GPUImageExposureFilter";
    fileterModel.selector = @"setExposure:";
    fileterModel.showname = @"曝光";
    fileterModel.maxValue = 2.0;
    fileterModel.minValue = -4.0;
    [_filetersArray addObject:fileterModel];
    
    fileterModel = [[ZMHeaderPoartColorSetModel alloc] init];
    fileterModel.classname = @"GPUImageSharpenFilter";
    fileterModel.selector = @"setSharpness:";
    fileterModel.showname = @"锐化";
    fileterModel.maxValue = 1;
    fileterModel.minValue = 0;
    [_filetersArray addObject:fileterModel];
    
    
    fileterModel = [[ZMHeaderPoartColorSetModel alloc] init];
    fileterModel.classname = @"GPUImageMonochromeFilter";
    fileterModel.selector = @"setIntensity:";
    fileterModel.showname = @"单色";
    fileterModel.maxValue = 1;
    fileterModel.minValue = 0;
    [_filetersArray addObject:fileterModel];
    
    
    
    fileterModel = [[ZMHeaderPoartColorSetModel alloc] init];
    fileterModel.classname = @"GPUImageEmbossFilter";
    fileterModel.selector = @"setIntensity:";
    fileterModel.showname = @"浮雕效果，带有点3d的感觉" ;
    fileterModel.maxValue = 1;
    fileterModel.minValue = 0;
    [_filetersArray addObject:fileterModel];
    
    
    fileterModel = [[ZMHeaderPoartColorSetModel alloc] init];
    fileterModel.classname = @"GPUImageSmoothToonFilter";
    fileterModel.selector = @"setBlurSize:";
    fileterModel.showname =@"粗旷的画风" ;
    fileterModel.maxValue = 1;
    fileterModel.minValue = 0;
    [_filetersArray addObject:fileterModel];//5
    
    
//    fileterModel = [[ZMHeaderPoartColorSetModel alloc] init];
//    fileterModel.classname = @"GPUImageToonFilter";
//    fileterModel.selector = @"setThreshold:";
//    fileterModel.showname =@"卡通" ;
//    fileterModel.maxValue = 1;
//    fileterModel.minValue = 0;
//    [_filetersArray addObject:fileterModel];

    

    
}



- (UIImage *) ImageWithColor: (UIColor *) color frame:(CGRect)aFrame
{
    aFrame = CGRectMake(0, 0, aFrame.size.width, aFrame.size.height);
    UIGraphicsBeginImageContext(aFrame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, aFrame);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

//- (UIImage *)imageToTransparent:(UIImage *)image
//
//{
//    
//    // 分配内存
//    
//    const int imageWidth = image.size.width;
//    
//    const int imageHeight = image.size.height;
//    
//    size_t bytesPerRow = imageWidth * 4;
//    
//    uint32_t* rgbImageBuf = (uint32_t*)malloc(bytesPerRow * imageHeight);
//    
//    
//    
//    // 创建context
//    
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    
//    CGContextRef context = CGBitmapContextCreate(rgbImageBuf, imageWidth, imageHeight, 8, bytesPerRow, colorSpace,
//                                                 
//                                                 kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipLast);
//    
//    CGContextDrawImage(context, CGRectMake(0, 0, imageWidth, imageHeight), image.CGImage);
//    
//    
//    
//    // 遍历像素
//    
//    int pixelNum = imageWidth * imageHeight;
//    
//    uint32_t* pCurPtr = rgbImageBuf;
//    
//    for (int i = 0; i < pixelNum; i++, pCurPtr++)
//        
//    {
//        
//        //将像素点转成子节数组来表示---第一个表示透明度即ARGB这种表示方式。ptr[0]:透明度,ptr[1]:R,ptr[2]:G,ptr[3]:B
//        
//        //分别取出RGB值后。进行判断需不需要设成透明。
//        
//        uint8_t* ptr = (uint8_t *)pCurPtr;
//        
////        if (ptr[1] > 200 && ptr[2] > 200 && ptr[3] > 200) {
////            
////            ptr[1] = 0 ;
////            ptr[2] = 0 ;
////            ptr[3] = 0 ;//透明
////
////            
////            
////        }else if (ptr[1] == 235 && ptr[2] == 192 && ptr[3] == 175) {
////            
////            ptr[1] = 0 ;
////            ptr[2] = 0 ;
////            ptr[3] = 0 ;
////        
////        }else {
////        
////        }
//        
//        
//        
//        if (ptr[1] > COLORR || ptr[2] > COLORG || ptr[3] > COLORB) {
//            
//            ptr[1] = 0 ;
//            ptr[2] = 0 ;
//            ptr[3] = 0 ;
//            
//            
//        }else {
//            
//        }
//
//        
//        
//    }
//    
//    // 将内存转成image
//    
//    CGDataProviderRef dataProvider =CGDataProviderCreateWithData(NULL, rgbImageBuf, bytesPerRow * imageHeight, nil);
//    
//    
//    
//    CGImageRef imageRef = CGImageCreate(imageWidth, imageHeight,8, 32, bytesPerRow, colorSpace,
//                                        
//                                        kCGImageAlphaLast |kCGBitmapByteOrder32Little, dataProvider,
//                                        
//                                        NULL, true,kCGRenderingIntentDefault);
//    
//    CGDataProviderRelease(dataProvider);
//    
//    UIImage* resultUIImage = [UIImage imageWithCGImage:imageRef];
//    
//    // 释放
//    
//    CGImageRelease(imageRef);
//    
//    CGContextRelease(context);
//    
//    CGColorSpaceRelease(colorSpace);
//    
//    return resultUIImage;
//    
//}
//
//
//- (UIImage *)imageBlackToTransparent:(UIImage *)image
//{
//    // 分配内存
//    const int imageWidth = image.size.width;
//    const int imageHeight = image.size.height;
//    size_t      bytesPerRow = imageWidth * 4;
//    uint32_t* rgbImageBuf = (uint32_t*)malloc(bytesPerRow * imageHeight);
//    
//    // 创建context
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGContextRef context = CGBitmapContextCreate(rgbImageBuf, imageWidth, imageHeight, 8, bytesPerRow, colorSpace,kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipLast);
//    CGContextDrawImage(context, CGRectMake(0, 0, imageWidth, imageHeight), image.CGImage);
//    
//    // 遍历像素
//    int pixelNum = imageWidth * imageHeight;
//    uint32_t* pCurPtr = rgbImageBuf;
//    
//    for (int i = 0; i < pixelNum; i++, pCurPtr++)
//    {
//        if ((*pCurPtr & 0xFFFFFF00) == 0)    // 将黑色变成透明
//        {
//            uint8_t* ptr = (uint8_t*)pCurPtr;
//            
//            ptr[0] = 0;
//            ptr[1] = 0;
//            ptr[2] = 0;
//            ptr[3] = 0;
//        }
//        
//        
//    }
//    
//    // 将内存转成image
//    CGDataProviderRef dataProvider = CGDataProviderCreateWithData(NULL, rgbImageBuf, bytesPerRow * imageHeight,ProviderReleaseData);
//    CGImageRef imageRef = CGImageCreate(imageWidth, imageHeight, 8, 32, bytesPerRow, colorSpace,kCGImageAlphaLast | kCGBitmapByteOrder32Little, dataProvider,NULL, true, kCGRenderingIntentDefault);
//    
//    CGDataProviderRelease(dataProvider);
//    
//    UIImage* resultUIImage = [UIImage imageWithCGImage:imageRef];
//    
//    // 释放
//    CGImageRelease(imageRef);
//    CGContextRelease(context);
//    CGColorSpaceRelease(colorSpace);
//    
//    // free(rgbImageBuf) 创建dataProvider时已提供释放函数，这里不用free
//    return resultUIImage;
//}
//
///** 颜色变化 */
//void ProviderReleaseData (void *info, const void *data, size_t size)
//{
//    free((void*)data);
//}
//
//






#pragma mark - UI
#pragma mark ------识别成功的头像的处理
- (void)progressHeaderPortarait
{
    
    self.headBgV = [[UIView alloc] initWithFrame:CGRectMake(0, 100,  kScreen_Width, kScreen_Height/2)];
    
    self.headBgV.backgroundColor = SKINColor;
    //self.headBgV.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.headBgV];//头像背景视图
    
    

    
//    self.headPortraitImgV = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width/4 - 60, 60, 120, 120)];
    
    self.headPortraitImgV = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width/4 - 50, 70, 110, 100)];
    
    //self.headPortraitImgV = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width/2 - 60, 200, 120, 120)];
    
//    self.headPortraitImgV = [[UIImageView alloc] initWithFrame:CGRectMake(80, 70, 120, 120)];
    
    self.headPortraitImgV.backgroundColor = [UIColor clearColor];
    self.headPortraitImgV.layer.cornerRadius = 25;
    self.headPortraitImgV.layer.masksToBounds = YES;
    
    //支持多点触碰 设置可交互
    [self.headPortraitImgV setMultipleTouchEnabled:YES];
    [self.headPortraitImgV setUserInteractionEnabled:YES];
    
    
    //[self.headBgV addSubview:self.headPortraitImgV];//头像视图
    [self.headBgV addSubview:self.headPortraitImgV];
    
    

    
    
//头像遮罩
    
    self.headMaskImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0 , 0, 220, 210)];
    
    self.headMaskImgV.backgroundColor = [UIColor clearColor];
    self.headMaskImgV.image = IMAGE(@"遮罩200乘200");
    
    [self.headBgV addSubview:self.headMaskImgV];
    
    
//手势处理
    
    _oldFrame = self.headPortraitImgV.frame;
    _smallFrame = CGRectMake(self.headPortraitImgV.frame.origin.x + (self.headPortraitImgV.frame.origin.x/2), self.headPortraitImgV.frame.origin.y + (self.headPortraitImgV.frame.origin.y/2), self.headPortraitImgV.frame.size.width/1.6, self.headPortraitImgV.frame.size.height/1.6);
    
    //_largeFrame = CGRectMake(0 - (_oldFrame.origin.x * 0.5), 0 - (_oldFrame.origin.y * 0.5), 1.5 * _oldFrame.size.width, 1.5 * _oldFrame.size.height);
    
    _largeFrame = CGRectMake(10 , 10 , 1.5 * _oldFrame.size.width, 1.5 * _oldFrame.size.height);
    
    
    //字符串转图片
    
    NSString *faceStr = [NSUserDefaults standardUserDefaults].faceDetectorImageStr;
    
    if (faceStr == nil || faceStr == NULL || [faceStr isKindOfClass:[NSNull class]]) {
        
        
    }else {
        
        
        NSData *decodeImgData = [[NSData alloc] initWithBase64EncodedString:faceStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *faceImg = [UIImage imageWithData:decodeImgData];
        
        
        ///裁剪图片
        CGFloat width = faceImg.size.width;
        CGFloat hight = faceImg.size.height;
        
        //NSLog(@"wwwwwwwww%f       hhhhhhhhhh%f",width,hight);
        //开始绘制图片
        UIGraphicsBeginImageContext(faceImg.size);
        CGContextRef ref = UIGraphicsGetCurrentContext();
        
        ///
        //绘制Clip区域(在开始绘画和转换坐标系之间)
        CGContextMoveToPoint(ref, width, 0);//第一个点
        CGContextAddLineToPoint(ref,width, hight/2 - 20);//2
        CGContextAddLineToPoint(ref,width - 10, hight/2 + 10);//3
        
        CGContextAddLineToPoint(ref, width - 20, hight/2 + 40);//4
//        
        CGContextAddLineToPoint(ref, width - 35, hight/2 + 60);//5
         CGContextAddLineToPoint(ref, width - 50, hight/2 + 75);
        
        
        CGContextAddLineToPoint(ref, width/2 - 15, hight/2 + 100);
//        
        CGContextAddLineToPoint(ref, width/2 - 30, hight/2 + 75);
        
        //CGContextAddLineToPoint(ref, width/2, hight/2 + 95);
        
        CGContextAddLineToPoint(ref, 20, hight/2 + 30);
        
        CGContextAddLineToPoint(ref, 10, hight/2 );
        
//        
//        CGContextAddLineToPoint(ref, 80, hight - 40);
//        CGContextAddLineToPoint(ref, 50, hight - 80);
//        
//        CGContextAddLineToPoint(ref, 20, hight/2 - 20);
        CGContextAddLineToPoint(ref, 0, 0);
        
        
        CGContextClosePath(ref);//关闭绘制路径
        CGContextClip(ref);//剪切
        ///
        
        //坐标系转换(因为CGContextDrawImage会使用Quartz内的以左下角为(0,0)的坐标系)
        CGContextTranslateCTM(ref, 0, hight);
        CGContextScaleCTM(ref, 1, -1);
        CGContextDrawImage(ref, CGRectMake(0, 0, width, hight), [faceImg CGImage]);
        
        //结束绘画
        self.destImg = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        

        
        
        NSMutableArray *arr = [[NSMutableArray alloc] initWithArray:[self.destImg mainColoursInDetail:6]];
        
        NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"percentage" ascending:YES];
        self.colorrs = [arr sortedArrayUsingDescriptors:[NSArray arrayWithObject:sort]];
        
        self.mainColor = [[self.colorrs objectAtIndex:2] objectForKey:@"color"];//
        //self.headBgV.backgroundColor = self.mainColor;
        
        
        

      //  NSLog(@"~~~~~~~~~~~~~~~ %@", arr);
       // NSLog(@"~~~~~~~~~~~~~~~ %ld", (unsigned long)arr.count);
        //NSLog(@"~~~~~~~~~~~~~~~ %@", self.mainColor);
        
        
        
        NSMutableArray *arrrr = [[NSMutableArray alloc] initWithArray:[self.destImg rgbColoursInDetail:6]];
        
        NSString *stttrrr = [arrrr objectAtIndex:2];
        
        
        NSArray *arrayyy = [stttrrr componentsSeparatedByString:@","];
        
        _mainR = [[arrayyy objectAtIndex:0] floatValue];
        _mainG = [[arrayyy objectAtIndex:1] floatValue];
        _mainB = [[arrayyy objectAtIndex:2] floatValue];
        
       // NSLog(@"~~~~~~~~~~~~~~~~~  %f %f %f",_mainR,_mainG,_mainB);
        
 //       NSSortDescriptor *sorttt = [NSSortDescriptor sortDescriptorWithKey:@"percentage" ascending:YES];
//        self.colorrs = [arrrr sortedArrayUsingDescriptors:[NSArray arrayWithObject:sorttt]];
//        
//        self.mainColor = [[self.colorrs objectAtIndex:2] objectForKey:@"color"];//234  204 188

        
        
        
                
        //转黑白照片
        //UIImage *blackWhiteImg = [ZRRImageTool filerWithOriginalImage:self.destImg fileterName:[self.filterNameArray objectAtIndex:2]];
        
        
        
        // 磨皮算法处理的图片
        self.faceGrindingImg = [FaceGrindingImage imageByBilateralFilterImage:self.destImg distance:10.0];
        
        //self.faceGrindingImg = [FaceGrindingImage imageByBilateralFilterImage:faceImg distance:10.0];
        


        //饱和度.亮度.对比度
        //self.ligtImg = [ZRRImageTool colorControlsWithOriginalImage:self.faceGrindingImg saturation:1.0 brightness:0.5 contrast:2.0];

        
    
        
        //滤镜 33 39
        //UIImage *imgg = [ZRRImageTool filerWithOriginalImage:self.faceGrindingImg fileterName:[self.filterNameArray objectAtIndex:2]];
        
        //UIImage *imgg3 = [ZRRImageTool filerWithOriginalImage:self.ligtImg fileterName:[self.filterNameArray objectAtIndex:0]];
        
        // 4
        //UIImage *imgg1 = [ZRRImageTool filerWithOriginalImage:imgg fileterName:[self.filterNameArray objectAtIndex:4]];
        
        //self.ligtImg = [ZRRImageTool colorControlsWithOriginalImage:imgg1 saturation:1.0 brightness:0.5 contrast:2.0];
        
        
        self.headPortraitImgV.alpha = 1.0;
        
        
        //UIImage *immmmmmm = [self imageToTransparent:self.faceGrindingImg];
        
        //UIImage *immmm = [self imageBlackToTransparent:immmmmmm];
        
        //self.headPortraitImgV.image = self.faceGrindingImg;
        //self.headPortraitImgV.image = self.ligtImg;

        //self.headPortraitImgV.image = immmmmmm;
        //self.headPortraitImgV.image = immmm;
        
        
        
        
        
        //self.headBgV.backgroundColor = self.mainColor;
        
        
//        self.headPortraitImgV.image = self.ligtImg;
        
        
        
        
        
        
//渐变色
//        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
//        gradientLayer.frame = self.headPortraitImgV.bounds;
//        [self.headPortraitImgV.layer addSublayer:gradientLayer];
//        //set gradient colors
//        gradientLayer.colors = @[(__bridge id)SKINColor.CGColor, (__bridge id)[UIColor clearColor].CGColor];
//        gradientLayer.startPoint = CGPointMake(0.1, 0.1);
//        gradientLayer.endPoint = CGPointMake(1, 1);
//        
        
        
        
        
        
//        UIImageView *imgv11 = [[UIImageView alloc] initWithFrame:CGRectMake(- 85, 0, 200, 200)];
//        imgv11.backgroundColor = [UIColor clearColor];
//        imgv11.layer.cornerRadius = 100;
//        imgv11.layer.masksToBounds = YES;
//        
//        
//        
//        self.imggg12 = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width/2 - 100, 200, 200, 200)];
//        self.imggg12.userInteractionEnabled = YES;
//        
//        self.imggg12.backgroundColor = [UIColor blackColor];
//        self.imggg12.layer.cornerRadius = 100;
//        self.imggg12.layer.masksToBounds = YES;
//        
//        
//        
//        [self.view addSubview:self.imggg12];
//        [self.imggg12 addSubview:imgv11];
//        [imgv11 addSubview:self.headPortraitImgV];
//        
        
        
        
        
        
        
//        self.faceGrindingImg = [FaceGrindingImage imageByBilateralFilterImage:destImg distance:8.0];
//        
//        self.ligtImg = [ZRRImageTool colorControlsWithOriginalImage:self.faceGrindingImg saturation:0.8 brightness:0.5 contrast:2.0];
////
//
//        
//        self.faceGrindingImg = [FaceGrindingImage imageByBilateralFilterImage:faceImg distance:8.0];
//        
//        self.ligtImg = [ZRRImageTool colorControlsWithOriginalImage:self.faceGrindingImg saturation:0.8 brightness:0.6 contrast:2.0];
//        
//        
//        
//         //滤镜
//        UIImage *imggg = [ZRRImageTool filerWithOriginalImage:self.ligtImg fileterName:[self.filterNameArray objectAtIndex:33]];
//        
//        UIImage *imggg1 = [ZRRImageTool filerWithOriginalImage:faceImg fileterName:[self.filterNameArray lastObject]];

        
        //
        //self.headPortraitImgV.image = self.ligtImg;
        
        
 //       self.headPortraitImgV.image = imggg;
        
        
        
        
        
        
        
/////////////////
        ZMHeaderPoartColorSetModel *model = _filetersArray[2];
        
        Class classname = NSClassFromString(model.classname);
        _stillImageFilter = [[classname alloc] init];
        SEL selector = NSSelectorFromString(model.selector);
        if ([_stillImageFilter respondsToSelector:selector]) {
            
            if (_stillImageFilter && [_stillImageFilter isKindOfClass:[GPUImageToneCurveFilter class]])
            {
                [(GPUImageToneCurveFilter *)_stillImageFilter setBlueControlPoints:[NSArray arrayWithObjects: [NSValue valueWithCGPoint:CGPointMake(0.5, 0.5)], [NSValue valueWithCGPoint:CGPointMake(1.0, 0.75)], nil]];
            }
            else
            {
                //void (*objc_msgSendTyped)(id self, SEL _cmd, CGFloat arg1) = (void*)objc_msgSend;
                //CGFloat value = _controllerSlider.value;
                //objc_msgSendTyped(_stillImageFilter, selector,value);
            }
        }
        
        
        
        UIImage *filteredImage = [_stillImageFilter imageByFilteringImage:self.faceGrindingImg];
        
        //self.headPortraitImgV.image = filteredImage;
        
        
       
        // 磨皮算法处理的图片
        //self.faceGrindingImg2 = [FaceGrindingImage imageByBilateralFilterImage:filteredImage distance:10.0];
        
        
        //饱和度.亮度.对比度
        //self.ligtImg2 = [ZRRImageTool colorControlsWithOriginalImage:self.faceGrindingImg2 saturation:1.0 brightness:0.5 contrast:2.0];
        
        
        
        
        
//        UIImage *imggg2 = [ZRRImageTool filerWithOriginalImage:self.ligtImg2 fileterName:[self.filterNameArray objectAtIndex:40]];
//        
//        UIImage *imggg3 = [ZRRImageTool filerWithOriginalImage:self.ligtImg2 fileterName:[self.filterNameArray objectAtIndex:5]];
//        
//        
//        UIImage *imggg4 = [ZRRImageTool filerWithOriginalImage:self.faceGrindingImg2 fileterName:[self.filterNameArray objectAtIndex:40]];
//        
//        UIImage *imggg5 = [ZRRImageTool filerWithOriginalImage:self.faceGrindingImg2 fileterName:[self.filterNameArray objectAtIndex:5]];
        
        
       // self.headPortraitImgV.image = self.faceGrindingImg2;
        
        
        
        
        
        
        
        
        
        
//        ZMHeaderPoartColorSetModel *model2 = _filetersArray[0];
//        
//        Class classname2 = NSClassFromString(model2.classname);
//        _stillImageFilter2 = [[classname2 alloc] init];
//        SEL selector2 = NSSelectorFromString(model2.selector);
//        if ([_stillImageFilter2 respondsToSelector:selector2]) {
//            
//            if (_stillImageFilter2 && [_stillImageFilter2 isKindOfClass:[GPUImageToneCurveFilter class]])
//            {
//                [(GPUImageToneCurveFilter *)_stillImageFilter2 setBlueControlPoints:[NSArray arrayWithObjects: [NSValue valueWithCGPoint:CGPointMake(0.5, 0.5)], [NSValue valueWithCGPoint:CGPointMake(1.0, 0.75)], nil]];
//            }
//            else
//            {
//                //void (*objc_msgSendTyped)(id self, SEL _cmd, CGFloat arg1) = (void*)objc_msgSend;
//                //CGFloat value = _controllerSlider.value;
//                //objc_msgSendTyped(_stillImageFilter, selector,value);
//            }
//        }
//
//        
//        UIImage *filteredImage2 = [_stillImageFilter2 imageByFilteringImage:self.ligtImg];
//        
//        
//        //self.headPortraitImgV.image = filteredImage2;
//
        
        
    
    }
    
//添加手势
    //[self addGestureRecognizerToView:self.headPortraitImgV];
    
    
}



#pragma mark - 添加所有的手势
// 添加所有的手势
- (void)addGestureRecognizerToView:(UIImageView *)view
{
    // 旋转手势
    UIRotationGestureRecognizer *rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotateView:)];
    rotationGestureRecognizer.delegate = self;
    [view addGestureRecognizer:rotationGestureRecognizer];
    
    // 缩放手势
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchView:)];
    pinchGestureRecognizer.delegate = self;
    [view addGestureRecognizer:pinchGestureRecognizer];
    
    // 移动手势
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panView:)];
    panGestureRecognizer.delegate = self;
    [view addGestureRecognizer:panGestureRecognizer];
    
    
    
}



#pragma mark - event 

#pragma mark - 右边按钮点击

-(void)navRightBtnAction:(UIButton*)sender
{
    UIImageWriteToSavedPhotosAlbum(self.headPortraitImgV.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);


}


#pragma mark - 保存图片

- (void)image: (UIImage *) image didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo
{
    if(error == NULL){
        [AnyObjectActivityView showWithTitle:@"保存成功" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
    }else{
        [AnyObjectActivityView showWithTitle:@"保存失败" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
    }
    
}


#pragma mark - 手势响应事件

// 处理缩放手势
- (void)pinchView:(UIPinchGestureRecognizer *)pinchGestureRecognizer
{
    UIView *view = pinchGestureRecognizer.view;
    if (pinchGestureRecognizer.state == UIGestureRecognizerStateBegan || pinchGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        
        view.transform = CGAffineTransformScale(view.transform, pinchGestureRecognizer.scale, pinchGestureRecognizer.scale);
        
        if (self.headPortraitImgV.frame.size.width <  _oldFrame.size.width) {
            self.headPortraitImgV.frame = _oldFrame;
            
        }
        if (self.headPortraitImgV.frame.size.width > 1.5 * _oldFrame.size.width) {
            self.headPortraitImgV.frame = _largeFrame;
        }
        pinchGestureRecognizer.scale = 1;
    }
}


//旋转
- (void)rotateView:(UIRotationGestureRecognizer *)rotationGestureRecognizer
{
    UIView *view = rotationGestureRecognizer.view;
    
    if (rotationGestureRecognizer.state == UIGestureRecognizerStateBegan ||
        rotationGestureRecognizer.state == UIGestureRecognizerStateChanged ||
        rotationGestureRecognizer.state == UIGestureRecognizerStateRecognized ||
        rotationGestureRecognizer.state == UIGestureRecognizerStateEnded ||
        rotationGestureRecognizer.state == UIGestureRecognizerStatePossible) {
        
        
        
        view.transform = CGAffineTransformRotate(self.headPortraitImgV.transform, rotationGestureRecognizer.rotation);
        //复位
        rotationGestureRecognizer.rotation = 0;
        
        
    }
    

}





//移动手势
- (void)panView:(UIPanGestureRecognizer *)panGestureRecognizer
{
    UIView *view = panGestureRecognizer.view;
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan || panGestureRecognizer.state == UIGestureRecognizerStateChanged){
    
        CGPoint transP = [panGestureRecognizer translationInView:view];
        
        if (transP.y < kScreen_Height/2) {
            self.headPortraitImgV.transform = CGAffineTransformTranslate(self.headPortraitImgV.transform, transP.x, transP.y);
            
            [panGestureRecognizer setTranslation:CGPointZero inView:self.headPortraitImgV];
            
            
            
            
        }
//        self.headPortraitImgV.transform = CGAffineTransformTranslate(self.headPortraitImgV.transform, transP.x, transP.y);
//        
//        
//        [panGestureRecognizer setTranslation:CGPointZero inView:self.headPortraitImgV];
        
    
    }
    
    
}

#pragma mark - gesture delegate
////允许多事件同时发生
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
//    return  YES;
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
