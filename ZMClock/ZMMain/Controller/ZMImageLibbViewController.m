//
//  ZMImageLibbViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/8/4.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMImageLibbViewController.h"

@interface ZMImageLibbViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIImageView *pickerImgV;//
@property (nonatomic, strong) UIImageView *bottomImgV;
@property (nonatomic) CGRect imgRect;

@property (nonatomic, strong) UIImageView *leftEyeImgV;
@property (nonatomic, strong) UIImageView *rightEyeImgV;
@property (nonatomic, strong) UIImageView *mouthImgV;

@property (nonatomic, strong) UIImage *faceDeImg;


@end

@implementation ZMImageLibbViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    
    self.title = @"位置调整";
    
    [self setupPickerImgV];
    
    [self setNavRightBtnImage:@"社区导航完成"];
    
}


- (void)setupPickerImgV
{
    
    NSString *imgStr = [APPTransmit shareInstance].imgStrr;
    
    
    
    
    if (imgStr == nil || imgStr == NULL || [imgStr isKindOfClass:[NSNull class]]) {
        
        
    }else {
        
        
        NSData *decodeImgData = [[NSData alloc] initWithBase64EncodedString:imgStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
        self.faceDeImg = [UIImage imageWithData:decodeImgData];
        
        CGFloat xx = self.faceDeImg.size.width/kScreen_Width;
        
        CGFloat height = self.faceDeImg.size.height/xx;
        
//        if (height < kScreen_Height - 64 - 50) {
//            
//            self.pickerImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64 + 50,  kScreen_Width , height)];
//        }else {
//        
//            self.pickerImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64,  kScreen_Width , height)];
//        }
        
        self.pickerImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64,  kScreen_Width , height)];
        
        
        self.pickerImgV.userInteractionEnabled = YES;
        self.pickerImgV.backgroundColor = [UIColor redColor];
        self.pickerImgV.image = self.faceDeImg;
        

        [self.view addSubview:self.pickerImgV];

        self.imgRect = [[IFlyFaceHelper sharedFaceHelper] startDetectorWithImage:self.faceDeImg];
        
        NSLog(@"%f %f      %f  %f",self.imgRect.origin.x,self.imgRect.origin.y,self.imgRect.size.width,self.imgRect.size.height);
        
        
        
        self.leftEyeImgV = [[UIImageView alloc] initWithFrame:CGRectMake(self.imgRect.origin.x - 25, self.imgRect.origin.y - 15,  30 , 20)];
        self.leftEyeImgV.backgroundColor = [UIColor clearColor];
        self.leftEyeImgV.image = IMAGE(@"eye@2x");
        self.leftEyeImgV.userInteractionEnabled = YES;
        
        [self addGestureRecognizerToView:self.leftEyeImgV];
        
        
        self.rightEyeImgV = [[UIImageView alloc] initWithFrame:CGRectMake(self.imgRect.origin.x + 45, self.imgRect.origin.y - 15,  30 , 20)];
        self.rightEyeImgV.backgroundColor = [UIColor clearColor];
        self.rightEyeImgV.image = IMAGE(@"eye@2x");
        self.rightEyeImgV.userInteractionEnabled = YES;
        
        [self addGestureRecoToView:self.rightEyeImgV];
        
        self.mouthImgV = [[UIImageView alloc] initWithFrame:CGRectMake(self.imgRect.origin.x + 10, self.imgRect.origin.y + 50,  50 , 30)];
        self.mouthImgV.backgroundColor = [UIColor clearColor];
        self.mouthImgV.image = IMAGE(@"mouth@2x");
        self.mouthImgV.userInteractionEnabled = YES;
        
        [self addGestureToView:self.mouthImgV];
        
        
        [self.pickerImgV addSubview:self.leftEyeImgV];
        [self.pickerImgV addSubview:self.rightEyeImgV];
        [self.pickerImgV addSubview:self.mouthImgV];
        
        
    }

    
    
}



- (void)addGestureRecognizerToView:(UIImageView *)view
{
    
// 移动手势
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panView:)];
    panGestureRecognizer.delegate = self;
    [view addGestureRecognizer:panGestureRecognizer];
    
    
    
}


- (void)addGestureRecoToView:(UIImageView *)view
{
    
    // 移动手势
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panViewww:)];
    panGestureRecognizer.delegate = self;
    [view addGestureRecognizer:panGestureRecognizer];
    
    
    
}

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




//右侧按钮
- (void)navRightBtnAction:(UIButton*)sender
{
    NSString *just = [APPTransmit shareInstance].justStt;
    
    if ([just isEqualToString:@"nan"]) {
        UIImage *immmmg = [[IFlyFaceHelper sharedFaceHelper] startFaceDetectorWithImage:self.faceDeImg];
        
        
        //图片转字符串
        NSData *data = UIImageJPEGRepresentation(immmmg, .2f);
        NSString *encodeImgStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        [NSUserDefaults standardUserDefaults].faceDetectorImageStr = encodeImgStr;

    }else if ([just isEqualToString:@"nv"]){
    
        
        UIImage *immmmg = [[IFlyFaceHelper sharedFaceHelper] startFaceDetectorWithImage:self.faceDeImg];
        
        
        //图片转字符串
        NSData *data = UIImageJPEGRepresentation(immmmg, .2f);
        NSString *encodeImgStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        [NSUserDefaults standardUserDefaults].faceDetectorImageStr2 = encodeImgStr;
        
    }else {}

    [self.navigationController popViewControllerAnimated:YES];

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
