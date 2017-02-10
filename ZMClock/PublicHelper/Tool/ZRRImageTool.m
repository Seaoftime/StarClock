//
//  ZRRImageTool.m
//  ZMClock
//
//  Created by ZhongMeng on 16/7/6.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZRRImageTool.h"

#import "math.h"

#import "GPUImage.h"

#import "GPUImageBeautifyFilter.h"

#import "ZRSketchFilter.h"

#import "ImageUtil.h"

#import "ColorMatrix.h"


#define PAI 3.1415926535897932384


#define COLORR 253
#define COLORG 219
#define COLORB 189



@implementation ZRRImageTool



//根据原图的size，直接在四周生成圆角
+ (UIImage *)getCornerImageAtOriginalImageCornerWithImage:(UIImage *)image
                                           andCornerWith:(CGFloat)width
                                      andBackGroundColor:(UIColor *)backgroundcolor
{
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0);
    
    CGRect bounds = CGRectMake(0,
                               0,
                               image.size.width,
                               image.size.height);
    
    
    CGRect rect   = CGRectMake(0,
                               0,
                               image.size.width,
                               image.size.height);
    
    [backgroundcolor set];
    UIRectFill(bounds);
    
    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:width] addClip];
    
    [image drawInRect:bounds];
    
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

//根据Size生成圆角，图片会拉伸-变形
+ (UIImage *)getCornerImageFitSize:(CGSize)Size
                        WithImage:(UIImage *)image
                    andCornerWith:(CGFloat)width
               andBackGroundColor:(UIColor *)backgroundcolor
{
    
    UIGraphicsBeginImageContextWithOptions(Size, NO, 0.0);
    
    
    CGRect bounds = CGRectMake(0,
                               0,
                               Size.width,
                               Size.height);
    
    CGRect rect   = CGRectMake(0,
                               0,
                               Size.width,
                               Size.height);
    
    [backgroundcolor set];
    UIRectFill(bounds);
    
    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:width] addClip];
    
    [image drawInRect:bounds];
    
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

//根据Size生成圆角，图片会自适应填充，伸展范围以外的部分会被裁剪掉-不会变形
+ (UIImage *)getCornerImageFillSize:(CGSize)Size
                         WithImage:(UIImage *)image
                     andCornerWith:(CGFloat)width
                andBackGroundColor:(UIColor *)backgroundcolor

{
    UIGraphicsBeginImageContextWithOptions(Size, NO, 0.0);
    
    CGFloat bili_imageWH = image.size.width/image.size.height;
    CGFloat bili_SizeWH  = Size.width/Size.height;
    
    CGRect bounds;
    
    if (bili_imageWH > bili_SizeWH) {
        
        CGFloat bili_SizeH_imageH = Size.height/image.size.height;
        
        CGFloat height = image.size.height*bili_SizeH_imageH;
        
        CGFloat width = height * bili_imageWH;
        
        CGFloat x = -(width - Size.width)/2;
        
        CGFloat y = 0;
        
        bounds = CGRectMake(x,
                            y,
                            width,
                            height);
    }else{
        
        CGFloat bili_SizeW_imageW = Size.width/image.size.width;
        
        CGFloat width = image.size.width * bili_SizeW_imageW;
        
        CGFloat height = width / bili_imageWH;
        
        CGFloat x = 0;
        
        CGFloat y = -(height - Size.height)/2;
        
        bounds = CGRectMake(x,
                            y,
                            width,
                            height);
        
    }
    
    CGRect rect   = CGRectMake(0,
                               0,
                               Size.width,
                               Size.height);
    
    
    [backgroundcolor set];
    UIRectFill(bounds);
    
    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:width] addClip];
    
    [image drawInRect:bounds];
    
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

