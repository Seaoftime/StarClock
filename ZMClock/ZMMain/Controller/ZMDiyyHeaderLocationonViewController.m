//
//  ZMDiyyHeaderLocationonViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/10/15.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMDiyyHeaderLocationonViewController.h"

#import "ZMDIYCartoonnSecondDIYYViewController.h"
#import "ZMCarrtomDIYYViewController.h"
#import "ZRRImageTool.h"


@interface ZMDiyyHeaderLocationonViewController ()
{
    UIImageView * _inputImgView;
    
    UIImage     * _inputImg;
    
    
    CGFloat _leftEyex;
    
    CGFloat _leftEyey;
    
    
    CGFloat _rightEyex;
    
    CGFloat _rightEyey;
    
    
    CGFloat _moux;
    
    CGFloat _mouy;
    
    
    CGFloat _2eyesLength;///两眼之间的距离
    
    




}

@property (nonatomic, strong) UIButton *fanhuiBtn;
@property (nonatomic, strong) UIView *headdV;

@property (nonatomic, strong) UILabel *uploadToLb;


@property (nonatomic, strong) UIImageView *photoImgV;

@property (nonatomic, strong) UIImageView *boyyImgV;
@property (nonatomic, strong) UIImageView *girllImgV;

@property (nonatomic, strong) UIImage *headImmgPhoto;

@property (nonatomic, strong) UIImage *headImmgCameme;


@end

@implementation ZMDiyyHeaderLocationonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    self.title = @"上传照片";
    
    self.baseNavigation.hidden = YES;
    
    self.view.backgroundColor = RGB(242, 237, 238);
    

    
    [self setuppUI];
    
    
}


- (void)setuppUI
{
    
    
    self.headdV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 70)];
    self.headdV.backgroundColor = RGB(236, 128, 172);
    
    [self.view addSubview:self.headdV];
    
////////////////////////////
    self.titleeLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, kScreen_Width, 40)];
    self.titleeLb.font = [UIFont systemFontOfSize:22];
    self.titleeLb.textColor = [UIColor whiteColor];
    self.titleeLb.text = @"上传照片";
    self.titleeLb.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:self.titleeLb];

    
////////////////////////////
    
    self.fanhuiBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 5 , 50, 50)];
    self.fanhuiBtn.backgroundColor = [UIColor clearColor];
    [self.fanhuiBtn setImage:IMAGE(@"返回按键") forState:UIControlStateNormal] ;
    
    
    [self.fanhuiBtn addTarget:self action:@selector(fanhuiBtnnnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.headdV addSubview:self.fanhuiBtn];
    

    
////////////////////////////
    
    self.photoImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 65, kScreen_Width , kScreen_Height - 200)];
    
    self.photoImgV.userInteractionEnabled = YES;
    self.photoImgV.backgroundColor = [UIColor orangeColor];
    
    
    self.photoImgV.contentMode = UIViewContentModeScaleAspectFill;
    
    self.photoImgV.clipsToBounds = YES;
    
    
    
    [self.view addSubview:self.photoImgV];

////////////////////////////
    
    self.uploadToLb = [[UILabel alloc] initWithFrame:CGRectMake(12, 65 + kScreen_Height - 250 + 10 + 40, kScreen_Width - 12, 40)];
    self.uploadToLb.font = [UIFont systemFontOfSize:20];
    self.uploadToLb.textColor = [UIColor blackColor];
    self.uploadToLb.text = @"上传至:";
    self.uploadToLb.textAlignment = NSTextAlignmentLeft;
    
    [self.view addSubview:self.uploadToLb];
    
    
    
