//
//  ZMChatManagerMessageChangeViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/8/19.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMChatManagerMessageChangeViewController.h"

@interface ZMChatManagerMessageChangeViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *changeTF;

@end

@implementation ZMChatManagerMessageChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    
    self.view.backgroundColor = RGB(235, 235, 235);
    [self setNavRightBtnImage:@"社区导航完成"];
    
    
    self.changeTF = [[UITextField alloc] initWithFrame:CGRectMake(20, 104, kScreen_Width - 40, 40)];
    self.changeTF.textColor = [UIColor blackColor];
    //self.changeTF.placeholder = @"点击输入...";
    self.changeTF.backgroundColor = [UIColor whiteColor];
    self.changeTF.font = [UIFont systemFontOfSize:15];
    self.changeTF.textAlignment = NSTextAlignmentLeft;
    //self.changeTF.borderStyle = UITextBorderStyleRoundedRect;
    
    self.changeTF.delegate = self;
    
    self.changeTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [self.view addSubview:self.changeTF];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.changeTF becomeFirstResponder];
    });
    
    
    NSString *nickStr = [NSUserDefaults standardUserDefaults].robot_Nickname;
    if (nickStr == nil || nickStr == NULL || [nickStr isKindOfClass:[NSNull class]]) {
        
        
    }else {
        
        self.changeTF.text = nickStr;
        
    }
    
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.changeTF resignFirstResponder];


}


#pragma mark - 设置右侧按钮图标
- (void)setNavRightBtnImage:(NSString*)imageName
{
    [self.baseNavigation.rightButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
}

#pragma mark - 右侧按钮触发的方法
- (void)navRightBtnAction:(UIButton*)sender
{
    [self.changeTF resignFirstResponder];
    
    
    ///测试
    
    [NSUserDefaults standardUserDefaults].robot_Nickname = self.changeTF.text;
    
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
    //上传到服务器里
   
    
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        
        
        
        
         NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id, @"sign":[ZMUserInfo sharedUserInfo].sign, @"robot_nickname":self.changeTF.text };
        
        
            
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"tuling/update_chat_user_info.php" theParmeters:parmeters sucess:^(id object)
             {
                 
                 
                 
                 
                 NSLog(@"_-----object----%@",object);
                 
                 NSString *status = (NSString *)[object objectForKey:@"status"];
                 
                 
                 if ([status isEqualToString:@"0"] ) {
                     //
                     NSString *s = [object objectForKey:@"data"];
                     
                     NSLog(@"_---------%@",s);
                     
                     [AnyObjectActivityView showWithTitle:@"更新成功" wittImageName:SubmitSucceedVerify withActivityMode:ActivityTopImageView withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                     
                    
                     
                 }
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
             } error:^(NSError *error)
             {
                 //[AnyObjectActivityView showWithTitle:@"更新失败" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
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
