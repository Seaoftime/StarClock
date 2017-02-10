//
//  ZMDIYCameaForImaggViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/10/22.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMDIYCameaForImaggViewController.h"

#import "ZMDiyyHeaderLocationonViewController.h"
#import "UIButton+DJBlock.h"
#import "DJCameraManager.h"


#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

//////自定义相机类
@interface ZMDIYCameaForImaggViewController ()<DJCameraManagerDelegate>

@property (nonatomic, strong) DJCameraManager *manager;

@property (nonatomic, strong) UIButton *fanhuiBtn;
@property (nonatomic, strong) UIView *headdV;
@property (nonatomic, strong) UILabel *titleeLb;
@property (nonatomic, strong) UIImageView *toastImgV;
@property (nonatomic, strong) UILabel *toastLb;

@property (nonatomic, strong) UIView *pickView;
@property (nonatomic, strong) UIButton *pickPhotoButton;
@property (nonatomic, strong) UIButton *frontBackCameraBtn;


@end

@implementation ZMDIYCameaForImaggViewController


/**
 *  在页面结束或出现记得开启／停止摄像
 *
 */
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (![self.manager.session isRunning]) {
        [self.manager.session startRunning];
    }
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if ([self.manager.session isRunning]) {
        [self.manager.session stopRunning];
    }
}


- (void)dealloc
{
    NSLog(@"照相机释放了");
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //
    self.title = @"拍 照";
    
    self.baseNavigation.hidden = YES;
    
    self.view.backgroundColor = RGB(242, 237, 238);
    

    [self setupTitleView];
    [self initCameraView];
    [self addPickPhotoButton];
    
    
}


- (void)setupTitleView
{
    self.headdV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 70)];
    self.headdV.backgroundColor = RGB(236, 128, 172);
    
    [self.view addSubview:self.headdV];
    
    ////////////////////////////
    self.titleeLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, kScreen_Width, 40)];
    self.titleeLb.font = [UIFont systemFontOfSize:22];
    self.titleeLb.textColor = [UIColor whiteColor];
    self.titleeLb.text = @"拍 照";
    self.titleeLb.textAlignment = NSTextAlignmentCenter;
    
    [self.headdV addSubview:self.titleeLb];
    
    
    ////////////////////////////
    
    self.fanhuiBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 5 , 50, 50)];
    self.fanhuiBtn.backgroundColor = [UIColor clearColor];
    [self.fanhuiBtn setImage:IMAGE(@"返回按键") forState:UIControlStateNormal] ;
    
    //self.fanhuiBtn.transform = CGAffineTransformMakeRotation(-M_PI /2);
    [self.fanhuiBtn addTarget:self action:@selector(fanhuiBtnnnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.headdV addSubview:self.fanhuiBtn];
    
    
    
    ////////////////////////////
    
    if ([ZMSystemTool iPhone5Device]) {
        self.frontBackCameraBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width - 103, 6, 100 , 50 )];
    } else {
        self.frontBackCameraBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width - 105, 10, 100 , 50 )];
    }

    
    
    [self.frontBackCameraBtn setBackgroundImage:IMAGE(@"拍照-镜头旋转图标") forState:UIControlStateNormal];
    [self.frontBackCameraBtn setBackgroundImage:IMAGE(@"拍照-镜头旋转图标-点击") forState:UIControlStateHighlighted];
    
    self.frontBackCameraBtn.backgroundColor = [UIColor clearColor];
    
    [self.frontBackCameraBtn addTarget:self action:@selector(frontBackCameraBtnClickked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.headdV addSubview:self.frontBackCameraBtn];
   
    


}


- (void)fanhuiBtnnnClicked
{
    [self.navigationController popViewControllerAnimated:YES];
    //[self dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark ---------------------------------镜头切换
- (void)frontBackCameraBtnClickked:(UIButton *)btn
{
    btn.enabled = NO;
    btn.selected = !btn.selected;
    
    [self.manager switchCamera:!btn.selected didFinishChanceBlock:^{
        btn.enabled = YES;
    }];
    
    
}


/**切换闪光灯按钮
 */

/*
 - (void)initFlashButton
 {
 static CGFloat buttonW = 40;
 UIButton *button = [self buildButton:CGRectMake(5, AppWidth+125, buttonW, buttonW)
 normalImgStr:@"flashing_off.png"
 highlightImgStr:@""
 selectedImgStr:@""
 parentView:self.view];
 WS(weak);
 [button addActionBlock:^(id sender) {
 [weak.manager switchFlashMode:sender];
 } forControlEvents:UIControlEventTouchUpInside];
 }
 */


#pragma mark ---------------------------------相机界面
- (void)initCameraView
{
    //self.view.backgroundColor = [UIColor blackColor];
    
    if ([ZMSystemTool iPhone5Device]) {
        
        self.pickView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, kScreen_Width, kScreen_Height - 200)];
        
    } else {
        
        self.pickView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, kScreen_Width, kScreen_Height - 200)];
    }

    
    
    [self.view addSubview:self.pickView];
    // 传入View的frame 就是摄像的范围
    DJCameraManager *manager = [[DJCameraManager alloc] initWithParentView:self.pickView];
    manager.delegate = self;
    //manager.canFaceRecognition = YES;
    //[manager setFaceRecognitonCallBack:^(CGRect faceFrame) {
    //    NSLog(@"你的脸在%@",NSStringFromCGRect(faceFrame));
    //}];
    
    self.manager = manager;
    
    