////////////////////////////    
    NSString *choose = [NSUserDefaults standardUserDefaults].photo_From;
    
    
    if ([choose isEqualToString:@"photoss"]) {
        
        NSString *imgStr = [APPTransmit shareInstance].imgStrr2;
        if (imgStr == nil || imgStr == NULL || [imgStr isKindOfClass:[NSNull class]]) {
            
            
        }else {
            
            
            NSData *decodeImgData = [[NSData alloc] initWithBase64EncodedString:imgStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
            self.headImmgPhoto = [UIImage imageWithData:decodeImgData];
            
            
            self.photoImgV.image = self.headImmgPhoto;
            
            
        }


    }else {
    
        NSString *imgStr = [APPTransmit shareInstance].imgStrr;
        if (imgStr == nil || imgStr == NULL || [imgStr isKindOfClass:[NSNull class]]) {
            
            
        }else {
            
            
            NSData *decodeImgData = [[NSData alloc] initWithBase64EncodedString:imgStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
            self.headImmgCameme = [UIImage imageWithData:decodeImgData];
            
            
            self.photoImgV.image = self.headImmgCameme;
            
            
        }


        
    }
    
    

#pragma mark -----------------------上传至男生按钮
    
    if ([ZMSystemTool iPhone5Device]) {
        self.boyyImgV = [[UIImageView alloc] initWithFrame:CGRectMake(40, kScreen_Height - 150 + 25, 100 , 100 )];
        
    } else {
        self.boyyImgV = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width/2 - 45 - 90, kScreen_Height - 150 + 10 + 40, 90 , 90 )];
    }
    
    //self.boyyImgV.backgroundColor = [UIColor redColor];
    self.boyyImgV.image = IMAGE(@"上传照片圆框up");
    self.boyyImgV.userInteractionEnabled = YES;
    
    [self.view addSubview:self.boyyImgV];
    
    
    UITapGestureRecognizer *boytap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(boyyImgVvTaped)];
    [self.boyyImgV addGestureRecognizer:boytap];
    
    
    
#pragma mark -----------------------上传至女生按钮
    
    if ([ZMSystemTool iPhone5Device]) {
        
        self.girllImgV = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width - 140 , kScreen_Height - 150 + 25, 100 ,  100 )];
        
    } else {
        self.girllImgV = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width/2 + 45, kScreen_Height - 150 + 10 + 40, 90 ,  90 )];
    }
    
    
    self.girllImgV.image = IMAGE(@"上传照片圆框up");
    self.girllImgV.userInteractionEnabled = YES;
    
    [self.view addSubview:self.girllImgV];
    
    UITapGestureRecognizer *girltap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(girllImgVvTaped)];
    [self.girllImgV addGestureRecognizer:girltap];
    
    
    


}



- (void)fanhuiBtnnnClicked
{
    
    //[self dismissViewControllerAnimated:YES completion:nil];
    
    [self.navigationController popViewControllerAnimated:YES];
}





#pragma mark --------------------------上传至 男生头像
- (void)boyyImgVvTaped
{

    UIImage *girl_img = [[IFlyFaceHelper sharedFaceHelper] startFaceDetectorWithImage:self.photoImgV.image];
    
    
    
    _inputImg = girl_img;
    
    
    _inputImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, kScreen_Height, _inputImg.size.width,_inputImg.size.height)];
    
    
    [_inputImgView setImage:_inputImg];
    
    [self.view addSubview:_inputImgView];
    
    //NSLog(@"原始图片大小   x: %.f  y: %.f",_inputImg.size.width,_inputImg.size.height);//
    
    
    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        //
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            //主线程
//            
//            [self recognitionFaces];
//            
//        });
//        
//        
//        
//    });
    
    
    
    [self recognitionFaces];
    
    
    [self headporitImageAgainCuttChooseBooyy];
    

    
    
    

    [AnyObjectActivityView showWithTitle:@"头像处理中..." wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
    

    
//返回
    //ZMDIYCartoonnSecondDIYYViewController *diysecond = [ZMDIYCartoonnSecondDIYYViewController sharedZMDIYCartoonnSecondDIYYViewController];
    //[self.navigationController popToViewController:diysecond animated:YES];
    
    ZMCarrtomDIYYViewController *cartoon = [ZMCarrtomDIYYViewController sharedZMCarrtomDIYYViewController];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //
        [self.navigationController popToViewController:cartoon animated:YES];

    });

    
    
    

}

