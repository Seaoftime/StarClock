//
//  duanyuwomenviewcontroller.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/30.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "duanyuwomenviewcontroller.h"



@interface ZMGameBaseViewController ()



@end

@implementation duanyuwomenviewcontroller



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    //[self setTitle:@"关于我们"];
    //[self setNavRightBtnHidden: YES];
    
    [self.view addSubview:self.image];
    [self.view addSubview:self.label];
   
    
    
    
}



-(UIImageView *)image
{

    if (_image==nil) {
        _image=[[UIImageView alloc]initWithFrame:CGRectMake(kScreen_Width/2 - 90, 100, 180, 150)];
        
        //[_image.layer setBorderWidth:2.0];
        [_image.layer setCornerRadius:10];
       // [_image.layer setMasksToBounds:YES];
       // _image.image=[UIImage imageNamed:@"AppIcon"];
        [_image setImage:[UIImage imageNamed:@"logo"]];
        
        
        //_image.backgroundColor=[UIColor redColor];
        
    }
    return _image;

}


-(UILabel *)label
{
    
    if (_label==nil) {
        _label=[[UILabel alloc]initWithFrame:CGRectMake(0, 300, kScreen_Width, 50)];
        _label.text = @"河南中梦网络科技有限公司";
       _label.textAlignment = NSTextAlignmentCenter;
        
    }
    return _label;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