//生成带水印的图片
+ (UIImage *)GetWaterPrintedImageWithBackImage:(UIImage *)backImage
                                andWaterImage:(UIImage *)waterImage
                                       inRect:(CGRect)waterRect
                                        alpha:(CGFloat)alpha
                                   waterScale:(BOOL)waterScale
{
    //说明，在最后UIImageView转UIImage的时候，View属性的size会压缩成1倍像素的size,所以本方法内涉及到Size的地方需要乘以2或3，才能保证最后的清晰度
    
    //默认制作X2像素，也可改成3或其它
    CGFloat clear = 2;
    
    UIImageView *backIMGV = [[UIImageView alloc]init];
    backIMGV.backgroundColor = [UIColor clearColor];
    backIMGV.frame = CGRectMake(0,
                                0,
                                backImage.size.width*clear,
                                backImage.size.height*clear);
    backIMGV.contentMode = UIViewContentModeScaleAspectFill;
    backIMGV.image = backImage;
    
    UIImageView *waterIMGV = [[UIImageView alloc]init];
    waterIMGV.backgroundColor = [UIColor clearColor];
    waterIMGV.frame = CGRectMake(waterRect.origin.x*clear,
                                 waterRect.origin.y*clear,
                                 waterRect.size.width*clear,
                                 waterRect.size.height*clear);
    if (waterScale) {
        waterIMGV.contentMode = UIViewContentModeScaleToFill;
    }else{
        waterIMGV.contentMode = UIViewContentModeScaleAspectFill;
    }
    waterIMGV.alpha = alpha;
    waterIMGV.image = waterImage;
    
    [backIMGV addSubview:waterIMGV];
    
    UIImage *outImage = [self imageWithUIView:backIMGV];
    
    return outImage;
}


//根据遮罩图片的形状，裁剪原图，并生成新的图片
+ (UIImage *)creatImageWithMaskImage:(UIImage *)MaskImage andBackimage:(UIImage *)Backimage{
    
    CGRect rect;
    
    if (Backimage.size.height>Backimage.size.width) {
        rect     = CGRectMake(0,
                              (Backimage.size.height-Backimage.size.width)/2,
                              Backimage.size.width,
                              Backimage.size.width);
    }else{
        rect     = CGRectMake((Backimage.size.width-Backimage.size.height)/2,
                              0,
                              Backimage.size.height,
                              Backimage.size.height);
    }
    
    
    NSLog(@"%f",(Backimage.size.height-Backimage.size.height)/2);
    UIImage *cutIMG = [UIImage imageWithCGImage:CGImageCreateWithImageInRect([Backimage CGImage], rect)];
    
    //遮罩图
    CGImageRef maskImage = MaskImage.CGImage;
    //原图
    CGImageRef originImage = cutIMG.CGImage;
    
    
    CGContextRef mainViewContentContext;
    CGColorSpaceRef colorSpace;
    
    colorSpace = CGColorSpaceCreateDeviceRGB();
    // create a bitmap graphics context the size of the image
    
    mainViewContentContext = CGBitmapContextCreate (NULL,
                                                    rect.size.width,
                                                    rect.size.height,
                                                    8,
                                                    0,
                                                    colorSpace,
                                                    kCGImageAlphaPremultipliedLast);
    // free the rgb colorspace
    CGColorSpaceRelease(colorSpace);
    if (mainViewContentContext==NULL)
    {
        NSLog(@"error");
    }
    
    CGContextClipToMask(mainViewContentContext,
                        CGRectMake(0,
                                   0,
                                   rect.size.width,
                                   rect.size.height),
                        maskImage);
    
    CGContextDrawImage(mainViewContentContext,
                       CGRectMake(0,
                                  0,
                                  rect.size.width,
                                  rect.size.height),
                       originImage);
    
    // Create CGImageRef of the main view bitmap content, and then
    // release that bitmap context
    CGImageRef mainViewContentBitmapContext = CGBitmapContextCreateImage(mainViewContentContext);
    CGContextRelease(mainViewContentContext);
    // convert the finished resized image to a UIImage
    UIImage *theImage = [UIImage imageWithCGImage:mainViewContentBitmapContext];
    // image is retained by the property setting above, so we can
    // release the original
    CGImageRelease(mainViewContentBitmapContext);
    
    
    
    
    return theImage;
    
}

