//
//  ZMRecordingDiscViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/2.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMRecordDiscViewController.h"
#import "ZMImportRecordViewController.h"

@interface ZMRecordDiscViewController ()

@property (nonatomic,strong) ZMButton *luZhiButton;
@property (nonatomic,strong) ZMButton *daoRuButton;
@property (nonatomic,strong) ZMButton *uploadButton;

@property (nonatomic,strong) ZMImageView *tianqiImageView;


@end

@implementation ZMRecordDiscViewController

#pragma mark  DataRequest Method
#pragma mark  LifeStyle Method
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor: RGBAlpha(202.0, 202.0, 204.0, 1.0)];
    [self.view addSubview:self.luZhiButton];
    [self.view addSubview:self.daoRuButton];
    [self.view addSubview:self.uploadButton];
    [self.view addSubview:self.tianqiImageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



#pragma mark  Getter/Setter Method
-(ZMButton*)luZhiButton
{
    if (_luZhiButton == nil)
    {
        _luZhiButton = [[ZMButton alloc]initWithImageViewFrame:CGRectMake(10, 80, (kScreen_Width-40)/3, 40) withOneTitle:@"录制" withTwoTitle:@"录制我的语音"];
    }
    return _luZhiButton;
}

-(ZMButton*)daoRuButton
{
    if (_daoRuButton == nil)
    {
        _daoRuButton = [[ZMButton alloc]initWithImageViewFrame:CGRectMake(20+(kScreen_Width-40)/3, 80, (kScreen_Width-40)/3, 40) withOneTitle:@"导入" withTwoTitle:@"导入TA的语音"];
        [_daoRuButton addTarget:self action:@selector(daoRuButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _daoRuButton;
}

-(ZMButton*)uploadButton
{
    if (_uploadButton == nil)
    {
        _uploadButton = [[ZMButton alloc]initWithImageViewFrame:CGRectMake(30+2*((kScreen_Width-40)/3), 80, (kScreen_Width-40)/3, 40) withOneTitle:@"已上传" withTwoTitle:@"查看上传的语音"];
    }
    return _uploadButton;
}


-(ZMImageView*)tianqiImageView
{
    if (_tianqiImageView == nil)
    {
        _tianqiImageView = [[ZMImageView alloc]initWithFrame:CGRectMake(10, 130, ((kScreen_Width-40)/3), 140)];
        [_tianqiImageView setDrawImageName:@"天气预报.png"];
    }
    return _tianqiImageView;
}



#pragma mark  Delegate Method
#pragma mark  Response Method
-(void)daoRuButtonAction:(ZMButton*)sender
{
    [self.navigationController pushViewController:[[ZMImportRecordViewController alloc] init] animated:YES];
}



#pragma mark  PrivateMethod

@end