////拍照提示框
    self.toastImgV = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width/2 - kScreen_Width/4, kScreen_Height - 310 + 50, kScreen_Width/2, 40)];
    self.toastImgV.image = IMAGE(@"拍照-提示框");
    
    [self.pickView addSubview:self.toastImgV];
    
    self.toastLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.toastImgV.frame.size.width, 40)];
    self.toastLb.font = [UIFont systemFontOfSize:18];
    self.toastLb.textColor = [UIColor whiteColor];
    self.toastLb.text = @"请拍摄正面大头照";
    self.toastLb.textAlignment = NSTextAlignmentCenter;
    
    [self.toastImgV addSubview:self.toastLb];
    


}


/**
 *  点击对焦
 */

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    [self.manager focusInPoint:point];
}


#pragma mark -------------------------------CameraDelegate
- (void)cameraDidFinishFocus
{
    NSLog(@"对焦结束了");
}
- (void)cameraDidStareFocus
{
    NSLog(@"开始对焦");
}


#pragma mark ---------------------------------拍照按钮
- (void)addPickPhotoButton
{
    static CGFloat buttonW = 110;
    
    if ([ZMSystemTool iPhone5Device]) {
        
        self.pickPhotoButton = [self buildButton:CGRectMake(kScreen_Width/2 - buttonW/2, kScreen_Height - 160 - 20 + 50, buttonW, buttonW)
                                    normalImgStr:@"拍照-拍摄按键"
                                 highlightImgStr:@"拍照-拍摄按键-点击"
                                  selectedImgStr:@""
                                      parentView:self.view];

    } else {
        
        self.pickPhotoButton = [self buildButton:CGRectMake(kScreen_Width/2 - buttonW/2, kScreen_Height - 190 - 20 + 50, buttonW, buttonW)
                                    normalImgStr:@"拍照-拍摄按键"
                                 highlightImgStr:@"拍照-拍摄按键-点击"
                                  selectedImgStr:@""
                                      parentView:self.view];

    }

    
    WS(weak);
    [self.pickPhotoButton addActionBlock:^(id sender) {
        [weak.manager takePhotoWithImageBlock:^(UIImage *originImage, UIImage *scaledImage, UIImage *croppedImage) {
            if (croppedImage) {
                //PhotoViewController *VC = [PhotoViewController new];
               // VC.image = croppedImage;
                //[weak presentViewController:VC animated:YES completion:nil];
                
                
                NSData *imgData = UIImageJPEGRepresentation(croppedImage, .2f);
                
                NSString *encodeImgStr2 = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
                
                
                [APPTransmit shareInstance].imgStrr = encodeImgStr2;
                
                
                //
                ZMDiyyHeaderLocationonViewController *choose = [[ZMDiyyHeaderLocationonViewController alloc] init];
                
                [weak.navigationController pushViewController:choose animated:YES];
                
                //[weak presentViewController:choose animated:YES completion:nil];
                
            }
        }];
    } forControlEvents:UIControlEventTouchUpInside];



}

- (UIButton*)buildButton:(CGRect)frame
            normalImgStr:(NSString*)normalImgStr
         highlightImgStr:(NSString*)highlightImgStr
          selectedImgStr:(NSString*)selectedImgStr
              parentView:(UIView*)parentView {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    if (normalImgStr.length > 0) {
        [btn setImage:[UIImage imageNamed:normalImgStr] forState:UIControlStateNormal];
    }
    if (highlightImgStr.length > 0) {
        [btn setImage:[UIImage imageNamed:highlightImgStr] forState:UIControlStateHighlighted];
    }
    if (selectedImgStr.length > 0) {
        [btn setImage:[UIImage imageNamed:selectedImgStr] forState:UIControlStateSelected];
    }
    [parentView addSubview:btn];
    return btn;
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
