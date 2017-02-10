//
//  ZMImageLibbViewController2.m
//  ZMClock
//
//  Created by ZhongMeng on 16/8/5.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMImageLibbViewController2.h"

#import "ZRRImageTool.h"

#import "ZMHeaderProutCuttViewController.h"


@interface ZMImageLibbViewController2 ()<UIGestureRecognizerDelegate>
{

    CGFloat _sizeHeight;

    
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


@property (nonatomic, strong) UIImageView *pickerImgV;//
@property (nonatomic, strong) UIImageView *bottomImgV;
@property (nonatomic) CGRect imgRect;

@property (nonatomic, strong) UIImageView *leftEyeImgV;
@property (nonatomic, strong) UIImageView *rightEyeImgV;
@property (nonatomic, strong) UIImageView *mouthImgV;

@property (nonatomic, strong) UIImage *faceDeImg;




@end

@implementation ZMImageLibbViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    
    //self.title = @"位置调整2";
    self.title = @"位置调整";
    
    
    [self setupPickerImgV];

    [self setNavRightBtnImage:@"社区导航完成"];
    
    
}






- (void)setupPickerImgV
{
    
    NSString *imgStr = [APPTransmit shareInstance].imgStrr2;
    
    
    
    
    if (imgStr == nil || imgStr == NULL || [imgStr isKindOfClass:[NSNull class]]) {
        
        
    }else {
        
        
        NSData *decodeImgData = [[NSData alloc] initWithBase64EncodedString:imgStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
        self.faceDeImg = [UIImage imageWithData:decodeImgData];
        
        _inputImg = self.faceDeImg;
        
        
        
         _sizeHeight = ( kScreen_Width * self.faceDeImg.size.height ) / self.faceDeImg.size.width;
        
        _inputImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 74, _inputImg.size.width,_inputImg.size.height)];
        
        
        [_inputImgView setImage:_inputImg];
        
        [self.view addSubview:_inputImgView];
        
        NSLog(@"原始图片大小   x: %.f  y: %.f",_inputImg.size.width,_inputImg.size.height);//
        
        [self recognitionFaces];
        
        
        
        
        
        
        
        
        
        
        
        
        
       
        
//        _sizeHeight = ( kScreen_Width * self.faceDeImg.size.height ) / self.faceDeImg.size.width;
//        
//        //UIImage *scaleImgg = [ZRRImageTool imageCompressForWidthScale:self.faceDeImg targetWidth:kScreen_Width - 20];
//        
//        self.pickerImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 74,  kScreen_Width , _sizeHeight)];
//        
//        
//        self.pickerImgV.userInteractionEnabled = YES;
//        self.pickerImgV.backgroundColor = [UIColor redColor];
//        self.pickerImgV.image = self.faceDeImg;
//        
//        
//        [self.view addSubview:self.pickerImgV];
//        
//        
//
//        
//        
//        self.imgRect = [[IFlyFaceHelper sharedFaceHelper] startDetectorWithImage:self.pickerImgV.image];
//        
//        NSLog(@"%f %f      %f  %f",self.imgRect.origin.x,self.imgRect.origin.y,self.imgRect.size.width,self.imgRect.size.height);
//        
//        
//        
//        self.leftEyeImgV = [[UIImageView alloc] initWithFrame:CGRectMake(self.imgRect.origin.x - 25, self.imgRect.origin.y - 15,  35 , 22)];
//        self.leftEyeImgV.backgroundColor = [UIColor blackColor];
//        self.leftEyeImgV.image = IMAGE(@"eye@2x");
//        self.leftEyeImgV.userInteractionEnabled = YES;
//        
//        [self addGestureRecognizerToView:self.leftEyeImgV];
//        
//        
//        self.rightEyeImgV = [[UIImageView alloc] initWithFrame:CGRectMake(self.imgRect.origin.x + 45, self.imgRect.origin.y - 15,  35 , 22)];
//        self.rightEyeImgV.backgroundColor = [UIColor blackColor];
//        self.rightEyeImgV.image = IMAGE(@"eye@2x");
//        self.rightEyeImgV.userInteractionEnabled = YES;
//        
//        [self addGestureRecoToView:self.rightEyeImgV];
//        
//        self.mouthImgV = [[UIImageView alloc] initWithFrame:CGRectMake(self.imgRect.origin.x + 10, self.imgRect.origin.y + 50,  50 , 25)];
//        self.mouthImgV.backgroundColor = [UIColor clearColor];
//        self.mouthImgV.image = IMAGE(@"mouth@2x");
//        self.mouthImgV.userInteractionEnabled = YES;
//        
//        [self addGestureToView:self.mouthImgV];
//        
//        
//        [self.pickerImgV addSubview:self.leftEyeImgV];
//        [self.pickerImgV addSubview:self.rightEyeImgV];
//        [self.pickerImgV addSubview:self.mouthImgV];
//        

        
        
        
        
    }
    
    
    
}






- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    
}


- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    //UITouch *touch = touches.anyObject;
    //CGPoint point = [touch locationInView:_inputImgView];
    
    //NSLog(@"point______________%f________%f",point.x,point.y);
    
    
    
}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = touches.anyObject;
    
    CGPoint point = [touch locationInView:self.pickerImgV];
    
    NSLog(@"point_坐标____________X_%.f_______Y_%.f",point.x,point.y);
    
    
}










//------------------------------------------------------------------------------------------
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
    
    //UIView * resultView = [[UIView alloc] initWithFrame:CGRectMake(0, 74, _inputImgView.frame.size.width/ (self.faceDeImg.size.width/kScreen_Width), ( (self.faceDeImg.size.width/kScreen_Width) * self.faceDeImg.size.height ) / self.faceDeImg.size.width)];
    
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
            
            
            
            NSLog(@"左眼中心点   x:: %.f  y:: %.f",faceFeature.leftEyePosition.x, _inputImg.size.height - faceFeature.leftEyePosition.y);
            
            _leftEyex = faceFeature.leftEyePosition.x;
            _leftEyey = _inputImg.size.height - faceFeature.leftEyePosition.y;
            
            
        }
        
        
        if (faceFeature.hasRightEyePosition) {
            
            UIView * rightEyeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
            [rightEyeView setCenter:faceFeature.rightEyePosition];
            rightEyeView.layer.borderWidth = 1;
            rightEyeView.layer.borderColor = [UIColor redColor].CGColor;
            [resultView addSubview:rightEyeView];
            
            
            NSLog(@"右眼中心点   x:: %.f  y:: %.f",faceFeature.rightEyePosition.x, _inputImg.size.height - faceFeature.rightEyePosition.y);
            
            
            _rightEyex = faceFeature.rightEyePosition.x;
            _rightEyey = _inputImg.size.height - faceFeature.rightEyePosition.y;
            
            
            
        }
        
        if (faceFeature.hasMouthPosition) {
            
            UIView * mouthView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 5)];
            [mouthView setCenter:faceFeature.mouthPosition];
            mouthView.layer.borderWidth = 1;
            mouthView.layer.borderColor = [UIColor redColor].CGColor;
            [resultView addSubview:mouthView];
            
            
            
            NSLog(@"嘴中心点   x:: %.f  y:: %.f",faceFeature.mouthPosition.x, _inputImg.size.height - faceFeature.mouthPosition.y);
            
            
            _moux = faceFeature.mouthPosition.x;
            _mouy = _inputImg.size.height - faceFeature.mouthPosition.y;
            
            
        }
        
        
    }
    
    [resultView setTransform:CGAffineTransformMakeScale(1, -1)];
//
    
    
    NSLog(@"两眼 中心点之间的距离: %.f",_rightEyex - _leftEyex);
    
    
    _2eyesLength = _rightEyex - _leftEyex;
    
    
    
    //NSLog(@"左眼 中心点到嘴巴的 垂直距离: %.f",_mouy - _leftEyey);
    
    //NSLog(@"右眼 中心点到嘴巴的 垂直距离: %.f",_mouy - _rightEyey);
    
    

    
    
    
}







////////左眼
- (void)addGestureRecognizerToView:(UIImageView *)view
{
    
    // 移动手势
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panView:)];
    panGestureRecognizer.delegate = self;
    [view addGestureRecognizer:panGestureRecognizer];
    
    
    
}