#pragma mark --------------------------上传至 女生头像
- (void)girllImgVvTaped
{
    //[AnyObjectActivityView showWithTitle:@"头像处理中..." wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
    
    
    
    UIImage *girl_img = [[IFlyFaceHelper sharedFaceHelper] startFaceDetectorWithImage:self.photoImgV.image];
    
    
    
    _inputImg = girl_img;
    
    
    _inputImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, kScreen_Height, _inputImg.size.width,_inputImg.size.height)];
    
    
    [_inputImgView setImage:_inputImg];
    
    [self.view addSubview:_inputImgView];
    
    NSLog(@"原始图片大小   x: %.f  y: %.f",_inputImg.size.width,_inputImg.size.height);//
    
    
    
    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        //
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            //主线程
//            
//            [self recognitionFaces];
//
//            
//        });
//        
//        
//        [self headporitImageAgainCuttChooseGirll];
//
//        
//    });
    
    
    
    
    [self recognitionFaces];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //
        [self headporitImageAgainCuttChooseGirll];
        
    });
    
    
    
    [AnyObjectActivityView showWithTitle:@"头像处理中..." wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
    

//返回
    //ZMDIYCartoonnSecondDIYYViewController *diysecond = [ZMDIYCartoonnSecondDIYYViewController sharedZMDIYCartoonnSecondDIYYViewController];
    //[self.navigationController popToViewController:diysecond animated:YES];
    
    
    ZMCarrtomDIYYViewController *cartoon = [ZMCarrtomDIYYViewController sharedZMCarrtomDIYYViewController];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //
        [self.navigationController popToViewController:cartoon animated:YES];
    });
    
    
    
    
}


#pragma mark --------------------------人脸识别代码
/**
 *  人脸识别综合示例代码（包括人脸图片提取、人脸个数、人脸定位）
 */
- (void)recognitionFaces
{
    
    
    
    CIContext * context = [CIContext contextWithOptions:nil];
    
    UIImage * imageInput = [_inputImgView image];
    
    CIImage * image = [CIImage imageWithCGImage:imageInput.CGImage];
    
    
    NSDictionary * param = [NSDictionary dictionaryWithObject:CIDetectorAccuracyHigh forKey:CIDetectorAccuracy];
    CIDetector * faceDetector = [CIDetector detectorOfType:CIDetectorTypeFace context:context options:param];
    
    
    NSArray * detectResult = [faceDetector featuresInImage:image];
    
    
    //NSLog(@"detectResult__%@",detectResult);
    
    
    
    UIView * resultView = [[UIView alloc] initWithFrame:_inputImgView.frame];
    
    
    [self.view addSubview:resultView];
    
    
    
    for (CIFaceFeature * faceFeature in detectResult) {
        
        UIView *faceView = [[UIView alloc] initWithFrame:faceFeature.bounds];
        faceView.layer.borderColor = [UIColor redColor].CGColor;
        faceView.layer.borderWidth = 1;
        [resultView addSubview:faceView];
        
        
        if (faceFeature.hasLeftEyePosition) {
            
            UIView * leftEyeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
            [leftEyeView setCenter:faceFeature.leftEyePosition];
            leftEyeView.layer.borderWidth = 1;
            leftEyeView.layer.borderColor = [UIColor redColor].CGColor;
            [resultView addSubview:leftEyeView];
            
            
            
            //NSLog(@"左眼中心点   x:: %.f  y:: %.f",faceFeature.leftEyePosition.x, _inputImg.size.height - faceFeature.leftEyePosition.y);
            
            _leftEyex = faceFeature.leftEyePosition.x;
            _leftEyey = _inputImg.size.height - faceFeature.leftEyePosition.y;
            
            
        }
        
        
        if (faceFeature.hasRightEyePosition) {
            
            UIView * rightEyeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
            [rightEyeView setCenter:faceFeature.rightEyePosition];
            rightEyeView.layer.borderWidth = 1;
            rightEyeView.layer.borderColor = [UIColor redColor].CGColor;
            [resultView addSubview:rightEyeView];
            
            
            //NSLog(@"右眼中心点   x:: %.f  y:: %.f",faceFeature.rightEyePosition.x, _inputImg.size.height - faceFeature.rightEyePosition.y);
            
            
            _rightEyex = faceFeature.rightEyePosition.x;
            _rightEyey = _inputImg.size.height - faceFeature.rightEyePosition.y;
            
            
            
        }
        
        if (faceFeature.hasMouthPosition) {
            
            UIView * mouthView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 5)];
            [mouthView setCenter:faceFeature.mouthPosition];
            mouthView.layer.borderWidth = 1;
            mouthView.layer.borderColor = [UIColor redColor].CGColor;
            [resultView addSubview:mouthView];
            
            
            
            //NSLog(@"嘴中心点   x:: %.f  y:: %.f",faceFeature.mouthPosition.x, _inputImg.size.height - faceFeature.mouthPosition.y);
            
            
            _moux = faceFeature.mouthPosition.x;
            _mouy = _inputImg.size.height - faceFeature.mouthPosition.y;
            
            
        }
        
        
    }
    
    [resultView setTransform:CGAffineTransformMakeScale(1, -1)];
    //
    
    
    NSLog(@"人脸识别: 两眼 中心点之间的距离: %.f",_rightEyex - _leftEyex);
    
    
    _2eyesLength = _rightEyex - _leftEyex;
    
    
    
    
}