//缩略图
//若Scale为YES，则原图会根据Size进行拉伸-会变形
//若Scale为NO，则原图会根据Size进行填充-不会变形
+ (UIImage *)getThumbImageWithImage:(UIImage *)image andSize:(CGSize)Size Scale:(BOOL)Scale{
    
    UIGraphicsBeginImageContextWithOptions(Size, NO, 0.0);
    
    CGRect rect = CGRectMake(0,
                             0,
                             Size.width,
                             Size.height);
    if (!Scale) {
        
        CGFloat bili_imageWH = image.size.width/image.size.height;
        CGFloat bili_SizeWH  = Size.width/Size.height;
        
        if (bili_imageWH > bili_SizeWH) {
            
            CGFloat bili_SizeH_imageH = Size.height/image.size.height;
            
            CGFloat height = image.size.height*bili_SizeH_imageH;
            
            CGFloat width = height * bili_imageWH;
            
            CGFloat x = -(width - Size.width)/2;
            
            CGFloat y = 0;
            
            rect = CGRectMake(x,
                              y,
                              width,
                              height);
            
        }else{
            
            CGFloat bili_SizeW_imageW = Size.width/image.size.width;
            
            CGFloat width = image.size.width * bili_SizeW_imageW;
            
            CGFloat height = width / bili_imageWH;
            
            CGFloat x = 0;
            
            CGFloat y = -(height - Size.height)/2;
            
            rect = CGRectMake(x,
                              y,
                              width,
                              height);
            
        }
    }
    
    [[UIColor clearColor] set];
    UIRectFill(rect);
    
    [image drawInRect:rect];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

//ShadowOffset:横纵方向的偏移
//BlurWidth   :边缘模糊宽度
//Alpha       :透明度
//Color       :阴影颜色
+ (UIImage *)creatShadowImageWithOriginalImage:(UIImage *)image
                              andShadowOffset:(CGSize)offset
                                 andBlurWidth:(CGFloat)blurWidth
                                     andAlpha:(CGFloat)Alpha
                                     andColor:(UIColor *)Color
{
    CGFloat Scale = 2;
    
    CGFloat width  = (image.size.width+offset.width+blurWidth*4)*Scale;
    CGFloat height = (image.size.height+offset.height+blurWidth*4)*Scale;
    
    UIView *RootBackView = [[UIView alloc]initWithFrame:CGRectMake(0,0,
                                                                   width,
                                                                   height)];
    RootBackView.backgroundColor = [UIColor clearColor];
    
    UIImageView *ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(blurWidth*2*Scale,
                                                                          blurWidth*2*Scale,
                                                                          image.size.width*Scale,
                                                                          image.size.height*Scale)];
    ImageView.backgroundColor = [UIColor clearColor];
    ImageView.layer.shadowOffset = CGSizeMake(offset.width*Scale, offset.height*Scale);
    ImageView.layer.shadowRadius = blurWidth*Scale;
    ImageView.layer.shadowOpacity = Alpha;
    ImageView.layer.shadowColor  = Color.CGColor;
    ImageView.image = image;
    
    [RootBackView addSubview:ImageView];
    
    //ImageView.transform = CGAffineTransformMakeRotation(3.1415926*0.25);
    //ImageView.transform = CGAffineTransformMakeScale(2, 2);
    
    UIImage *newImage = [self imageWithUIView:RootBackView];
    
    return newImage;
}

//Angle:角度（0~360）
+ (UIImage  *)GetRotationImageWithImage:(UIImage *)image
                                 Angle:(CGFloat)Angle
{
    
    UIView *RootBackView = [[UIView alloc] initWithFrame:CGRectMake(0,0,
                                                                    image.size.width,
                                                                    image.size.height)];
    CGAffineTransform t = CGAffineTransformMakeRotation( Angle* M_PI / 180);
    RootBackView.transform = t;
    CGSize rotatedSize = RootBackView.frame.size;
    
    
    UIGraphicsBeginImageContext(rotatedSize);
    
    
    CGContextRef theContext = UIGraphicsGetCurrentContext();
    
    
    CGContextTranslateCTM(theContext, rotatedSize.width/2, rotatedSize.height/2);
    CGContextRotateCTM(theContext, Angle * M_PI / 180);
    CGContextScaleCTM(theContext, 1.0, -1.0);
    
    
    
    CGContextDrawImage(theContext,
                       CGRectMake(-image.size.width / 2,
                                  -image.size.height / 2,
                                  image.size.width,
                                  image.size.height),
                       [image CGImage]);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}