//////右眼
- (void)addGestureRecoToView:(UIImageView *)view
{
    
    // 移动手势
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panViewww:)];
    panGestureRecognizer.delegate = self;
    [view addGestureRecognizer:panGestureRecognizer];
    
    
    
}


///////嘴
- (void)addGestureToView:(UIImageView *)view
{
    
    // 移动手势
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panViewwwww:)];
    panGestureRecognizer.delegate = self;
    [view addGestureRecognizer:panGestureRecognizer];
    
    
    
}



//移动手势
- (void)panView:(UIPanGestureRecognizer *)panGestureRecognizer
{
    UIView *view = panGestureRecognizer.view;
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan || panGestureRecognizer.state == UIGestureRecognizerStateChanged){
        
        CGPoint transP = [panGestureRecognizer translationInView:view];
        
        if (transP.y < kScreen_Height/2) {
            self.leftEyeImgV.transform = CGAffineTransformTranslate(self.leftEyeImgV.transform, transP.x, transP.y);
            
            
            [panGestureRecognizer setTranslation:CGPointZero inView:self.leftEyeImgV];
            
            
            
        }
        
    }
    
    
}


- (void)panViewww:(UIPanGestureRecognizer *)panGestureRecognizer
{
    UIView *view = panGestureRecognizer.view;
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan || panGestureRecognizer.state == UIGestureRecognizerStateChanged){
        
        CGPoint transP = [panGestureRecognizer translationInView:view];
        
        if (transP.y < kScreen_Height/2) {
            
            
            self.rightEyeImgV.transform = CGAffineTransformTranslate(self.rightEyeImgV.transform, transP.x, transP.y);
            
            
            [panGestureRecognizer setTranslation:CGPointZero inView:self.rightEyeImgV];
            
            
        }
        
    }
    
    
}


- (void)panViewwwww:(UIPanGestureRecognizer *)panGestureRecognizer
{
    UIView *view = panGestureRecognizer.view;
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan || panGestureRecognizer.state == UIGestureRecognizerStateChanged){
        
        CGPoint transP = [panGestureRecognizer translationInView:view];
        
        if (transP.y < kScreen_Height/2) {
            
            
            self.mouthImgV.transform = CGAffineTransformTranslate(self.mouthImgV.transform, transP.x, transP.y);
            
            
            [panGestureRecognizer setTranslation:CGPointZero inView:self.mouthImgV];
            
            
            
        }
        
    }
    
    
}








#pragma mark -----------------------------------右侧按钮

