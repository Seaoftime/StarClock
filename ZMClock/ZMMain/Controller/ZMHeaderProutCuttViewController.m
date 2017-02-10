//
//  ZMHeaderProutCuttViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/10/10.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMHeaderProutCuttViewController.h"

@interface ZMHeaderProutCuttViewController ()


@property (nonatomic, strong) UIImageView *cutImgV;//



@end

@implementation ZMHeaderProutCuttViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //


    
    
    
    NSString *cuttStr = [APPTransmit shareInstance].diyHeadPoritCutStr;
    
    
    
    
    if (cuttStr == nil || cuttStr == NULL || [cuttStr isKindOfClass:[NSNull class]]) {
        
        
    }else {
        
        
        NSData *decodeImgData = [[NSData alloc] initWithBase64EncodedString:cuttStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *cuttImgg = [UIImage imageWithData:decodeImgData];
        
        
        //self.cutImgV = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width/2 - 75, 100,  cuttImgg.size.width, cuttImgg.size.height)];
        
        self.cutImgV = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width/2 - 75, 100,  150, 150)];
        
        
        self.cutImgV.userInteractionEnabled = YES;
        self.cutImgV.backgroundColor = [UIColor redColor];
        
        
        
        
        
/////////////////////////////////////////////////////
        
        ///裁剪图片
        CGFloat width = cuttImgg.size.width;
        CGFloat hight = cuttImgg.size.height;
        
        //NSLog(@"wwwwwwwww%f       hhhhhhhhhh%f",width,hight);
        //开始绘制图片
        UIGraphicsBeginImageContext(cuttImgg.size);
        CGContextRef ref = UIGraphicsGetCurrentContext();
        
        ///
        //绘制Clip区域(在开始绘画和转换坐标系之间)
        CGContextMoveToPoint(ref, width, 0);//第一个点
        CGContextAddLineToPoint(ref,width, hight/2 + 20);//2
        
        CGContextAddLineToPoint(ref,width/2 + width/4, hight);//3
        
        CGContextAddLineToPoint(ref, width/2 - width/4, hight);//4
        //
        CGContextAddLineToPoint(ref, 0, hight/2 + 20);//5
        
        
        CGContextAddLineToPoint(ref, 0, 0);
        
        
        CGContextClosePath(ref);//关闭绘制路径
        CGContextClip(ref);//剪切
        ///
        
        //坐标系转换(因为CGContextDrawImage会使用Quartz内的以左下角为(0,0)的坐标系)
        CGContextTranslateCTM(ref, 0, hight);
        CGContextScaleCTM(ref, 1, -1);
        CGContextDrawImage(ref, CGRectMake(0, 0, width, hight), [cuttImgg CGImage]);
        
        //结束绘画
        UIImage *lastCutImgg = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        
//////////////////////////////////////////////////////////
        
        
        
        ////裁剪
        //NSData *imgData = UIImageJPEGRepresentation(lastCutImgg, .2f);
        
        //NSString *lastCuttImgStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        

        //[NSUserDefaults standardUserDefaults].cutt_Imgg = lastCuttImgStr;//保存到本地
        
        //[NSUserDefaults standardUserDefaults].faceDetectorImageStr2 = lastCuttImgStr;

        
        
        
        
        
        
        ////不裁剪
        
        NSData *imgData33 = UIImageJPEGRepresentation(cuttImgg, .2f);
        
        NSString *lastCuttImgStr33 = [imgData33 base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        
        [NSUserDefaults standardUserDefaults].faceDetectorImageStr2 = lastCuttImgStr33;
        
        self.cutImgV.image = cuttImgg;
        
        
        [self.view addSubview:self.cutImgV];
        
        
        

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
