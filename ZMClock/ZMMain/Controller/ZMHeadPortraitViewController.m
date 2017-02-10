//
//  ZMHeadPortraitViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/19.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMHeadPortraitViewController.h"
#import "HeadPortraitImageView.h"
#import "ImagePickerHelper.h"
#import "IFlyFaceHelper.h"

#import "ZMMainViewController.h"

#import "MeInfoModel.h"
#import "MeInfoTableViewCell.h"
#import "ZMEditNickNameViewController.h"
#import "ImagePickerHelper.h"
//#import "EditMeInfoHelper.h"


///////////
//八角截取方式头文件
//#import "JBCroppableView.h"

#import "baobaotouxiang.h"
//测试
#import "ZMTTTestViewController.h"

@interface ZMHeadPortraitViewController () <ImagePickerHelperDeletage,HeadPortraitImageViewDeletage>

{
    UIImageView *image1;
}

@property (nonatomic,strong) HeadPortraitImageView *headPortraitImageView;
//!< 这个用来显示卡通模板图片视图

@property (nonatomic,strong) HeadPortraitImageView *headPortraitImageView1;
@property(nonatomic,strong) UIImageView *headPortraitImageView2;
//!< 这个用来显示卡通模板图片视图放在主视图ZMMainViewController中的



//@property (nonatomic, strong) JBCroppableView *pointsView;//八角截取方式图




@end

@implementation ZMHeadPortraitViewController




#pragma mark  DataRequest Method


#pragma mark 获取宝宝头像并加载到指定位置
-(void)getUserProfile:(BOOL)userProfile
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        if ([[ZMUserInfo sharedUserInfo] isUserInfo])
        {
            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,
                                        @"sign":[ZMUserInfo sharedUserInfo].sign,@"src_type":@"2"};
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"user/get_user_info.php" theParmeters:parmeters sucess:^(id object)
             {
                 if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                 {
                     NSDictionary *data = [object objectForKey:@"data"];
                     if ([data count])
                     {
                         NSDictionary *game=[data objectForKey:@"game"];
                         NSDictionary *avatar = [game objectForKey:@"avatar"];
                         NSString *path=[avatar objectForKey:@"path"];
                         
                         MeInfoModel *headPortraitModel = [[MeInfoModel alloc]init];
                         [headPortraitModel setHeadPortraitUrl:path];
                        //从服务器里获取的人脸识别图片
                         [self.headPortraitImageView.partImageView sd_setImageWithURL:[NSURL URLWithString:headPortraitModel.headPortraitUrl]];
                         
                     }
                 }
             } error:^(NSError *error){}];
        }
    }
}
 


-(NSMutableArray *)meInfoArray
{
    if (_meInfoArray == nil)
    {
        _meInfoArray = [NSMutableArray array];
    }
    return _meInfoArray;
}



-(void)addgesturereconizertoview:(UIView *)view
{
    //旋转
    UIRotationGestureRecognizer*rotationgesturecognizer=[[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotateview:)];
    [view addGestureRecognizer:rotationgesturecognizer];
    // 缩放
    UIPinchGestureRecognizer*pinchgesturereconizer=[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchview:)];
    [view addGestureRecognizer:pinchgesturereconizer];
    // 移动
    UIPanGestureRecognizer*pangesturerecognizer=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panview:)];
    [view addGestureRecognizer:pangesturerecognizer];
    
}


//处理旋转手势
-(void)rotateview:(UIRotationGestureRecognizer*)rotationgesturerecognizer
{
    UIView *view=rotationgesturerecognizer.view;
    if (rotationgesturerecognizer.state==UIGestureRecognizerStateBegan||rotationgesturerecognizer.state==UIGestureRecognizerStateChanged)
    {
        view.transform=CGAffineTransformRotate(view.transform, rotationgesturerecognizer.rotation);
        [rotationgesturerecognizer setRotation:0];
    }
    
}
//处理缩放手势
-(void)pinchview:(UIPinchGestureRecognizer *)pinchgesturerecognizer
{
    UIView *view=pinchgesturerecognizer.view;
    if (pinchgesturerecognizer.state==UIGestureRecognizerStateBegan||pinchgesturerecognizer.scale==UIGestureRecognizerStateChanged) {
        view.transform=CGAffineTransformScale(view.transform, pinchgesturerecognizer.scale, pinchgesturerecognizer.scale);
        if (self.headPortraitImageView.partImageView.frame.size.width<oladframe.size.width/3)
        {
            self.headPortraitImageView.partImageView.frame=oladframe;
        }
        if (self.headPortraitImageView.partImageView.frame.size.width>3*oladframe.size.width)
        {
            self.headPortraitImageView.partImageView.frame=largeframe;
            
            /*
            CGFloat bottom = 10;
            CGFloat left = 10;
            CGFloat right = 10;
            CGFloat top = 10;
            float x = left;
            float y = top;
            float width = right- left;
            float height = bottom - top;
    [suofangimage imageAtRect:CGRectMake(x, y, width, height)];
 [[EditMeInfoHelper shareHelper] setImageData:[NSString dataFromImage:suofangimage]];
       */
        }
        pinchgesturerecognizer.scale=1;
    }
    
    
}

