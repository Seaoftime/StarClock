//
//  ZMLoginViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/29.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMLoginViewController.h"
#import "ZMTextFieldView.h"
#import "ZMRegisterViewController.h"
#import "ZMForgetViewController.h"
#import "MainViewControllerHelper.h"



#import "ZMTourist.h"
#import "ZMBaseViewController.h"

/////////////
//第三方登录
#import "WMAuthManager.h"

#import "ZMBaseNavigationController.h"
#import "ZMMainViewController.h"


@interface ZMLoginViewController ()

@property (nonatomic,strong) ZMTextFieldView *phoneTextField;
@property (nonatomic,strong) ZMTextFieldView *passwordTextField;
@property (nonatomic,strong) ZMButton *loginButton; //!< 登录按钮
@property (nonatomic,strong) ZMButton *registerButton; //!< 注册按钮
@property (nonatomic,strong) ZMButton *forgetButton;//!< 注册按钮


////第三方登录按钮

@property (nonatomic, strong) UIButton *QQLoginBtn;
@property (nonatomic, strong) UIButton *WXLoginBtn;
@property (nonatomic, strong) UIButton *WBLoginBtn;
@property (nonatomic, strong) UILabel *jieshaoLb;
@property (nonatomic, strong) UIView *lineV1;
@property (nonatomic, strong) UIView *lineV2;

@property (nonatomic, strong) UILabel *nameLb;//用户昵称
@property (nonatomic, strong) UIImageView *avatarImgV;//用户头像
@property (nonatomic, copy) NSString *loginTypeStr;// qq weibo
@property (nonatomic, copy) NSString *openn_Id;


@property (nonatomic, strong) UIButton *dismissBtn;///返回到主页
@property (nonatomic, strong) UIImageView *topHeadImggV;


@end



@implementation ZMLoginViewController


#pragma mark 登录服务端
- (void)loginWithPhoneNumber:(NSString*)phoneNumber withPawd:(NSString *)pawd
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        
        [AnyObjectActivityView showWithTitle:@"正在登录，请稍后..." wittImageName:nil withActivityMode:ActivityModeIndicatorAndText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];

        
        NSDictionary *parmeters = @{@"phone":phoneNumber,
                                    @"password":[pawd md5],
                                    @"os_type":@"2",
                                    @"os_ver":[NSString stringWithFormat:@"%.3f",IOSSystem],
                                    @"app_ver":AppVersion};
        [[AFNetworkingHelper sharedNetworkingHelper]postWithUrl:@"login/login.php" theParmeters:parmeters sucess:^(id object)
         {
             
             if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
             {
                 
                 NSDictionary *data  =[object objectForKey:@"data"];
                 
                 
                 NSLog(@"--------data----%@---",data);
                 
                 [[ZMUserInfo sharedUserInfo] setUserInfo:data];
                 [[MainViewControllerHelper sharedMainHelper] resetLoginWithType:1];
             }
             
                       
         } error:^(NSError *error)
         {
            [AnyObjectActivityView showWithTitle:NetWorkFail wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
         }];
        
    }
    
    
}


-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"登录"];
    [self.view addSubview:self.phoneTextField];
    [self.view addSubview:self.passwordTextField];
    
    
    [self.view addSubview:self.loginButton];
    [self.view addSubview:self.forgetButton];
    [self.view addSubview:self.registerButton];
    
    [self.view addGestureRecognizer:self.swiperecognizer];
  
///
    //[self setupNameLbAndAvatarImgV];
    [self addQQWBLoginButton];
    [self setupJieshaoLbandLineV];
    
    
}


#pragma mark - UI

- (void)setupNameLbAndAvatarImgV
{
    self.nameLb = [[UILabel alloc] initWithFrame:CGRectMake(kScreen_Width/2 - 80, kScreen_Height/2 + 130, 160, 40)];
    self.nameLb.backgroundColor = [UIColor orangeColor];

    self.nameLb.font = [UIFont systemFontOfSize:17];
    [self.nameLb.layer setCornerRadius:5];
    [self.nameLb.layer setMasksToBounds:YES];
    
//
    self.avatarImgV = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width/2 - 40, kScreen_Height/2 + 40, 80, 80)];
    self.avatarImgV.backgroundColor = [UIColor orangeColor];
    [self.avatarImgV.layer setCornerRadius:40];
    [self.avatarImgV.layer setMasksToBounds:YES];

    [self.view addSubview:self.nameLb];
    [self.view addSubview:self.avatarImgV];
}