//参数：原图、坐标、大小、背景色
//若裁剪范围超出原图尺寸，则会用背景色填充缺失部位
+ (UIImage *)cutImageWithImage:(UIImage *)image
                      atPoint:(CGPoint)Point
                     withSize:(CGSize)Size
              backgroundColor:(UIColor *)backColor
{
    UIGraphicsBeginImageContextWithOptions(Size, NO, 0.0);
    
    CGRect bounds = CGRectMake(0,
                               0,
                               Size.width,
                               Size.height);
    
    CGRect rect   = CGRectMake(-Point.x,
                               -Point.y,
                               image.size.width,
                               image.size.height);
    
    
    [backColor set];
    UIRectFill(bounds);
    
    [image drawInRect:rect];
    
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

//把继承与UIView的子类控件 转换为UIImage
+ (UIImage *)imageWithUIView:(UIView *)view
{
    //UIGraphicsBeginImageContext(view.bounds.size);
    UIGraphicsBeginImageContext(CGSizeMake(view.bounds.size.width, view.bounds.size.height));
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [view.layer renderInContext:ctx];
    
    UIImage* tImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return tImage;
}

/**
 *  压缩图片到指定文件大小
 */
+ (NSData *)compressOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)size{
    NSData * data = UIImageJPEGRepresentation(image, 1.0);
    CGFloat dataKBytes = data.length/1000.0;
    CGFloat maxQuality = 0.9f;
    CGFloat lastData = dataKBytes;
    while (dataKBytes > size && maxQuality > 0.01f) {
        maxQuality = maxQuality - 0.01f;
        data = UIImageJPEGRepresentation(image, maxQuality);
        dataKBytes = data.length / 1000.0;
        if (lastData == dataKBytes) {
            break;
        }else{
            lastData = dataKBytes;
        }
    }
    return data;
}

/**
 *  压缩图片到指定尺寸大小
 */
+ (UIImage *)compressOriginalImage:(UIImage *)image toSize:(CGSize)size{
    UIImage * resultImage = image;
    UIGraphicsBeginImageContext(size);
    [resultImage drawInRect:CGRectMake(00, 0, size.width, size.height)];
    UIGraphicsEndImageContext();
    return image;
}