//处理拖拉手势
-(void)panview:(UIPanGestureRecognizer *)pangesturerecognizer
{
    pangesturerecognizer.minimumNumberOfTouches=1;
    pangesturerecognizer.maximumNumberOfTouches=1;
    if (pangesturerecognizer.state==UIGestureRecognizerStateBegan||pangesturerecognizer.state==UIGestureRecognizerStateChanged) {
        if (pangesturerecognizer.state!=UIGestureRecognizerStateBegan&&pangesturerecognizer.state!=UIGestureRecognizerStateFailed)
        {
            CGPoint location=[pangesturerecognizer locationInView:pangesturerecognizer.view.superview];
            pangesturerecognizer.view.center=location;
        }
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"人脸头像设置"];
    
    [self.view addSubview:self.headPortraitImageView];
    [self.headPortraitImageView.partImageView setMultipleTouchEnabled:YES];
    [self.headPortraitImageView.partImageView setUserInteractionEnabled:YES];
    //指定图片调用手势方法
    [self addgesturereconizertoview:self.headPortraitImageView.partImageView];
    
    oladframe = self.headPortraitImageView.partImageView.frame;
    oladframe = self.headPortraitImageView.partImageView.frame;
    largeframe = CGRectMake(0-100, 0-100, 3*oladframe.size.width, 3*oladframe.size.height );
    //从服务器里获取头像
    //[self getUserProfile:YES];
    
    
    //从本地读取
    NSString *faceStr = [NSUserDefaults standardUserDefaults].faceDetectorImageStr;
    
    
    if (faceStr == nil || faceStr == NULL || [faceStr isKindOfClass:[NSNull class]]) {
        
        
    }else {
        
        NSData *decodeImgData = [[NSData alloc] initWithBase64EncodedString:faceStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *faceImg = [UIImage imageWithData:decodeImgData];
        
        self.headPortraitImageView.partImageView.image = faceImg;
        
    }

  
    
    
#pragma mark 八角截取图片的方法不好使
    /*
    //image1=[[UIImageView alloc]init];
    
   // image1.frame=CGRectMake(0, 200, 300, 300);
   // image1.image=[UIImage imageNamed:@"角色3"];
   // [self.view addSubview:image1];
    self.pointsView = [[JBCroppableView alloc] initWithImageView:self.headPortraitImageView.partImageView];
    [self.pointsView addPoints:9];
    [self.view addSubview:self.pointsView];
    
    
 #pragma mark 重置图片的方式
    UIButton *cropButton=[[UIButton alloc]initWithFrame:CGRectMake(kScreen_Width/8, kScreen_Height-60, 60, 30)];
    cropButton.backgroundColor=[UIColor blueColor];
    [cropButton setTitle:@"重置" forState:0];
    [cropButton addTarget:self action:@selector(chongzhi) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cropButton];
    
#pragma mark截取图片的方式
    UIButton *undoButton=[[UIButton alloc]initWithFrame:CGRectMake(kScreen_Width/1.5, kScreen_Height-60, 60, 30)];
    undoButton.backgroundColor=[UIColor blueColor];
    [undoButton setTitle:@"截取" forState:0];
    [undoButton addTarget:self action:@selector(jiequ) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:undoButton];
    
     */
#pragma mark 选择图片的方式
    UIButton *but=[[UIButton alloc]initWithFrame:CGRectMake(kScreen_Width/2.8, kScreen_Height-60, 100, 30)];
    //but.backgroundColor=[UIColor blueColor];
    [but setBackgroundColor:RGB(208, 204, 204)];
    [but.layer setCornerRadius:10];

    [but setTitle:@"选择图片" forState:0];
    [but addTarget:self action:@selector(dijixuanzetupian) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
    
    
    
}
/*
-(void)chongzhi
{
    self.headPortraitImageView.partImageView.image = self.headPortraitImageView.partImageView.image;
}

-(void)jiequ
{
    self.headPortraitImageView.partImageView.image = [self.pointsView deleteBackgroundOfImage:self.headPortraitImageView.partImageView];
    
     [[EditMeInfoHelper shareHelper] setImageData:[NSString dataFromImage:self.headPortraitImageView.partImageView.image]];
}

*/
#pragma mark but 点击调取图片方法

- (void)dijixuanzetupian
{
    //[self showImagePickerActionSheet:YES];
    //测试
    [self.navigationController pushViewController:[[ZMTTTestViewController alloc] init] animated:YES];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - --------角色图片视图
///角色图片
#pragma mark Getter / Setter
-(HeadPortraitImageView*)headPortraitImageView
{
    if (_headPortraitImageView == nil)
    {
        _headPortraitImageView = [[HeadPortraitImageView alloc]initWithFrame:CGRectMake(40, 0, 190, 420) setDeletage:self];
        
        //[_headPortraitImageView.backGroundImageView setImage:[UIImage imageNamed:@"模型1"]];
        [_headPortraitImageView.backGroundImageView setImage:[UIImage imageNamed:@"角色5"]];
    [self.headPortraitImageView setCenter:self.view.center];
    }
    return _headPortraitImageView;
}

-(HeadPortraitImageView*)headPortraitImageView1
{
    if (_headPortraitImageView1 == nil)
    {
        _headPortraitImageView1 = [[HeadPortraitImageView alloc]initWithFrame:CGRectMake(0, 0, 225, 450) setDeletage:self];
        [_headPortraitImageView1.backGroundImageView setImage:[UIImage imageNamed:@"角色"]];
        [self.headPortraitImageView1 setCenter:self.view.center];
    }
    return _headPortraitImageView1;
}

#pragma mark 图片视图点击方法
-(void)tapGestureRecognizer:(UITapGestureRecognizer*)sender
{
    [self showImagePickerActionSheet:YES];
}



// 显示操作表（选择图片方式）
-(void)showImagePickerActionSheet:(BOOL)show
{
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"选择图片" message:@"选择方式" preferredStyle:UIAlertControllerStyleActionSheet];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
                            {
                                [[ImagePickerHelper sharedImagePickerHelper] initWithImagePickerHelperWithType:3 withEdit:NO withViewController:self setDeletate:self];
                            }]];
    
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
                            {
                                
                                [[ImagePickerHelper sharedImagePickerHelper] initWithImagePickerHelperWithType:2 withEdit:NO withViewController:self setDeletate:self];
                                
                            }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action){}]];
    [self presentViewController:actionSheet animated:YES completion:^{}];
}