- (void)setupJieshaoLbandLineV
{
    
    BOOL iphone4 = [ZMSystemTool iPhone4Device];
    if (iphone4 == YES) {
        self.jieshaoLb = [[UILabel alloc] initWithFrame:CGRectMake(kScreen_Width/2 - 80 , 360, 160, 40)];
    }else {
        
        self.jieshaoLb = [[UILabel alloc] initWithFrame:CGRectMake(kScreen_Width/2 - 80 , 400, 160, 40)];
    }
    //self.jieshaoLb = [[UILabel alloc] initWithFrame:CGRectMake(kScreen_Width/2 - 80 , 400, 160, 40)];
    self.jieshaoLb.backgroundColor = [UIColor whiteColor];
    self.jieshaoLb.font = [UIFont systemFontOfSize:14];
    self.jieshaoLb.textAlignment = NSTextAlignmentCenter;
    self.jieshaoLb.text = @"或其他方式直接登录";
    
    if (iphone4 == YES) {
        self.lineV1 = [[UIView alloc] initWithFrame:CGRectMake(kScreen_Width/2 - 80 - 50 + 10, 380, 50, 1)];
        
        self.lineV2 = [[UIView alloc] initWithFrame:CGRectMake(kScreen_Width/2 + 80 - 10, 380, 50, 1)];
    }else {
        
        self.lineV1 = [[UIView alloc] initWithFrame:CGRectMake(kScreen_Width/2 - 80 - 50 + 10, 420, 50, 1)];
        
        self.lineV2 = [[UIView alloc] initWithFrame:CGRectMake(kScreen_Width/2 + 80 - 10, 420, 50, 1)];
    }
    //self.lineV1 = [[UIView alloc] initWithFrame:CGRectMake(kScreen_Width/2 - 80 - 50 + 10, 420, 50, 1)];
    self.lineV1.backgroundColor  = [UIColor grayColor];
    
    //self.lineV2 = [[UIView alloc] initWithFrame:CGRectMake(kScreen_Width/2 + 80 - 10, 420, 50, 1)];
    self.lineV2.backgroundColor  = [UIColor grayColor];
    


    [self.view addSubview:self.jieshaoLb];
    [self.view addSubview:self.lineV1];
    [self.view addSubview:self.lineV2];
    
    
    

}


- (void)dismissBtnuttonClicked
{
    
    //ZMBaseNavigationController *navRoot = [[ZMBaseNavigationController alloc]initWithRootViewController:[ZMMainViewController alloc]];
    //[kWindow setRootViewController:navRoot];
    
    [kWindow setRootViewController:[[ZMMainViewController alloc] init]];

}



#pragma mark - QQ登录

