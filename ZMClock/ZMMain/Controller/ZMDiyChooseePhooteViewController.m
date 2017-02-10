//
//  ZMDiyChooseePhooteViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/10/14.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMDiyChooseePhooteViewController.h"


#import "ZMDiyyHeaderLocationonViewController.h"

#import "ZMDIYCameaForImaggViewController.h"


@interface ZMDiyChooseePhooteViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, strong) UIButton *fanhuiBtn;
@property (nonatomic, strong) UIView *headdV;
@property (nonatomic, strong) UIImageView *headImggV;
//@property (nonatomic, strong) UILabel *titleeLb;
@property (nonatomic, strong) UILabel *tellLb1;
@property (nonatomic, strong) UILabel *tellLb2;


///拍照按钮
@property (nonatomic, strong) UIButton *takePhotosBtn;

///相册选取按钮
@property (nonatomic, strong) UIButton *choosePhotosBtn;



@end

@implementation ZMDiyChooseePhooteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    
    self.title = @"选取照片";
    
    self.baseNavigation.hidden = YES;
    
    self.view.backgroundColor = RGB(242, 237, 238);
    
    
    [self setupUI];
    
    
    
    
}


//设置不同字体颜色
- (void)setTextColor:(UILabel *)label FontNumber:(id)font AndRange:(NSRange)range AndColor:(UIColor *)vaColor
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:label.text];
    //设置字号
    [str addAttribute:NSFontAttributeName value:font range:range];
    //设置文字颜色
    [str addAttribute:NSForegroundColorAttributeName value:vaColor range:range];
    
    label.attributedText = str;
}



- (void)setupUI
{
    
    self.headdV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height/3.5)];
    self.headdV.backgroundColor = RGB(236, 128, 172);
    
    [self.view addSubview:self.headdV];
    
////////////////////////////
    self.titleeLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 8, kScreen_Width, 40)];
    self.titleeLb.font = [UIFont systemFontOfSize:22];
    self.titleeLb.textColor = [UIColor whiteColor];
    self.titleeLb.text = @"选取照片";
    self.titleeLb.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:self.titleeLb];
    
    
////////////////////////////
    
    self.fanhuiBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 5 - 2, 50, 50)];
    self.fanhuiBtn.backgroundColor = [UIColor clearColor];
    [self.fanhuiBtn setImage:IMAGE(@"返回按键") forState:UIControlStateNormal] ;
    
    
    [self.fanhuiBtn addTarget:self action:@selector(fanhuiBtnnnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.headdV addSubview:self.fanhuiBtn];

    
////////////////////////////
    self.headImggV = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width/2 - (kScreen_Width/2.3)/2, (kScreen_Height/3.5)/2, kScreen_Width/2.3, kScreen_Width/2.3)];
    
    self.headImggV.image = IMAGE(@"选取照片-圆框");
    
    [self.view addSubview:self.headImggV];
    
////////////////////////////
    self.tellLb1 = [[UILabel alloc] initWithFrame:CGRectMake(0, (kScreen_Height/3.5)/2 + kScreen_Width/2.3 + 10, kScreen_Width, 40)];
    
    if ([ZMSystemTool iPhone5Device]) {
        self.tellLb1.font = [UIFont systemFontOfSize:19];
        
    } else {
        self.tellLb1.font = [UIFont systemFontOfSize:20];
    }
    
    
    self.tellLb1.textColor = [UIColor blackColor];
    self.tellLb1.text = @"上传一张正面大头照效果更棒哦~";
    self.tellLb1.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:self.tellLb1];
    
    NSRange range = [self.tellLb1.text rangeOfString:@"正面大头照"];
    [self setTextColor:self.tellLb1 FontNumber:[UIFont systemFontOfSize:22] AndRange:range AndColor:RGB(252, 60, 60)];
    
    
    
////////////////////////////
    self.tellLb2 = [[UILabel alloc] initWithFrame:CGRectMake(0, (kScreen_Height/3.5)/2 + + kScreen_Width/2.3 + 50 + 10, kScreen_Width, 80)];
    self.tellLb2.font = [UIFont systemFontOfSize:18];
    self.tellLb2.textColor = RGB(136, 136, 136);
    self.tellLb2.text = @"双人形象下,您可上传一张爱豆照片,\n与爱豆来次亲密合影吧~";
    self.tellLb2.numberOfLines = 0;
    self.tellLb2.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:self.tellLb2];
    
    
    
    
