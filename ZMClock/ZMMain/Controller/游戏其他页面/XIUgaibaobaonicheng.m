//
//  XIUgaibaobaonicheng.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/30.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "XIUgaibaobaonicheng.h"




//
#import "ZMGameSettingViewController.h"

#import "Baobaonichenxiugai.h"

#import "AFNetworkingHelper.h"






@interface ZMGameBaseViewController ()<UITextFieldDelegate>




@end

@implementation XIUgaibaobaonicheng

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"宝宝昵称"];
    [self setNavRightBtnHidden: NO];
    
    [self.view addSubview:self.nichenfield];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (UITextField *)nichenfield
{
    if (_nichenfield==nil)
    {
        _nichenfield=[[UITextField alloc]init];
        _nichenfield.frame=CGRectMake(0, 100, kScreen_Width, 40);
        _nichenfield.delegate=self;
        _nichenfield.placeholder=@"输入宝宝昵称";
        _nichenfield.clearButtonMode=UITextFieldViewModeAlways;
        _nichenfield.background=[UIImage imageNamed:@"框子3"];
        _nichenfield.clearsOnBeginEditing = YES;
        _nichenfield.keyboardAppearance=UIKeyboardAppearanceDefault;
        _nichenfield.textAlignment = NSTextAlignmentCenter;
        _nichenfield.keyboardType=UIKeyboardTypeDefault;
        
    }
    return _nichenfield;

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.nichenfield resignFirstResponder];
    return YES;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


-(NSMutableArray *)imageArray
{
    if (_imageArray == nil)
    {
        _imageArray = [NSMutableArray array];
    }
    return _imageArray;
}


-(void)navRightBtnAction:(UIButton *)sender
{
   
    //ZMGameSettingViewController *vc1=[[ZMGameSettingViewController alloc] init];
    //vc1.baobaostr1=self.nichenfield.text;
    //[self.navigationController pushViewController:vc1 animated:YES];
    
    [self.navigationController popViewControllerAnimated:YES];
    
   //上传到服务器里
    NSMutableDictionary *parmeters = [NSMutableDictionary dictionary];
   
         [parmeters setObject:self.nichenfield.text forKey:@"game_nickname"];
         [parmeters setObject:@"0" forKey:@"nickname"];
         [parmeters setObject:@"0" forKey:@"sex"];
         [parmeters setObject:@"0" forKey:@"birth"];
         [parmeters setObject:@"0" forKey:@"game_avatar"];
         //[parmeters setObject:@"0" forKey:@"avatar"];
    
       if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
        {
            if ([[ZMUserInfo sharedUserInfo] isUserInfo])
            {
                [parmeters setObject:[ZMUserInfo sharedUserInfo].user_id forKey:@"user_id"];
                [parmeters setObject:[ZMUserInfo sharedUserInfo].sign forKey:@"sign"];
                
                [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"user/update_user_profile.php" theParmeters:parmeters sucess:^(id object)
                 {
                     if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                     {
                        // NSLog(@"_-----object----%@",object);
                         //判断修改宝宝昵称是否完成
                         NSDictionary *data = [object objectForKey:@"data"];
                         if ([data count])
                         {
                             NSDictionary*task=[data objectForKey:@"task"];
                             if ([task isEqual:@""])
                                 
                             {
                                 [AnyObjectActivityView showWithTitle:@"更新成功" wittImageName:SubmitSucceedVerify withActivityMode:ActivityTopImageView withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                             }
                             
                             else
                             {
                                 NSInteger add_gold=[[task objectForKey:@"add_gold"]integerValue];
                                 NSInteger task_id=[[task objectForKey:@"task_id"]integerValue];
                                 if (task_id==2)
                                 {
                                     [AnyObjectActivityView showWithTitle:[NSString stringWithFormat:@"%@"@"%ld",@"金币+",(long)add_gold] wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                                 }
                             }
                         }
                         
                     }
                     
                 } error:^(NSError *error)
                 {
                     [AnyObjectActivityView showWithTitle:@"更新失败" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                 }];
            }
        }
    
    
     }





@end