- (void)addQQWBLoginButton
{
    
    
    self.topHeadImggV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 64)];
    
    self.topHeadImggV.backgroundColor = RGB(236, 128, 172);
    self.topHeadImggV.userInteractionEnabled = YES;
    
    [self.view addSubview:self.topHeadImggV];

    
    
    self.dismissBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 10, 50, 50)];
    [self.dismissBtn addTarget:self action:@selector(dismissBtnuttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.dismissBtn setBackgroundImage:[UIImage imageNamed:@"返回按键"] forState:UIControlStateNormal];
    //[self.dismissBtn.layer setCornerRadius:25];
    //[self.dismissBtn.layer setMasksToBounds:YES];
    [self.topHeadImggV addSubview:self.dismissBtn];
    
    
    
    BOOL iphone4 = [ZMSystemTool iPhone4Device];
    
    if (iphone4 == YES) {
        
        self.QQLoginBtn = [[UIButton alloc]initWithFrame:CGRectMake((kScreen_Width/2 - 30) - (((kScreen_Width/3 * 2) - (kScreen_Width/2 + 25))) - 50 + 40, 400, 50, 50)];
        
    }else {
        
        self.QQLoginBtn = [[UIButton alloc]initWithFrame:CGRectMake((kScreen_Width/2 - 30) - (((kScreen_Width/3 * 2) - (kScreen_Width/2 + 25))) - 50 + 40, 450, 50, 50)];
        
    }
    //self.QQLoginBtn = [[UIButton alloc]initWithFrame:CGRectMake((kScreen_Width/2 - 30) - (((kScreen_Width/3 * 2) - (kScreen_Width/2 + 25))) - 50 + 40, 450, 50, 50)];
    
    [self.QQLoginBtn addTarget:self action:@selector(QQLoginButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.QQLoginBtn setBackgroundImage:[UIImage imageNamed:@"qq"] forState:UIControlStateNormal];
    [self.QQLoginBtn.layer setCornerRadius:25];
    [self.QQLoginBtn.layer setMasksToBounds:YES];
    //[self.QQLoginBtn setTitle:@"QQ" forState:UIControlStateNormal];
    
    self.WXLoginBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreen_Width/2 - 30, kScreen_Height - 100, 60, 60)];
    [self.WXLoginBtn addTarget:self action:@selector(WXLoginButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.WXLoginBtn setBackgroundColor:TOPBGColor];
    [self.WXLoginBtn.layer setCornerRadius:30];
    [self.WXLoginBtn.layer setMasksToBounds:YES];
    [self.WXLoginBtn setTitle:@"微信" forState:UIControlStateNormal];
    
    
    if (iphone4 ==  YES) {
        self.WBLoginBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreen_Width/3 * 2  - 40, 400, 50, 50)];
    }else {
        
        self.WBLoginBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreen_Width/3 * 2  - 40, 450, 50, 50)];
        
    }
    //self.WBLoginBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreen_Width/3 * 2  - 40, 450, 50, 50)];
    [self.WBLoginBtn addTarget:self action:@selector(WBLoginButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.WBLoginBtn setBackgroundImage:[UIImage imageNamed:@"微博"] forState: UIControlStateNormal];
    [self.WBLoginBtn.layer setCornerRadius:25];
    [self.WBLoginBtn.layer setMasksToBounds:YES];
    //[self.WBLoginBtn setTitle:@"微博" forState:UIControlStateNormal];
    
    
    [self.view addSubview:self.QQLoginBtn];
    //[self.view addSubview:self.WXLoginBtn];
    [self.view addSubview:self.WBLoginBtn];
    
    
///第三方安装检测
    if([WMAuthManager isAppInstalled:WMAuthTencent]){
        
        
    }else {
      
        self.QQLoginBtn.userInteractionEnabled = NO;
        //self.QQLoginBtn.alpha = 0.3;
        self.QQLoginBtn.hidden = YES;
        
        
    }

    
    
    if([WMAuthManager isAppInstalled:WMAuthWeibo]){
        
        
    }else {
        
        
        
        self.WBLoginBtn.userInteractionEnabled = NO;
        //self.WBLoginBtn.alpha = 0.3;
        self.WBLoginBtn.hidden = YES;
        
    }

    
    
//    if([WMAuthManager isAppInstalled:WMAuthWeixin]){
//        
//        
//    }else {
//    
//        //self.WXLoginBtn.hidden = YES;
//        
//        //[AnyObjectActivityView showWithTitle:@"您没有安装微信" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
//        
//        self.WXLoginBtn.userInteractionEnabled = NO;
//        self.WXLoginBtn.alpha = 0.4;
//    
//    }

}

#pragma mark 手势进入游戏视图
#pragma mark swiperecognizer
-(UISwipeGestureRecognizer*)swiperecognizer
{
    if (_swiperecognizer == nil)
    {
        _swiperecognizer=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiperecognizer:)];
        _swiperecognizer.direction=UISwipeGestureRecognizerDirectionLeft;
       _swiperecognizer.numberOfTouchesRequired=1;
        
        
        
        
    }
    return _swiperecognizer;
}

#pragma mark 手势从登陆页面进入游戏视图的方法
#pragma mark swiperecognizer


-(void)swiperecognizer:(UISwipeGestureRecognizer *)Slidingtotheleft
{
      
    //[self.navigationController pushViewController:[[ZMTourist alloc]init] animated:YES];
    
}


#pragma  mark 使登陆页面的导航条消失
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.baseNavigation removeFromSuperview];
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



#pragma mark - Getter / Setter
-(ZMTextFieldView*)phoneTextField
{
    if (_phoneTextField == nil)
    {
        _phoneTextField = [[ZMTextFieldView alloc]initWithLineViewFrame:CGRectMake(30, 100, kScreen_Width-60, 30) withImageName:@"电话号"];
        [_phoneTextField.inputTextField setKeyboardType:UIKeyboardTypeNumberPad];
        [_phoneTextField.inputTextField setPlaceholder:@"请输入手机号"];
    }
    return _phoneTextField;
}