- (void)headporitImageAgainCuttChooseGirll
{
    
    NSLog(@"女生: 两眼 中心点之间的距离: %.f",_2eyesLength);
    
    
    NSString *eyeslengthStr = [NSString stringWithFormat:@"%.f",_2eyesLength];
    
    
    if (_2eyesLength >= 300) {
        
        UIImage *cuttImg300 = [_inputImg imageAtRect:CGRectMake(_leftEyex - 120 , _leftEyey - 160 , (_rightEyex - _leftEyex) + (2 * 120) , (_mouy - _leftEyey) + 160 + 150)];
        
        
        NSData *imgData = UIImageJPEGRepresentation(cuttImg300, .2f);
        NSString *cuttStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        [NSUserDefaults standardUserDefaults].faceDetectorImageStr2 = cuttStr;
        
        
        
    }
    
    
    if (_2eyesLength >= 270 && _2eyesLength < 300) {
        //
        UIImage *cuttImg210 = [_inputImg imageAtRect:CGRectMake(_leftEyex - 100 , _leftEyey - 140 + 5, (_rightEyex - _leftEyex) + (2 * 100) , (_mouy - _leftEyey) + 140 + 130)];
        
        
        NSData *imgData = UIImageJPEGRepresentation(cuttImg210, .2f);
        NSString *cuttStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        
        [NSUserDefaults standardUserDefaults].faceDetectorImageStr2 = cuttStr;
        
        
    }
    
    
    
    if (_2eyesLength >= 266 && _2eyesLength < 270) {
        //
        UIImage *cuttImg210 = [_inputImg imageAtRect:CGRectMake(_leftEyex - 100 , _leftEyey - 140 + 10, (_rightEyex - _leftEyex) + (2 * 100) -2, (_mouy - _leftEyey) + 140 + 90)];
        
        
        NSData *imgData = UIImageJPEGRepresentation(cuttImg210, .2f);
        NSString *cuttStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        
        [NSUserDefaults standardUserDefaults].faceDetectorImageStr2 = cuttStr;
        
    }

    
    
    
    if (_2eyesLength >= 240 && _2eyesLength < 266) {
        //
        UIImage *cuttImg210 = [_inputImg imageAtRect:CGRectMake(_leftEyex - 100 + 3, _leftEyey - 140 + 5, (_rightEyex - _leftEyex) + (2 * 100) , (_mouy - _leftEyey) + 140 + 90)];
        
        
        NSData *imgData = UIImageJPEGRepresentation(cuttImg210, .2f);
        NSString *cuttStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        
        [NSUserDefaults standardUserDefaults].faceDetectorImageStr2 = cuttStr;
        
    }
    
    
    
    
    
    
    
    
    if (_2eyesLength >= 230 && _2eyesLength < 240) {
        //
        UIImage *cuttImg210 = [_inputImg imageAtRect:CGRectMake(_leftEyex - 100 , _leftEyey - 140 + 5, (_rightEyex - _leftEyex) + (2 * 100) , (_mouy - _leftEyey) + 140 + 110)];
        
        
        NSData *imgData = UIImageJPEGRepresentation(cuttImg210, .2f);
        NSString *cuttStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        
        [NSUserDefaults standardUserDefaults].faceDetectorImageStr2 = cuttStr;
        
    }
    
    
    
    
    if (_2eyesLength >= 226 && _2eyesLength < 230) {
        //
        UIImage *cuttImg210 = [_inputImg imageAtRect:CGRectMake(_leftEyex - 100 + 2, _leftEyey - 140 + 5 - 4, (_rightEyex - _leftEyex) + (2 * 100) , (_mouy - _leftEyey) + 140 + 75)];
        
        
        NSData *imgData = UIImageJPEGRepresentation(cuttImg210, .2f);
        NSString *cuttStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        
        [NSUserDefaults standardUserDefaults].faceDetectorImageStr2 = cuttStr;
        
    }

    
    
    
    
    
    
    
    
    
    if (_2eyesLength >= 210 && _2eyesLength < 226) {
        //
        UIImage *cuttImg210 = [_inputImg imageAtRect:CGRectMake(_leftEyex - 100 + 10, _leftEyey - 140 + 5, (_rightEyex - _leftEyex) + (2 * 100) , (_mouy - _leftEyey) + 140 + 90)];
        
        
        NSData *imgData = UIImageJPEGRepresentation(cuttImg210, .2f);
        NSString *cuttStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        
        [NSUserDefaults standardUserDefaults].faceDetectorImageStr2 = cuttStr;
        
    }

    
    
    
    
    
    if (_2eyesLength >= 130 && _2eyesLength < 210) {
        //
        UIImage *cuttImg100 = [_inputImg imageAtRect:CGRectMake(_leftEyex - 70 + 5, _leftEyey - 100 - 5, (_rightEyex - _leftEyex) + (2 * 70) , (_mouy - _leftEyey) + 100 + 40)];
        
        
        NSData *imgData = UIImageJPEGRepresentation(cuttImg100, .2f);
        NSString *cuttStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        
        [NSUserDefaults standardUserDefaults].faceDetectorImageStr2 = cuttStr;
        
    }

    
    
    
    
    
    if (_2eyesLength >= 100 && _2eyesLength < 130) {
        //
        UIImage *cuttImg100 = [_inputImg imageAtRect:CGRectMake(_leftEyex - 70 , _leftEyey - 100 , (_rightEyex - _leftEyex) + (2 * 70) , (_mouy - _leftEyey) + 100 + 70)];
        
        
        NSData *imgData = UIImageJPEGRepresentation(cuttImg100, .2f);
        NSString *cuttStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        
        [NSUserDefaults standardUserDefaults].faceDetectorImageStr2 = cuttStr;
        
    }
    
    
    
    
    
//    if (_2eyesLength >= 50 && _2eyesLength < 100) {
//        //
//        UIImage *cuttImg100 = [_inputImg imageAtRect:CGRectMake(_leftEyex  , _leftEyey  , (_rightEyex - _leftEyex)  , (_mouy - _leftEyey) )];
//        
//        
//        NSData *imgData = UIImageJPEGRepresentation(cuttImg100, .2f);
//        NSString *cuttStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
//        
//        
//        [NSUserDefaults standardUserDefaults].faceDetectorImageStr2 = cuttStr;
//        
//    }
    
    
    
    
    
    
    
    if (_2eyesLength < 100 || [eyeslengthStr isEqualToString:@"0"]) {
        //
        UIImage *cut_img = [[IFlyFaceHelper sharedFaceHelper] startFaceDetectorImagecutttzerozeroGirll:_inputImg];
        
        
        NSData *imgData = UIImageJPEGRepresentation(cut_img, .2f);
        NSString *cuttStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        
        [NSUserDefaults standardUserDefaults].faceDetectorImageStr2 = cuttStr;
        
        
    }
    
    
    
    
    
    
}