#pragma mark ImagePickerHelperDeletage 点击相册代理方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image
{
   // UIImage *faceDetectorImage = [[IFlyFaceHelper sharedFaceHelper] startFaceDetectorWithImage:image];
    faceDetectorImage = [[IFlyFaceHelper sharedFaceHelper] startFaceDetectorWithImage:image];
    
    
    //suofangimage = [[IFlyFaceHelper sharedFaceHelper] startFaceDetectorWithImage:image];
    
    
    /*
    //将图片保存在本地
    _preferences=[NSUserDefaults standardUserDefaults];
    [_preferences persistentDomainForName:@"人脸识别图"];
    [_preferences setObject:UIImagePNGRepresentation(image) forKey:@"人脸识别图"];
    */
    
    
    //图片转字符串
    NSData *data = UIImageJPEGRepresentation(faceDetectorImage, .2f);
    NSString *encodeImgStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    [NSUserDefaults standardUserDefaults].faceDetectorImageStr = encodeImgStr;
    
    
    
 
    
    if (faceDetectorImage)
    {
        [self.headPortraitImageView.partImageView setImage:faceDetectorImage];
        //[self.baobaimage setImage:faceDetectorImage];
       // self.baobaimage=faceDetectorImage;
        
        //注释掉下边的这句可以不上传到服务器内效果比请求出来的好但是无法保存的//这个和社区里的我的头像上传是一样的//得到人脸识别图片传到 Model 型数据里,然后在从 Model 获取出来上传到服务器里
       [[baobaotouxiang shareHelper] setImageData:[NSString dataFromImage:[[IFlyFaceHelper sharedFaceHelper] startFaceDetectorWithImage:image]]];
        
    }
}


