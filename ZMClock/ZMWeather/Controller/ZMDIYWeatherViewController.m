//
//  ZMDIYWeatherViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/21.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//
//  DIY天气语音
//
//
//

#import "ZMDIYWeatherViewController.h"
#import "ZMImportRecordViewController.h"
#import "ZMWeatherRecordViewController.h"
#import "WoDiyView.h"
#import "GuanFangView.h"


#import "ZMWeatherViewController.h"




@interface ZMDIYWeatherViewController ()

/**
 导航栏顶部官方语音按钮
 */
@property (nonatomic,strong) ZMButton *guanFangButton;

/**
 我的DIY语音按钮
 */
@property (nonatomic,strong) ZMButton *woDiyButton;

/**
 录制天气按钮
 */
@property (nonatomic,strong) ZMButton *recordWeatherButton;

/**
 导入天气按钮
 */
@property (nonatomic,strong) ZMButton *importWeatherButton;




@property (nonatomic,strong) GuanFangView *guanfangView;
@property (nonatomic,strong) WoDiyView *woDiyView;


@end



@implementation ZMDIYWeatherViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"DIY天气语音"];
    [self setNavRightBtnHidden:YES];
    [self.view addSubview:self.recordWeatherButton];
    [self.view addSubview:self.importWeatherButton];
    [self.view addSubview:self.guanFangButton];
    [self.view addSubview:self.woDiyButton];
    
    [self.view addSubview:self.guanfangView];
    [self.view addSubview:self.woDiyView];
    [self.woDiyView setHidden:YES];
    
    

    
}



-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}




#pragma mark - Getter / Setter
-(ZMButton*)guanFangButton
{
    if (_guanFangButton == nil)
    {
       
        _guanFangButton = [[ZMButton alloc]initWithFrame:CGRectMake(0, 65, kScreen_Width/2, 50)];
        [_guanFangButton setImage:[UIImage imageNamed:@"官方语音.png"] forState:UIControlStateNormal];
        [_guanFangButton addTarget:self action:@selector(recordAndDiyButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_guanFangButton setTag:1];
    }
    return _guanFangButton;
}

-(ZMButton*)woDiyButton
{
    if (_woDiyButton == nil)
    {
       
        _woDiyButton = [[ZMButton alloc]initWithFrame:CGRectMake(kScreen_Width/2, 65, kScreen_Width/2, 50)];
        
        
        
        [_woDiyButton setImage:[UIImage imageNamed:@"我的DIY语音.png"] forState:UIControlStateNormal];
         [_woDiyButton addTarget:self action:@selector(recordAndDiyButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_woDiyButton setTag:2];
        
    }
    return _woDiyButton;
}


-(ZMButton *)recordWeatherButton
{
    if (_recordWeatherButton == nil)
    {
        //_recordWeatherButton = [[ZMButton alloc]initWithFrame:CGRectMake(20, 115, 113, 35)];
        _recordWeatherButton = [[ZMButton alloc]initWithFrame:CGRectMake(20, 115, 113, 35)];
        
        [_recordWeatherButton setImage:[UIImage imageNamed:@"录制天气语音.png"] forState:UIControlStateNormal];
        [_recordWeatherButton addTarget:self action:@selector(recordAndDiyButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_recordWeatherButton setTag:3];
    }
    return _recordWeatherButton;
}

-(ZMButton *)importWeatherButton
{
    if (_importWeatherButton == nil)
    {
        _importWeatherButton = [[ZMButton alloc]initWithFrame:CGRectMake(kScreen_Width-133, 115, 113, 35)];
        [_importWeatherButton setImage:[UIImage imageNamed:@"导入天气语音.png"] forState:UIControlStateNormal];
        [_importWeatherButton addTarget:self action:@selector(recordAndDiyButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_importWeatherButton setTag:4];
    }
    return _importWeatherButton;
}



-(WoDiyView*)woDiyView
{
    if (_woDiyView == nil)
    {
        _woDiyView = [[WoDiyView alloc]initWithFrame:CGRectMake(0, 155, kScreen_Width, kScreen_Height-160)];
    }
    return _woDiyView;
}


-(GuanFangView *)guanfangView
{
    if (_guanfangView == nil)
    {
        _guanfangView = [[GuanFangView alloc]initWithFrame:CGRectMake(0, 110, kScreen_Width, kScreen_Height-110)];
    }
    return _guanfangView;
}



#pragma mark - 按钮触发的方法 
-(void)recordAndDiyButtonAction:(ZMButton *)sender
{
    switch (sender.tag)
    {
        case 1:
        {
            [self.woDiyView setHidden:YES];
            [self.guanfangView setHidden:NO];
        }
            break;
        case 2:
        {
            [self.woDiyView setHidden:NO];
            [self.guanfangView setHidden:YES];
        }
            break;
        case 3:
        {
            
            [self.navigationController pushViewController:[[ZMWeatherRecordViewController alloc]init] animated:YES];
        }
            break;
        case 4:
        {
            [self.navigationController pushViewController:[[ZMImportRecordViewController alloc]init] animated:YES];
        }
            break;
    }
}

-(void)navLeftBtnAction:(UIButton *)sender
{
    [self.navigationController pushViewController:[[ZMWeatherViewController alloc]init] animated:YES];
    
    
     //判断天气 DIY任务是否完成
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        if ([[ZMUserInfo sharedUserInfo] isUserInfo])
        {
            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,@"sign":[ZMUserInfo sharedUserInfo].sign };
            
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"weather/add_weather_diy.php" theParmeters:parmeters sucess:^(id object)
             {
                 if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                 {
                     NSDictionary *data = [object objectForKey:@"data"];
                     if ([data count])
                     {
                         NSDictionary*task=[data objectForKey:@"task"];
                         if ([task isEqual:@""])
                         {
                             
                         }
                         
                         else
                         {
                             NSInteger add_gold=[[task objectForKey:@"add_gold"]integerValue];
                             NSInteger task_id=[[task  objectForKey:@"task_id"]integerValue];
                             if (task_id==9)
                             {
                                 
                                 [AnyObjectActivityView showWithTitle:[NSString stringWithFormat:@"%@"@"%ld",@"金币+",(long)add_gold] wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                             }
                         }
                     }
                 }
             }
            error:^(NSError *error) {}];
        }
    }
    else
    {
        [AnyObjectActivityView showWithTitle:NetWorkFail wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
    }

    



}



@end