- (void)headporitImageAgainCuttChooseBooyy
{
    
    NSLog(@"男生: 两眼 中心点之间的距离: %.f",_2eyesLength);
    
    
    NSString *eyeslengthStr = [NSString stringWithFormat:@"%.f",_2eyesLength];
    
    
    if (_2eyesLength >= 300) {
        
        UIImage *cuttImg300 = [_inputImg imageAtRect:CGRectMake(_leftEyex - 120 , _leftEyey - 160 , (_rightEyex - _leftEyex) + (2 * 120) , (_mouy - _leftEyey) + 160 + 150)];
        
        
        NSData *imgData = UIImageJPEGRepresentation(cuttImg300, .2f);
        NSString *cuttStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        [NSUserDefaults standardUserDefaults].faceDetectorImageStr = cuttStr;
        
        
        
    }
    
    
    if (_2eyesLength >= 230 && _2eyesLength < 300) {
        //
        UIImage *cuttImg210 = [_inputImg imageAtRect:CGRectMake(_leftEyex - 100 , _leftEyey - 140 , (_rightEyex - _leftEyex) + (2 * 100) , (_mouy - _leftEyey) + 140 + 130)];
        
        
        NSData *imgData = UIImageJPEGRepresentation(cuttImg210, .2f);
        NSString *cuttStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        
        [NSUserDefaults standardUserDefaults].faceDetectorImageStr = cuttStr;
        
    }
    
    
    
    
    
    if (_2eyesLength >= 210 && _2eyesLength < 230) {
        //
        UIImage *cuttImg210 = [_inputImg imageAtRect:CGRectMake(_leftEyex - 100 , _leftEyey - 140 , (_rightEyex - _leftEyex) + (2 * 100) , (_mouy - _leftEyey) + 140 + 100)];
        
        
        NSData *imgData = UIImageJPEGRepresentation(cuttImg210, .2f);
        NSString *cuttStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        
        [NSUserDefaults standardUserDefaults].faceDetectorImageStr = cuttStr;
        
    }

    
    
    
    if (_2eyesLength >= 100 && _2eyesLength < 210) {
        //
        UIImage *cuttImg100 = [_inputImg imageAtRect:CGRectMake(_leftEyex - 70 , _leftEyey - 100 , (_rightEyex - _leftEyex) + (2 * 70) , (_mouy - _leftEyey) + 100 + 70)];
        
        
        NSData *imgData = UIImageJPEGRepresentation(cuttImg100, .2f);
        NSString *cuttStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        
        [NSUserDefaults standardUserDefaults].faceDetectorImageStr = cuttStr;
        
    }
    
    
    
    
    if (_2eyesLength < 100 || [eyeslengthStr isEqualToString:@"0"]) {
        //
        UIImage *cut_img = [[IFlyFaceHelper sharedFaceHelper] startFaceDetectorWithImagecutttzerozero:_inputImg];
        
        
        NSData *imgData = UIImageJPEGRepresentation(cut_img, .2f);
        NSString *cuttStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        
        [NSUserDefaults standardUserDefaults].faceDetectorImageStr = cuttStr;
        
        
    }
    
    
    
}






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