- (ZMTextFieldView*)passwordTextField
{
    if (_passwordTextField == nil)
    {
        _passwordTextField = [[ZMTextFieldView alloc]initWithLineViewFrame:CGRectMake(30, 150, kScreen_Width-60, 30) withImageName:@"密码"];
        [_passwordTextField.inputTextField setSecureTextEntry:YES];
        [_passwordTextField.inputTextField setPlaceholder:@"请输入密码"];
    }
    return _passwordTextField;
}



-(ZMButton *)loginButton
{
    if (_loginButton == nil)
    {
        _loginButton = [[ZMButton alloc]initWithFrame:CGRectMake(kScreen_Width/2-200/2, 220, 200, 40)];
        [_loginButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_loginButton setBackgroundColor:MainColor];
        [_loginButton.layer setCornerRadius:20];
        [_loginButton.layer setMasksToBounds:YES];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setTag:1];
    }
    return _loginButton;
}


-(ZMButton *)forgetButton
{
    if (_forgetButton == nil)
    {
        _forgetButton = [[ZMButton alloc]initWithFrame:CGRectMake(kScreen_Width/2, 280, 120, 50)];
        [_forgetButton.titleLabel setFont:[UIFont systemFontOfSize:15.0]];
        [_forgetButton setTitle:@"忘记密码" forState:UIControlStateNormal];
        [_forgetButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_forgetButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_forgetButton setTag:2];
    }
    return _forgetButton;
}


-(ZMButton *)registerButton
{
    if (_registerButton == nil)
    {
        _registerButton = [[ZMButton alloc]initWithFrame:CGRectMake(kScreen_Width/2-120/2, 320, 120, 50)];
        [_registerButton.titleLabel setFont:[UIFont systemFontOfSize:15.0]];
        [_registerButton setTitle:@"注册账号" forState:UIControlStateNormal];
        [_registerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_registerButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_registerButton setTag:3];
    }
    return _registerButton;
}






#pragma mark 登录、注册、忘记密码按钮触发的方法
-(void)buttonAction:(ZMButton*)sender
{
    switch (sender.tag)
    {
        case 1:
        {
            [self loginWithPhoneNumber:self.phoneTextField.inputTextField.text withPawd:self.passwordTextField.inputTextField.text];
        }
            break;
        case 2:
        {
            [self.navigationController pushViewController:[[ZMForgetViewController alloc]init] animated:YES];
        }
            break;
        case 3:
        {
            
            ZMRegisterViewController *registerVC = [[ZMRegisterViewController alloc]init];
            //registerVC.titleeLb.text = @"注册";
            
            [self.navigationController pushViewController:registerVC animated:YES];
        }
            break;
       
    }
    
}

#pragma mark - 第三方登录

#pragma mark - QQ
- (void)QQLoginButtonClicked:(UIButton *)QQBtn
{

    // 如果不判断安装，没安装会自动弹出SDK自带的Webview进行授权
    __weak typeof(self) weakself = self;
    [WMAuthManager sendAuthType:WMAuthTencent
                      withBlock:^(BOOL isOK, NSString *openID, NSString *unionID) {
                          
                          
                          self.loginTypeStr = @"qq";
                          
                          
                          [weakself login:isOK withInfo:openID withType:@"qq" unionID:unionID];
                      }
                   withUserInfo:^(NSString *userName, NSString *userAvatar) {
                       [weakself showUserInfo:userName withAvatar:userAvatar];
                   }
                withUserInfoImg:nil
                 withController:nil];
    
    
}


#pragma mark - 微信
- (void)WXLoginButtonClicked:(UIButton *)WXBtn
{
    //if([WMAuthManager isAppInstalled:WMAuthWeixin]){
        
        __weak typeof(self) weakself = self;
        [WMAuthManager sendAuthType:WMAuthWeixin
                          withBlock:^(BOOL isOK, NSString *openID, NSString *unionID) {
                              [weakself login:isOK withInfo:openID withType:@"weixin" unionID:unionID];
                          }
                       withUserInfo:^(NSString *userName, NSString *userAvatar) {
                           [weakself showUserInfo:userName withAvatar:userAvatar];
                       }
                    withUserInfoImg:nil
                     withController:self];
        
   // }else {
        
//        [AnyObjectActivityView showWithTitle:@"您没有安装微信" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
//        
//        self.WXLoginBtn.userInteractionEnabled = NO;
//        self.WXLoginBtn.alpha=0.4;
    
    //};
}

