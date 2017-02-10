//
//  ZMEditNickNameViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/10.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMEditNickNameViewController.h"
#import "EditMeInfoHelper.h"

@interface ZMEditNickNameViewController ()<UITextFieldDelegate>

@property (nonatomic,strong) UITextField *editTextField; //!< 编辑昵称文本输入框
@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) MeInfoModel *meInfoModel;


///张锐
@property (nonatomic, copy) NSString *nickNameStr;


@end

@implementation ZMEditNickNameViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"编辑昵称"];
    [self.view addSubview:self.editTextField];
    
    //[self setNavRightBtnImage:@"社区导航完成"];
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.editTextField becomeFirstResponder];
    });
    
    
}


- (void)viewWillDisappear:(BOOL)animated
{
    
    [super viewWillDisappear:animated];
    

    
    

}




- (void)navLeftBtnAction:(UIButton *)sender
{

    if ([self.editTextField.text isEqualToString:@""]) {
        //
        
        
        
        [AnyObjectActivityView showWithTitle:@"昵称不能为空" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
        
        
    }else {
    
        if (self.nickNameStr == nil || self.nickNameStr == NULL || [self.nickNameStr isKindOfClass:[NSNull class]]) {
            
            
        }else {
            
            
            if ([self.nickNameStr isEqualToString:self.editTextField.text]) {
                //
            }else {
                
                
                [self.meInfoModel setDescribe:self.editTextField.text];
                [self.tableView reloadData];
                [[EditMeInfoHelper shareHelper] setNickName:self.editTextField.text];
                
                
                
                //上传到服务器
                
                NSMutableDictionary *parmeters = [NSMutableDictionary dictionary];
                [parmeters setObject:@"0" forKey:@"game_nickname"];
                if ([EditMeInfoHelper shareHelper].nickName)
                {
                    [parmeters setObject:[EditMeInfoHelper shareHelper].nickName forKey:@"nickname"];
                }
                
                else
                {
                    [parmeters setObject:@"0" forKey:@"nickname"];
                }
                
                if ([EditMeInfoHelper shareHelper].sex)
                {
                    [parmeters setObject:[EditMeInfoHelper shareHelper].sex forKey:@"sex"];
                }
                else
                {
                    [parmeters setObject:@"0" forKey:@"sex"];
                }
                
                if ([EditMeInfoHelper shareHelper].birthday)
                {
                    [parmeters setObject:[EditMeInfoHelper shareHelper].birthday forKey:@"birth"];
                }
                else
                {
                    [parmeters setObject:@"0" forKey:@"birth"];
                }
                
                if ([EditMeInfoHelper shareHelper].phone)
                {
                    [parmeters setObject:[EditMeInfoHelper shareHelper].phone forKey:@"phone"];
                }
                else
                {
                    [parmeters setObject:@"0" forKey:@"phone"];
                }
                
                
                if ([EditMeInfoHelper shareHelper].imageData)
                {
                    
                    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
                    {
                        if ([[ZMUserInfo sharedUserInfo] isUserInfo])
                        {
                            [parmeters setObject:[ZMUserInfo sharedUserInfo].user_id forKey:@"user_id"];
                            [parmeters setObject:[ZMUserInfo sharedUserInfo].sign forKey:@"sign"];
                            [[AFNetworkingHelper sharedNetworkingHelper] postFormDataObjectWithUrl:@"user/update_user_profile.php" theParmeters:parmeters constructingBodyWithBlock:^(id<AFMultipartFormData> formData)
                             {
                                 
                                 [formData appendPartWithFileData:[EditMeInfoHelper shareHelper].imageData name:@"avatar" fileName:@"image.jpg" mimeType:@"image/jpeg"];
                             } sucess:^(id object)
                             {
                                 if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                                 {
                                     
                                     NSLog(@"编辑个人资料__%@",object);
                                     
                                     
                                     //判断修改个人资料是否完成
                                     NSDictionary *data = [object objectForKey:@"data"];
                                     NSLog(@"--data-------%@---",data);
                                     if ([data count])
                                     {
                                         NSDictionary*task=[data objectForKey:@"task"];
                                         
                                         
                                         NSLog(@"-----task-------%@--",task);
                                         if ([task isEqual:@""])
                                             
                                         {
                                             
                                         }
                                         
                                         else
                                         {
                                             NSInteger add_gold=[[task objectForKey:@"add_gold"]integerValue];
                                             NSInteger task_id=[[task objectForKey:@"task_id"]integerValue];
                                             
                                             NSLog(@"------add_gold---%ld",(long)add_gold);
                                             NSLog(@"------task_id---%ld",(long)task_id);
                                             if (task_id==1)
                                             {
                                                 
                                                 [AnyObjectActivityView showWithTitle:[NSString stringWithFormat:@"%@"@"%ld",@"金币+",(long)add_gold] wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                                             }
                                         }
                                     }
                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                     [AnyObjectActivityView showWithTitle:@"更新成功" wittImageName:SubmitSucceedVerify withActivityMode:ActivityTopImageView withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                                 }
                                 
                             } error:^(NSError *error)
                             {
                                 //[AnyObjectActivityView showWithTitle:@"更新失败" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                                 
                             }];
                        }
                    }
                }
                else////////没有修改头像
                {
                    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
                    {
                        if ([[ZMUserInfo sharedUserInfo] isUserInfo])
                        {
                            [parmeters setObject:[ZMUserInfo sharedUserInfo].user_id forKey:@"user_id"];
                            [parmeters setObject:[ZMUserInfo sharedUserInfo].sign forKey:@"sign"];
                            
                            
                            //                NSString *str = [EditMeInfoHelper shareHelper].nickName;
                            //
                            //                NSLog(@"[EditMeInfoHelper shareHelper].nickName  _____%@",str);
                            //
                            //                [parmeters setObject:[EditMeInfoHelper shareHelper].nickName forKey:@"nickname"];
                            //
                            //                [parmeters setObject:[EditMeInfoHelper shareHelper].sex forKey:@"sex"];
                            //
                            //                [parmeters setObject:[EditMeInfoHelper shareHelper].birthday forKey:@"birth"];
                            //
                            //                [parmeters setObject:[EditMeInfoHelper shareHelper].phone forKey:@"phone"];
                            //
                            
                            
                            
                            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"user/update_user_profile.php" theParmeters:parmeters sucess:^(id object)
                             {
                                 
                                 [AnyObjectActivityView showWithTitle:@"更新成功" wittImageName:SubmitSucceedVerify withActivityMode:ActivityTopImageView withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                                 
                                 
                                 
                                 if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                                 {
                                     
                                     //判断修改个人资料是否完成
//                                     NSDictionary *data = [object objectForKey:@"data"];
//                                     if ([data count])
//                                     {
//                                         NSDictionary*task=[data objectForKey:@"task"];
//                                         if ([task isEqual:@""])
//                                             
//                                         {
//                                             [AnyObjectActivityView showWithTitle:@"更新成功" wittImageName:SubmitSucceedVerify withActivityMode:ActivityTopImageView withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
//                                             
//                                         }
//                                         
//                                         else
//                                         {
//                                             NSInteger add_gold=[[task objectForKey:@"add_gold"]integerValue];
//                                             NSInteger task_id=[[task objectForKey:@"task_id"]integerValue];
//                                             if (task_id==1)
//                                             {
//                                                 
//                                                 [AnyObjectActivityView showWithTitle:[NSString stringWithFormat:@"%@"@"%ld",@"金币+",(long)add_gold] wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
//                                             }
//                                         }
//                                     }
                                     
                                     
                                 }
                                 
                             } error:^(NSError *error)
                             {
                                 //[AnyObjectActivityView showWithTitle:@"更新失败" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                             }];
                        }
                    }
                }
                
                
                
                
                
                
            }
            
            
        }
        
        
        
        [self.navigationController popViewControllerAnimated:YES];
    
    
    }
    
    

}


#pragma mark - Getter / Setter
-(UITextField *)editTextField
{
    if (_editTextField == nil)
    {
        _editTextField = [[UITextField alloc]initWithFrame:CGRectMake(10, 90, kScreen_Width-20, 30)];
        [_editTextField.layer setBorderColor:[LineViewColor CGColor]];
        [_editTextField.layer setBorderWidth:1.0];
        
        [_editTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        
    }
    return _editTextField;
}



#pragma mark -------------------------------------限制字数
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.editTextField) {
        
        if (self.editTextField.text.length > 10)
            return NO;
    }
    
    return YES;
}

- (void)textFieldDidChange:(UITextField *)textField
{
    if (textField == self.editTextField) {
        
        
        //NSString *lang = [[UITextInputMode currentInputMode] primaryLanguage]; // 键盘输入模式 ios7被舍弃
        UITextInputMode *inputModel = self.editTextField.textInputMode;
        
        
        NSString *lang = [inputModel primaryLanguage];
        
       
        
        if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
            UITextRange *selectedRange = [textField markedTextRange];
            //获取高亮部分
            UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
            // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
            if (!position) {
                if (textField.text.length > 10) {
                    textField.text = [textField.text substringToIndex:10];
                }
                
                
            } else {// 有高亮选择的字符串，则暂不对文字进行统计和限制
                
                
                
                
            }
            
            
        } else if ([lang isEqualToString:@"en-US"]){// 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
            
            if (textField.text.length > 20) {
                textField.text = [textField.text substringToIndex:20];
            }
            
            
        }else {
        }
        
        
        
        
        
//        if (textField.text.length > 10) {
//            textField.text = [textField.text substringToIndex:10];
//        }
    }
}





- (void)setMeInfoModel:(MeInfoModel*)objectModel withTableview:(UITableView*)tableView
{
    [self.editTextField setText:objectModel.describe];
    
    //NSLog(@"%@",objectModel.describe);
    
    self.nickNameStr = objectModel.describe;
    
    
    
    [self setMeInfoModel:objectModel];
    [self setTableView:tableView];
}


#pragma mark 编辑完成按钮触发的方法
-(void)navRightBtnAction:(UIButton *)sender
{
    
}


@end
