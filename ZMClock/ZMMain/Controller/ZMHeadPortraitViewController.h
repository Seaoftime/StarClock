//
//  ZMHeadPortraitViewController.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/19.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//  修改头像视图控制器
//
//

#import "ZMGameBaseViewController.h"
//#import "ZMBaseViewController.h"
//#import "TabBarView.h"



@interface ZMHeadPortraitViewController : ZMGameBaseViewController

{
    CGFloat lastscale;
    CGRect oladframe;//保存图片的的大小
    CGRect largeframe;//确定图片的放大最大的程度
    
    UIImage *faceDetectorImage;
     UIImage *suofangimage;
   
    
}

@property(nonatomic,strong)NSMutableArray*meInfoArray;

@property(nonatomic,strong)UIImage*baobaimage;

//将图片保存到本地
@property(nonatomic,strong)NSUserDefaults *preferences;







@end