////////////////////////////
    if ([ZMSystemTool iPhone5Device]) {
        
        self.takePhotosBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width/2 - 140 - 5, kScreen_Height/4 * 3 , 140 , 60 )];
        
    } else {
        
        self.takePhotosBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width/2 - ((kScreen_Width/2 - 170)/2) - 170 + 5, kScreen_Height/4 * 3 - 20, 170 , 70 )];
        
        
    }

    [self.takePhotosBtn setBackgroundImage:IMAGE(@"拍照按键") forState:UIControlStateNormal];
    [self.takePhotosBtn setBackgroundImage:IMAGE(@"拍照按键-点击") forState:UIControlStateHighlighted];
    
    self.takePhotosBtn.backgroundColor = [UIColor clearColor];
    
    [self.takePhotosBtn addTarget:self action:@selector(takePhotosBtnvCliickked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.takePhotosBtn];
    

    if ([ZMSystemTool iPhone5Device]) {
        
        self.choosePhotosBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width - (kScreen_Width/2 - 140) - 140 + 5, kScreen_Height/4 * 3 , 140 , 60 )];
        
    } else {
        
        self.choosePhotosBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width/2 + (kScreen_Width/2 - 170)/2 - 5, kScreen_Height/4 * 3 - 20, 170 , 70 )];
    }

    
    [self.choosePhotosBtn setBackgroundImage:IMAGE(@"相册选取按键") forState:UIControlStateNormal];
    [self.choosePhotosBtn setBackgroundImage:IMAGE(@"相册选取按键-点击") forState:UIControlStateHighlighted];
    
    self.choosePhotosBtn.backgroundColor = [UIColor clearColor];
    
    [self.choosePhotosBtn addTarget:self action:@selector(choosePhotosBtnCliickked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.choosePhotosBtn];



}



- (void)fanhuiBtnnnClicked
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}





#pragma mark -----------------------------点击事件
//拍照
- (void)takePhotosBtnvCliickked
{

    [NSUserDefaults standardUserDefaults].photo_From = @"camere";
    
//    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
//    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
//    {
//        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//        picker.delegate = self;
//        //设置拍照后的图片可被编辑
//        picker.allowsEditing = NO;
//        picker.sourceType = sourceType;
//        [self presentViewController:picker animated:YES completion:^{
//            
//        }];
//    }else
//    {
//        NSLog(@"模拟其中无法打开照相机,请在真机中使用");
//    }

    
    ZMDIYCameaForImaggViewController *cameraForImgVC = [[ZMDIYCameaForImaggViewController alloc] init];
    
    //[self presentViewController:cameraForImgVC animated:YES completion:nil];
    
    [self.navigationController pushViewController:cameraForImgVC animated:YES];
    

}



//相册选取
- (void)choosePhotosBtnCliickked
{
    [NSUserDefaults standardUserDefaults].photo_From = @"photoss";
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    //设置选择后的图片可被编辑
    picker.allowsEditing = NO;
    [self presentViewController:picker animated:YES completion:^{
        
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    }];

    
   
    
    
}


#pragma mark --------------------------imagePicker 代理
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    
    NSLog(@"imagePicker:  %@",[NSUserDefaults standardUserDefaults].photo_From);
    
    NSString *choose = [NSUserDefaults standardUserDefaults].photo_From;
    
    
    if ([choose isEqualToString:@"photoss"]) {
        //
        [self dismissViewControllerAnimated:YES completion:^{
            
            
            UIImage *tempImage = (UIImage *)[info objectForKey:UIImagePickerControllerOriginalImage];
            
            
            NSData *imgData = UIImageJPEGRepresentation(tempImage, .2f);
            
            NSString *encodeImgStr2 = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
            
            
            [APPTransmit shareInstance].imgStrr2 = encodeImgStr2;
            
            
            //
            ZMDiyyHeaderLocationonViewController *choose = [[ZMDiyyHeaderLocationonViewController alloc] init];
            
            [self.navigationController pushViewController:choose animated:YES];
            
            //[self presentViewController:choose animated:YES completion:nil];
            
            
        }];

    }else {
    
        [self dismissViewControllerAnimated:YES completion:^{
            
            
            UIImage *tempImage = (UIImage *)[info objectForKey:UIImagePickerControllerOriginalImage];
            
            
            
            
            NSData *imgData = UIImageJPEGRepresentation(tempImage, .2f);
            
            NSString *encodeImgStr2 = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
            
            
            [APPTransmit shareInstance].imgStrr = encodeImgStr2;
            
            
            //
            ZMDiyyHeaderLocationonViewController *choose = [[ZMDiyyHeaderLocationonViewController alloc] init];
            
            [self.navigationController pushViewController:choose animated:YES];
            
            
            
        }];

    
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