//右侧按钮
- (void)navRightBtnAction:(UIButton*)sender
{
//    NSString *just = [APPTransmit shareInstance].justStt;
//    
//    if ([just isEqualToString:@"nan"]) {
//        UIImage *immmmg = [[IFlyFaceHelper sharedFaceHelper] startFaceDetectorWithImage:self.faceDeImg];
//        
//        
//        //图片转字符串
//        NSData *data = UIImageJPEGRepresentation(immmmg, .2f);
//        NSString *encodeImgStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
//        [NSUserDefaults standardUserDefaults].faceDetectorImageStr = encodeImgStr;
//        
//    }else if ([just isEqualToString:@"nv"]){
//        
//        
//        UIImage *immmmg = [[IFlyFaceHelper sharedFaceHelper] startFaceDetectorWithImage:self.faceDeImg];
//        
//        
//        //图片转字符串
//        NSData *data = UIImageJPEGRepresentation(immmmg, .2f);
//        NSString *encodeImgStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
//        [NSUserDefaults standardUserDefaults].faceDetectorImageStr2 = encodeImgStr;
//        
//    }else {}
//    
//    [self.navigationController popViewControllerAnimated:YES];
    
    
    
    
    
    
    
    NSLog(@"两眼 中心点之间的距离: %.f",_2eyesLength);

    
    NSString *eyeslengthStr = [NSString stringWithFormat:@"%.f",_2eyesLength];
    
    
    if (_2eyesLength >= 300) {
        
        UIImage *cuttImg300 = [self.faceDeImg imageAtRect:CGRectMake(_leftEyex - 120 , _leftEyey - 160 , (_rightEyex - _leftEyex) + (2 * 120) , (_mouy - _leftEyey) + 160 + 150)];
        
        
        NSData *imgData = UIImageJPEGRepresentation(cuttImg300, .2f);
        NSString *cuttStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        
        [APPTransmit shareInstance].diyHeadPoritCutStr = cuttStr;
        
        
        
        ZMHeaderProutCuttViewController *cut = [[ZMHeaderProutCuttViewController alloc] init];
        [self.navigationController pushViewController:cut animated:YES];
        
        
    }
    
    
    if (_2eyesLength >= 210 && _2eyesLength < 300) {
        //
        UIImage *cuttImg210 = [self.faceDeImg imageAtRect:CGRectMake(_leftEyex - 100 , _leftEyey - 140 , (_rightEyex - _leftEyex) + (2 * 100) , (_mouy - _leftEyey) + 140 + 130)];
        
        
        NSData *imgData = UIImageJPEGRepresentation(cuttImg210, .2f);
        NSString *cuttStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        
        [APPTransmit shareInstance].diyHeadPoritCutStr = cuttStr;
        
        
        
        ZMHeaderProutCuttViewController *cut = [[ZMHeaderProutCuttViewController alloc] init];
        [self.navigationController pushViewController:cut animated:YES];
        
    }
    
    
    if (_2eyesLength >= 100 && _2eyesLength < 210) {
        //
        UIImage *cuttImg100 = [self.faceDeImg imageAtRect:CGRectMake(_leftEyex - 70 , _leftEyey - 100 , (_rightEyex - _leftEyex) + (2 * 70) , (_mouy - _leftEyey) + 100 + 70)];
        
        
        NSData *imgData = UIImageJPEGRepresentation(cuttImg100, .2f);
        NSString *cuttStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        
        [APPTransmit shareInstance].diyHeadPoritCutStr = cuttStr;
        
        
        
        ZMHeaderProutCuttViewController *cut = [[ZMHeaderProutCuttViewController alloc] init];
        [self.navigationController pushViewController:cut animated:YES];
        
    }
    
    
    
    
    if (_2eyesLength < 100 || [eyeslengthStr isEqualToString:@"0"]) {
        //
        UIImage *cut_img = [[IFlyFaceHelper sharedFaceHelper] startFaceDetectorWithImagecuttt:self.faceDeImg];
        

        NSData *imgData = UIImageJPEGRepresentation(cut_img, .2f);
        NSString *cuttStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        
        [APPTransmit shareInstance].diyHeadPoritCutStr = cuttStr;
        
        
        
        ZMHeaderProutCuttViewController *cut = [[ZMHeaderProutCuttViewController alloc] init];
        [self.navigationController pushViewController:cut animated:YES];
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    //UIImage *cuttImg = [self.faceDeImg imageAtRect:CGRectMake(_leftEyex - 100 , _leftEyey - 140 , (_rightEyex - _leftEyex) + (2 * 100) , (_mouy - _leftEyey) + 140 + 60)];
    
//    UIImage *cuttImg = [self.faceDeImg imageAtRect:CGRectMake(_leftEyex - 30 , _leftEyey - 50 , (_rightEyex - _leftEyex) + (2 * 30) , (_mouy - _leftEyey) + 50 + 20)];
//    
//    
//    
//    
//    //NSLog(@"截取____ leftx: %.f lefty: %.f",_leftEyex,_leftEyey);
//     //UIImage *cuttImg = [[IFlyFaceHelper sharedFaceHelper] startFaceDetectorWithImage:self.faceDeImg];
//    
//    
//    NSData *imgData = UIImageJPEGRepresentation(cuttImg, .2f);
//    NSString *cuttStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
//    
//    
//    [APPTransmit shareInstance].diyHeadPoritCutStr = cuttStr;
//    
//    
//    
//    ZMHeaderProutCuttViewController *cut = [[ZMHeaderProutCuttViewController alloc] init];
//    [self.navigationController pushViewController:cut animated:YES];
    
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
