//
//  ZMUsserCenterRobotNikNameViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/10/29.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMUsserCenterRobotNikNameViewController.h"

@interface ZMUsserCenterRobotNikNameViewController ()

@property (nonatomic, strong) UIView *lineV1;
@property (nonatomic, strong) UITextField *robotNickNameTF;

@property (nonatomic, strong) UIButton *resetNickNameBtn;


@end

@implementation ZMUsserCenterRobotNikNameViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    //
    
    
    [self.view addSubview:self.robotNickNameTF];
    [self.view addSubview:self.lineV1];

    
    [self.topHeadImggV addSubview:self.resetNickNameBtn];
    
    
    
}


- (UIButton *)resetNickNameBtn
{
    if (!_resetNickNameBtn) {
        _resetNickNameBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width - 54, 17, 44, 40)];
        [_resetNickNameBtn setTitle:@"保存" forState:UIControlStateNormal];
        _resetNickNameBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        
        [_resetNickNameBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [_resetNickNameBtn addTarget:self action:@selector(resetNickNameBtnClcked) forControlEvents:UIControlEventTouchUpInside];
        
        
        
    }

    return _resetNickNameBtn;
    
}




- (UITextField *)robotNickNameTF
{
    if (_robotNickNameTF == nil) {
        _robotNickNameTF = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, kScreen_Width - 40, 50)];
        _robotNickNameTF.placeholder = @"请输入爱豆昵称";
        _robotNickNameTF.textColor = [UIColor blackColor];
        _robotNickNameTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        _robotNickNameTF.textAlignment = NSTextAlignmentLeft;
        _robotNickNameTF.font = [UIFont systemFontOfSize:17];
    }
    return _robotNickNameTF;
}

- (UIView *)lineV1
{
    if (_lineV1 == nil) {
        _lineV1 = [[UIView alloc] initWithFrame:CGRectMake(20 , 150, kScreen_Width - 40, 1)];
        _lineV1.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1.0];
        
        
    }
    return _lineV1;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];

}





#pragma mark -------------------------------保存按钮
- (void)resetNickNameBtnClcked
{
   
    [NSUserDefaults standardUserDefaults].aidouNickName =  self.robotNickNameTF.text;
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //
        [AnyObjectActivityView showWithTitle:@"更新成功" wittImageName:SubmitSucceedVerify withActivityMode:ActivityTopImageView withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
        
        
        
        [self.navigationController popViewControllerAnimated:YES];
        

        
    });
    
//    //上传到服务器里
//    NSMutableDictionary *parmeters = [NSMutableDictionary dictionary];
//    
//    [parmeters setObject:self.robotNickNameTF.text forKey:@"robot_nickname"];
//    [parmeters setObject:@"0" forKey:@"nickname"];
//    [parmeters setObject:@"0" forKey:@"sex"];
//    [parmeters setObject:@"0" forKey:@"birth"];
//    [parmeters setObject:@"0" forKey:@"game_avatar1"];
//    [parmeters setObject:@"0" forKey:@"robot_avatar"];
//    
//    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
//    {
//        if ([[ZMUserInfo sharedUserInfo] isUserInfo])
//        {
//            [parmeters setObject:[ZMUserInfo sharedUserInfo].user_id forKey:@"user_id"];
//            [parmeters setObject:[ZMUserInfo sharedUserInfo].sign forKey:@"sign"];
//            
//            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"user/update_user_profile.php" theParmeters:parmeters sucess:^(id object)
//             {
//                 if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
//                 {
//                     // NSLog(@"_-----object----%@",object);
//                     //判断修改宝宝昵称是否完成
//                     NSDictionary *data = [object objectForKey:@"data"];
//                     if ([data count])
//                     {
//                         NSDictionary*task=[data objectForKey:@"task"];
//                         if ([task isEqual:@""])
//                             
//                         {
//                             [AnyObjectActivityView showWithTitle:@"更新成功" wittImageName:SubmitSucceedVerify withActivityMode:ActivityTopImageView withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
//                             
//                             
//                             
//                              [self.navigationController popViewControllerAnimated:YES];
//                             
//                             
//                         }
//                         
//                         else
//                         {
//                             NSInteger add_gold=[[task objectForKey:@"add_gold"]integerValue];
//                             NSInteger task_id=[[task objectForKey:@"task_id"]integerValue];
//                             if (task_id==2)
//                             {
//                                 [AnyObjectActivityView showWithTitle:[NSString stringWithFormat:@"%@"@"%ld",@"金币+",(long)add_gold] wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
//                             }
//                         }
//                     }
//                     
//                 }
//                 
//             } error:^(NSError *error)
//             {
//                 [AnyObjectActivityView showWithTitle:@"更新失败" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
//             }];
//        }
//    }

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
