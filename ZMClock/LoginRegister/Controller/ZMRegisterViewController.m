//
//  ZMRegisterViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/29.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMRegisterViewController.h"
#import "RegisterScrollView.h"
#import "NSString+Extension.h"
#import "MainViewControllerHelper.h"
#import "ZMProtocolViewController.h"

#import "ZMLoginViewController.h"



@interface ZMRegisterViewController () <RegisterScrollViewDeletage>

@property (nonatomic,strong) RegisterScrollView *registerScrollView;

@property (nonatomic) int verifyCodeTimerTimeInterval;  //验证码定时器的全局变量值
@property (nonatomic,strong) NSTimer *verifyCodeTimer;   //验证码定时器
@property (nonatomic) BOOL isMark; //!< 是否已经点击了同意协议

@property (nonatomic, strong) UIView *navigaitonVV;

@end

@implementation ZMRegisterViewController
@synthesize verifyCodeTimerTimeInterval;
@synthesize verifyCodeTimer;





#pragma mark 获取手机验证码
/**
 phoneNumber:手机号
 action: 1：注册时候获取验证码  2：找回密码的时候获取验证码
 */
-(void)getVerifyCodeWithPhoneNumber:(NSString*)phoneNumber withAction:(NSString*)action
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        if ([phoneNumber isEqualToString:@""])
        {
            [AnyObjectActivityView showWithTitle:@"手机号码不能为空" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
        }
        else
        {
            /**
             开始启用
             */
            
            [self setVerifyCodeTimerTimeInterval:59];
            self.verifyCodeTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(verifyCodeTimerAction:) userInfo:@"开始获取验证码" repeats:YES];
            
            
            NSDictionary *parmeters = @{@"phone":phoneNumber,
                                        @"action":action};
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"login/messagekey.php" theParmeters:parmeters sucess:^(id object)
             {
                 if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                 {
                     [AnyObjectActivityView showWithTitle:@"验证码获取成功" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                 }
             } error:^(NSError *error){}];
        }
    }
}



#pragma mark 注册账号
-(void)submitRegisterWithPhoneNumber:(NSString*)phoneNumber withVerifyCode:(NSString *)verifyCode withPawd:(NSString *)pawd withAgainPawd:(NSString *)againPawd
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        if ([phoneNumber isEqualToString:@""])
        {
            [AnyObjectActivityView showWithTitle:@"手机号码不能为空" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
        }
        else if ([verifyCode isEqualToString:@""])
        {
            [AnyObjectActivityView showWithTitle:@"验证码不能为空" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
        }
        else if ([pawd isEqualToString:@""])
        {
            [AnyObjectActivityView showWithTitle:@"密码不能为空" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
        }
        else if ([againPawd isEqualToString:@""])
        {
            [AnyObjectActivityView showWithTitle:@"密码不能为空" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
        }
        else if ([pawd isEqualToString:againPawd])
        {
            if (self.isMark)
            {
                NSDictionary *parmeters = @{@"phone":phoneNumber,
                                            @"msgkey":verifyCode,
                                            @"password":[pawd md5],
                                            @"invite_code":@"0"};
                [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"login/register.php" theParmeters:parmeters sucess:^(id object)
                 {
                     if ([[MainViewControllerHelper sharedMainHelper] submitStatusWith:object])
                     {
                         [AnyObjectActivityView showWithTitle:@"注册成功" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                         
                         
                         [self.navigationController popViewControllerAnimated:YES];
                         
                         
                         
                     }
                     else
                     {
                         [AnyObjectActivityView showWithTitle:@"注册失败，请稍后再试..." wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                     }
                 } error:^(NSError *error)
                 {
                     [AnyObjectActivityView showWithTitle:@"注册失败，请稍后再试..." wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                 }];
            }
            else
            {
                [AnyObjectActivityView showWithTitle:@"必须同意用户协议" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
            }
        }
        else
        {
            [AnyObjectActivityView showWithTitle:@"两次输入密码不一致" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
        }
    }
}




-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"注册"];
    
    [self setNavLeftBtnImage:@"返回按键"];
    [self setNavRightBtnImage:@""];
    
//    self.navigaitonVV = [[UIView alloc] initWithFrame:CGRectMake(50, 0, kScreen_Width, 64)];
//    self.navigaitonVV.backgroundColor = [UIColor clearColor];
//    
//    [self.baseNavigation addSubview:self.navigaitonVV];
    
    
    
    [self.view addSubview:self.registerScrollView];
    
}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}



-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}


-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}


-(RegisterScrollView*)registerScrollView
{
    if (_registerScrollView == nil)
    {
        _registerScrollView = [[RegisterScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height) setDeletage:self withType:RegisterType];
        [self setIsMark:YES];
    }
    return _registerScrollView;
}




#pragma mark - Deletage
#pragma mark RegisterScrollViewDeletage
-(void)rgisterButtonAction:(ZMButton*)sender
{
    switch (sender.tag)
    {
        case 1:
        {
            switch (sender.isMark)
            {
                case 1:
                {
                    [sender setIsMark:2];
                    [self setIsMark:NO];
                }
                    break;
                case 2:
                {
                    [sender setIsMark:1];
                    [self setIsMark:YES];
                }
                    break;
            }
            NSLog(@"点击对号");
        }
            break;
        case 2:
        {
            NSLog(@"点击了用户协议");
            [self.navigationController pushViewController:[[ZMProtocolViewController alloc]init] animated:YES];
            
        }
            break;
        case 3:
        {
            NSLog(@"点击了提交注册");
            [self submitRegisterWithPhoneNumber:self.registerScrollView.phoneTextFieldView.inputTextField.text withVerifyCode:self.registerScrollView.verifyCode.inputTextField.text withPawd:self.registerScrollView.passwordFieldView.inputTextField.text withAgainPawd:self.registerScrollView.againPasswordFieldView.inputTextField.text];
            
//            [self.navigationController pushViewController:[[ZMLoginViewController alloc]init] animated:YES];
        }
            break;
        case 4:
        {
            NSLog(@"点击了获取验证码");
            
            
            [self getVerifyCodeWithPhoneNumber:self.registerScrollView.phoneTextFieldView.inputTextField.text withAction:@"1"];
            
            
        }
            break;
    }
}



#pragma mark Private
#pragma mark 获取验证码触发的方法
-(void)verifyCodeTimerAction:(NSTimer*)theTimer
{
    if (verifyCodeTimerTimeInterval > 0)
    {
        [self.registerScrollView.verifyCode.verifyCodeButton setEnabled:NO];
        [self.registerScrollView.verifyCode.verifyCodeButton setTitle:[NSString stringWithFormat:@"%d秒后重发",verifyCodeTimerTimeInterval] forState:UIControlStateNormal];
        [self setVerifyCodeTimerTimeInterval:(verifyCodeTimerTimeInterval-1)];
    }
    else
    {
        [self.verifyCodeTimer invalidate];
        [self.registerScrollView.verifyCode.verifyCodeButton setEnabled:YES];
        [self setVerifyCodeTimerTimeInterval:59];
        [self.registerScrollView.verifyCode.verifyCodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    }
}




@end