#pragma mark - TabBarButtonViewDeletage
#pragma mark  从截图中直接返回到main中

-(void)navRightBtnAction:(UIButton *)sender
{

    
    [self.navigationController pushViewController:[[ZMMainViewController alloc] init] animated:YES];
    //将人脸识别的图片上传到服务器
       //上传到服务器
    NSMutableDictionary *parmeters = [NSMutableDictionary dictionary];
    [parmeters setObject:@"0" forKey:@"game_nickname"];
    [parmeters setObject:@"0" forKey:@"nickname"];
    [parmeters setObject:@"0" forKey:@"sex"];
    [parmeters setObject:@"0" forKey:@"birth"];
    [parmeters setObject:@"0" forKey:@"user_info"];
    if ([baobaotouxiang shareHelper].imageData)
    {
        if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
        {
            if ([[ZMUserInfo sharedUserInfo] isUserInfo])
            {
                [parmeters setObject:[ZMUserInfo sharedUserInfo].user_id forKey:@"user_id"];
                [parmeters setObject:[ZMUserInfo sharedUserInfo].sign forKey:@"sign"];
                
                
                [[AFNetworkingHelper sharedNetworkingHelper] postFormDataObjectWithUrl:@"user/update_user_profile.php" theParmeters:parmeters constructingBodyWithBlock:^(id<AFMultipartFormData> formData)
                 {
                     [formData appendPartWithFileData:[baobaotouxiang shareHelper].imageData name:@"game_avatar" fileName:@"image.jpg" mimeType:@"image/jpeg"];
                     
                 } sucess:^(id object)
                 {
                     if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                     {
                         //判断修改宝宝头像是否完成
                         NSDictionary *data = [object objectForKey:@"data"];
                         if ([data count])
                         {
                             NSDictionary*task=[data objectForKey:@"task"];
                             if ([task isEqual:@""])
                             {
                                  [AnyObjectActivityView showWithTitle:@"更新成功" wittImageName:SubmitSucceedVerify withActivityMode:ActivityTopImageView withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                             }
                             else
                             {
                                 NSInteger add_gold=[[task objectForKey:@"add_gold"]integerValue];
                                 NSInteger task_id=[[task objectForKey:@"task_id"]integerValue];
                                 if (task_id==3)
                                 {
                                     [AnyObjectActivityView showWithTitle:[NSString stringWithFormat:@"%@"@"%ld",@"金币+",(long)add_gold] wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                                 }
                             }
                         }
                     }
                 } error:^(NSError *error)
                 {
                     [AnyObjectActivityView showWithTitle:@"更新失败" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                 }];
            }
        }
    }
    else
    {
        if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
        {
            if ([[ZMUserInfo sharedUserInfo] isUserInfo])
            {
                [parmeters setObject:[ZMUserInfo sharedUserInfo].user_id forKey:@"user_id"];
                [parmeters setObject:[ZMUserInfo sharedUserInfo].sign forKey:@"sign"];
                [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"user/update_user_profile.php" theParmeters:parmeters sucess:^(id object)
                 {
                     if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                     {
                          //判断修改宝宝头像是否完成
                         NSDictionary *data = [object objectForKey:@"data"];
                         if ([data count])
                         {
                             NSDictionary*task=[data objectForKey:@"task"];
                             if ([task isEqual:@""])
                             {
                                  [AnyObjectActivityView showWithTitle:@"更新成功" wittImageName:SubmitSucceedVerify withActivityMode:ActivityTopImageView withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                             }
                             else
                             {
                                 NSInteger add_gold=[[task objectForKey:@"add_gold"]integerValue];
                                 NSInteger task_id=[[task objectForKey:@"task_id"]integerValue];
                                 if (task_id==3)
                                 {
                                     [AnyObjectActivityView showWithTitle:[NSString stringWithFormat:@"%@"@"%ld",@"金币+",(long)add_gold] wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                                 }
                             }
                         }
                     }
                     
                 } error:^(NSError *error)
                 {
                     [AnyObjectActivityView showWithTitle:@"更新失败" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                 }];
            }
        }
    }
  
    
    
    
}





@end