// 截取一张 view 生成图片
+ (UIImage *)shotWithView:(UIView *)view{
    
    CGSize size = CGSizeMake(view.bounds.size.width * [UIScreen mainScreen].scale, view.bounds.size.height * [UIScreen mainScreen].scale);
    UIGraphicsBeginImageContext(size);
    
    //UIGraphicsBeginImageContext(view.bounds.size);///666
    
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/**
 *  截取view中某个区域生成一张图片(先截取View)
 */
+ (UIImage *)shotWithView:(UIView *)view scope:(CGRect)scope{
    CGImageRef imageRef = CGImageCreateWithImageInRect([self shotWithView:view].CGImage, scope);
    UIGraphicsBeginImageContext(scope.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, scope.size.width, scope.size.height);
    CGContextTranslateCTM(context, 0, rect.size.height);//  下移
    CGContextScaleCTM(context, 1.0f, -1.0f);
    CGContextDrawImage(context, rect, imageRef);
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGContextRelease(context);
    return image;
}

/**
 *  创建一张实时模糊效果 View (毛玻璃效果)
 */
+ (UIVisualEffectView *)effectViewWithFrame:(CGRect)frame{
    UIBlurEffect * effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView * effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = frame;
    return effectView;
}

/**
 *  对图片进行滤镜处理
 */
+ (UIImage *)filerWithOriginalImage:(UIImage *)image fileterName:(NSString *)name{
    CIContext * context = [CIContext contextWithOptions:nil];
    CIImage * inputImage = [[CIImage alloc] initWithImage:image];
    CIFilter * filter = [CIFilter filterWithName:name];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    CIImage * result = [filter valueForKey:kCIOutputImageKey];
    CGImageRef cgImage = [context createCGImage:result fromRect:[result extent]];
    UIImage * resultImage = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    return resultImage;
}

/**
 *  调整图片饱和度、亮度、对比度
 */
+ (UIImage *)colorControlsWithOriginalImage:(UIImage *)image saturation:(CGFloat)saturation brightness:(CGFloat)brightness contrast:(CGFloat)contrast{
    CIContext * context = [CIContext contextWithOptions:nil];
    CIImage * inputImage = [[CIImage alloc] initWithImage:image];
    CIFilter * filter = [CIFilter filterWithName:@"CIColorControls"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    
    [filter setValue:@(saturation) forKey:@"inputSaturation"];
    [filter setValue:@(brightness) forKey:@"inputBrightness"];
    [filter setValue:@(contrast) forKey:@"inputContrast"];
    
    CIImage * result = [filter valueForKey:kCIOutputImageKey];
    CGImageRef cgImage = [context createCGImage:result fromRect:[result extent]];
    UIImage * resultImage = [UIImage imageWithCGImage:cgImage];;
    CGImageRelease(cgImage);
    return resultImage;
}







//指定宽度按比例缩放
+ (UIImage *)imageCompressForWidthScale:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth
{
    
    
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = defineWidth;
    CGFloat targetHeight = height / (width / targetWidth);
    CGSize size = CGSizeMake(targetWidth, targetHeight);
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
    
    if(CGSizeEqualToSize(imageSize, size) == NO){
        
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if(widthFactor > heightFactor){
            scaleFactor = widthFactor;
        }
        else{
            scaleFactor = heightFactor;
        }
        scaledWidth = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        if(widthFactor > heightFactor){
            
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
            
        }else if(widthFactor < heightFactor){
            
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    
    UIGraphicsBeginImageContext(size);
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    if(newImage == nil){
        
        NSLog(@"scale image fail");
    }
    UIGraphicsEndImageContext();  
    return newImage;
    
}











//////////////////////////diy 头像处理

#pragma mark ------------------------------ 头像处理 公共方法
+ (UIImage *)imageToTransparent222:(UIImage *)image

{
    
    // 分配内存
    
    const int imageWidth = image.size.width;
    
    const int imageHeight = image.size.height;
    
    size_t bytesPerRow = imageWidth * 4;
    
    uint32_t* rgbImageBuf = (uint32_t*)malloc(bytesPerRow * imageHeight);
    
    
    
    // 创建context
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGContextRef context = CGBitmapContextCreate(rgbImageBuf, imageWidth, imageHeight, 8, bytesPerRow, colorSpace,
                                                 
                                                 kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipLast);
    
    CGContextDrawImage(context, CGRectMake(0, 0, imageWidth, imageHeight), image.CGImage);
    
    
    
    // 遍历像素
    
    int pixelNum = imageWidth * imageHeight;
    
    uint32_t* pCurPtr = rgbImageBuf;
    
    for (int i = 0; i < pixelNum; i++, pCurPtr++)
        
    {
        
        //将像素点转成子节数组来表示---第一个表示透明度即ARGB这种表示方式。ptr[0]:透明度,ptr[1]:R,ptr[2]:G,ptr[3]:B
        
        //分别取出RGB值后。进行判断需不需要设成透明。
        
        uint8_t* ptr = (uint8_t *)pCurPtr;
        
        //        if (ptr[1] > 200 && ptr[2] > 200 && ptr[3] > 200) {
        //
        //            ptr[1] = 0 ;
        //            ptr[2] = 0 ;
        //            ptr[3] = 0 ;//透明
        //
        //
        //
        //        }else if (ptr[1] == 235 && ptr[2] == 192 && ptr[3] == 175) {
        //
        //            ptr[1] = 0 ;
        //            ptr[2] = 0 ;
        //            ptr[3] = 0 ;
        //
        //        }else {
        //
        //        }
        
        
        
        
//            if (ptr[1] > COLORR || ptr[2] > COLORG || ptr[3] > COLORB) {
//    
//                ptr[1] = 0 ;
//                ptr[2] = 0 ;
//                ptr[3] = 0 ;
//    
//    
//            }else {
//    
//            }
        
        
        if (ptr[1] > COLORR || ptr[2] > COLORG || ptr[3] > 210) {
            
            ptr[1] = 0 ;
            ptr[2] = 0 ;
            ptr[3] = 0 ;
            
            
        }else {
            
        }
        
        
        
        
        
    }
    
    // 将内存转成image
    
    CGDataProviderRef dataProvider =CGDataProviderCreateWithData(NULL, rgbImageBuf, bytesPerRow * imageHeight, nil);
    
    
    
    CGImageRef imageRef = CGImageCreate(imageWidth, imageHeight,8, 32, bytesPerRow, colorSpace,
                                        
                                        kCGImageAlphaLast |kCGBitmapByteOrder32Little, dataProvider,
                                        
                                        NULL, true,kCGRenderingIntentDefault);
    
    CGDataProviderRelease(dataProvider);
    
    UIImage* resultUIImage = [UIImage imageWithCGImage:imageRef];
    
    // 释放
    
    CGImageRelease(imageRef);
    
    CGContextRelease(context);
    
    CGColorSpaceRelease(colorSpace);
    
    return resultUIImage;
    
}


+ (UIImage *)imageBlackToTransparent222:(UIImage *)image
{
    // 分配内存
    const int imageWidth = image.size.width;
    const int imageHeight = image.size.height;
    size_t      bytesPerRow = imageWidth * 4;
    uint32_t* rgbImageBuf = (uint32_t*)malloc(bytesPerRow * imageHeight);
    
    // 创建context
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(rgbImageBuf, imageWidth, imageHeight, 8, bytesPerRow, colorSpace,kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipLast);
    CGContextDrawImage(context, CGRectMake(0, 0, imageWidth, imageHeight), image.CGImage);
    
    // 遍历像素
    int pixelNum = imageWidth * imageHeight;
    uint32_t* pCurPtr = rgbImageBuf;
    
    for (int i = 0; i < pixelNum; i++, pCurPtr++)
    {
        if ((*pCurPtr & 0xFFFFFF00) == 0)    // 将黑色变成透明
        {
            uint8_t* ptr = (uint8_t*)pCurPtr;
            
            ptr[0] = 0;
            ptr[1] = 0;
            ptr[2] = 0;
            ptr[3] = 0;
        }
        
        
    }
    
    // 将内存转成image
    CGDataProviderRef dataProvider = CGDataProviderCreateWithData(NULL, rgbImageBuf, bytesPerRow * imageHeight,ProviderReleaseData);
    CGImageRef imageRef = CGImageCreate(imageWidth, imageHeight, 8, 32, bytesPerRow, colorSpace,kCGImageAlphaLast | kCGBitmapByteOrder32Little, dataProvider,NULL, true, kCGRenderingIntentDefault);
    
    CGDataProviderRelease(dataProvider);
    
    UIImage* resultUIImage = [UIImage imageWithCGImage:imageRef];
    
    // 释放
    CGImageRelease(imageRef);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    
    // free(rgbImageBuf) 创建dataProvider时已提供释放函数，这里不用free
    return resultUIImage;
}

/** 颜色变化 */
void ProviderReleaseData (void *info, const void *data, size_t size)
{
    free((void*)data);
}






+ (UIImage *)imageTranslateToSuMiao:(UIImage *)oriImage
{
    
    GPUImagePicture *pic = [[GPUImagePicture alloc] initWithImage:oriImage];
    
    GPUImageBeautifyFilter *beautifyFilter = [[GPUImageBeautifyFilter alloc] init];
    
    [beautifyFilter forceProcessingAtSize:oriImage.size];
    
    [pic addTarget:beautifyFilter];
    
    [pic processImage];
    
    [beautifyFilter useNextFrameForImageCapture];
    
    UIImage *lsttImgg = [beautifyFilter imageFromCurrentFramebuffer];
    
    
    
    CIImage * inputImage = [[CIImage alloc] initWithImage:lsttImgg];
    CIContext * context = [CIContext contextWithOptions:nil];
    
    ZRSketchFilter * filter = [ZRSketchFilter new];
    filter.inputImage = inputImage;
    
    CGImageRef cgImage = [context createCGImage:filter.outputImage fromRect:[inputImage extent]];
    
    UIImage *outImgr = [UIImage imageWithCGImage:cgImage];
    
    
    UIImage *lsttImmg = [ImageUtil imageWithImage:outImgr withColorMatrix:colormatrix_jiuhong];
    
    
    //加个锐化
    //UIImage *lsttImmg22 = [ImageUtil imageWithImage:lsttImmg withColorMatrix:colormatrix_ruise];
    
    
    
    return lsttImmg;
}



@end
















