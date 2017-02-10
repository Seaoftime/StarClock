//
//  ZMForgetViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/29.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMForgetViewController.h"
#import "RegisterScrollView.h"



@interface ZMForgetViewController () <RegisterScrollViewDeletage>

@property (nonatomic,strong) RegisterScrollView *registerScrollView;
@property (nonatomic) int verifyCodeTimerTimeInterval;  //验证码定时器的全局变量值
@property (nonatomic,strong) NSTimer *verifyCodeTimer;   //验证码定时器



@end



@implementation ZMForgetViewController
@synthesize verifyCodeTimerTimeInterval;
@synthesize verifyCodeTimer;








#pragma mark  DataRequest Method
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

#pragma mark 重置密码
-(void)resetPasswordWithPhoneNumber:(NSString*)phoneNumber withVerifyCode:(NSString *)verifyCode withPawd:(NSString *)pawd withAgainPawd:(NSString *)againPawd
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
            NSDictionary *parmeters = @{@"phone":phoneNumber,
                                        @"msgkey":verifyCode,
                                        @"new_password":[pawd md5]};
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"login/reset_password.php" theParmeters:parmeters sucess:^(id object)
             {
                 if ([[MainViewControllerHelper sharedMainHelper] submitStatusWith:object])
                 {
                     [AnyObjectActivityView showWithTitle:@"密码重置成功" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                 }
                 else
                 {
                     [AnyObjectActivityView showWithTitle:@"密码重置失败，请稍后再试..." wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                 }
             } error:^(NSError *error)
             {
                 [AnyObjectActivityView showWithTitle:@"密码重置失败，请稍后再试..." wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
             }];
        }
        else
        {
            [AnyObjectActivityView showWithTitle:@"两次输入密码不一致" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
        }
    }
}



#pragma mark  LifeStyle Method



-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"找回密码"];
    
    [self setNavLeftBtnImage:@"返回按键"];
    [self setNavRightBtnImage:@""];
    
    
    
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

#pragma mark  Getter/Setter Method

-(RegisterScrollView*)registerScrollView
{
    if (_registerScrollView == nil)
    {
        _registerScrollView = [[RegisterScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height) setDeletage:self withType:ForgetType];
    }
    return _registerScrollView;
}




#pragma mark - Deletage
#pragma mark RegisterScrollViewDeletage 点击注册或者获取验证码按钮触发的方法
-(void)rgisterButtonAction:(ZMButton*)sender
{
    switch (sender.tag)
    {
        case 3:
        {
            NSLog(@"点击了提交注册");
            [self resetPasswordWithPhoneNumber:self.registerScrollView.phoneTextFieldView.inputTextField.text withVerifyCode:self.registerScrollView.verifyCode.inputTextField.text withPawd:self.registerScrollView.passwordFieldView.inputTextField.text withAgainPawd:self.registerScrollView.againPasswordFieldView.inputTextField.text];
        }
            break;
        case 4:
        {
            NSLog(@"点击了获取验证码");
            
            
            [self getVerifyCodeWithPhoneNumber:self.registerScrollView.phoneTextFieldView.inputTextField.text withAction:@"2"];
        }
            break;
    }
}





#pragma mark - Response Method
#pragma mark - Private Method
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