#pragma mark - 微博
- (void)WBLoginButtonClicked:(UIButton *)WBBtn
{
    // 如果不判断安装，没安装会自动弹出SDK自带的Webview进行授权
    if ([WMAuthManager isAppInstalled:WMAuthWeibo]) {
        
        self.loginTypeStr = @"weibo";
        
        
        __weak typeof(self) weakself = self;
    
        [WMAuthManager sendAuthType:WMAuthWeibo
                      withBlock:^(BOOL isOK, NSString *openID, NSString *unionID) {
                          [weakself login:isOK withInfo:openID withType:@"sinaweibo" unionID:unionID];
                      }
                   withUserInfo:^(NSString *userName, NSString *userAvatar) {
                       [weakself showUserInfo:userName withAvatar:userAvatar];
                   }
                withUserInfoImg:nil
                 withController:nil];
    } else {
            // 嵌入式输入账号密码模式
        [AnyObjectActivityView showWithTitle:@"您没有安装微博" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
    }

    
    
}




#pragma mark - 处理结果

- (void)showUserInfo:(NSString *)userName withAvatarImg:(UIView *)userAvatar
{
    _nameLb.text = userName;
    //[self.view addSubview:userAvatar];
    //[_avatarImg setImage:userAvatar];
}


//QQ 1
- (void)login:(BOOL)isOK withInfo:(NSString *)openID withType:(NSString *)type unionID:(NSString *)unionID
{
    if (isOK) {
        
        //[NSUserDefaults standardUserDefaults].open_id = openID;
        
        self.openn_Id = openID;
        
        
        [self login:openID withType:type unionID:unionID];
    } else {
        //  错误提示
        _nameLb.text = openID;
        
        NSLog(@"%@",openID);
    }
}



//QQ 2
- (void)login:(NSString *)openID withType:(NSString *)type unionID:(NSString *)unionID
{
    // 可以登录了
    //192.168.1.111/serverpro/login/social_login.php
    
    
    
    NSLog(@" ____openID %@______   _____unionID %@______",openID,unionID);
    
    
    if (unionID.length>0 && ![unionID isEqualToString:@"0"]) {
        _nameLb.text = [NSString stringWithFormat:@"unionID:%@", unionID];
    } else {
        _nameLb.text = [NSString stringWithFormat:@"openID:%@", openID];
    }
    
    
}

//QQ 3
- (void)showUserInfo:(NSString *)userName withAvatar:(NSString *)userAvatar
{
    //_nameLb.text = userName;
    //[_avatarImgV setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:userAvatar]]]];
    
    
    
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        
        NSString *openid = self.openn_Id;
        NSLog(@"%@",openid);
        
        NSDictionary *parmeters = @{@"plat_type":self.loginTypeStr,@"open_id":openid,@"access_token":@"E688BA0CAC0DD21327A9F14B362D855A",@"user_nickname":userName,@"user_image_url":userAvatar };
        
        
        [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"login/social_login.php" theParmeters:parmeters sucess:^(id object) {
            //
            
            NSLog(@"社交登录%@",object);
            
            
            if ([[MainViewControllerHelper sharedMainHelper] statusWith:object]) {
                
                NSString *msg = [object objectForKey:@"status"];
                
                /*
                 data =     {
                 "add_gold" = 0;
                 sign = 4e01dad25719afd709185110f12ccc32;
                 "user_id" = 100409;
                 };
                 */
                if ([msg isEqualToString:@"0"]) {
                    //请求成功
                    
                    NSDictionary *data  =[object objectForKey:@"data"];
                    
                    NSString *sign = [data objectForKey:@"sign"];
                    ///首次登录获得金币
                    //NSString *add_gold = [data objectForKey:@"add_gold"];
                    
                    NSString *user_id = [data objectForKey:@"user_id"];
                    
                    NSLog(@"%@       %@",sign,user_id);
                    
                    NSDictionary *userDic = @{@"user_id":user_id,@"sign":sign };
                    
                    [[ZMUserInfo sharedUserInfo] setUserInfo:userDic];
                    
                    
                    [[MainViewControllerHelper sharedMainHelper] resetLoginWithType:1];
                    
                    
                }else {
                    
                    [AnyObjectActivityView showWithTitle:NetWorkFail wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                    
                }
            }
        } error:^(NSError *error) {
            //
            NSLog(@"%@",error);
        }];
    }else {
        
        [AnyObjectActivityView showWithTitle:NetWorkFail wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
    }
    

}










@end
