//
//  YijianfankuiController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/6/14.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "YijianfankuiController.h"

@interface YijianfankuiController ()<UITextFieldDelegate,UITextViewDelegate>
@property (nonatomic,strong) UITextField *yijianrenshoujifield;
@property (nonatomic,strong) UITextView *yijianneirongfield;



@property (nonatomic, strong) UIButton *tijiaoBttn;//提交


@end

@implementation YijianfankuiController

- (void)viewDidLoad {
    [super viewDidLoad];
//     [self setNavRightBtnHidden: NO];
//     [self setTitle:@"意见反馈"];
//    [self setNavRightBtnImage:@"社区导航完成"];

    
    
    
    [self.view addSubview:self.yijianrenshoujifield];
    
    _yijianneirongfield=[[UITextView alloc]initWithFrame:CGRectMake(20, 100, kScreen_Width - 40, kScreen_Height/4)];
    _yijianneirongfield.layer.cornerRadius = 10;
    _yijianneirongfield.layer.masksToBounds = YES;
    
    _yijianneirongfield.delegate=self;
    _yijianneirongfield.textColor = [UIColor blackColor];
    _yijianneirongfield.text=@"反馈内容:";
    _yijianneirongfield.backgroundColor = RGB(235, 235, 235);
    _yijianneirongfield.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:_yijianneirongfield];
    
    
    
    
    [self.topHeadImggV addSubview:self.tijiaoBttn];
    
    
    
}


- (UITextField *)yijianrenshoujifield
{
    if (_yijianrenshoujifield==nil)
    {
        _yijianrenshoujifield=[[UITextField alloc]init];
        _yijianrenshoujifield.frame=CGRectMake(20, 100 + kScreen_Height/4 + 50, kScreen_Width - 40, 40);
        _yijianrenshoujifield.layer.cornerRadius = 10;
        _yijianrenshoujifield.layer.masksToBounds = YES;
        _yijianrenshoujifield.delegate=self;
        _yijianrenshoujifield.placeholder=@"输入你的手机号";
        _yijianrenshoujifield.clearButtonMode=UITextFieldViewModeAlways;
        _yijianrenshoujifield.keyboardType = UIKeyboardTypeNumberPad;
        _yijianrenshoujifield.backgroundColor = RGB(235, 235, 235);
        _yijianrenshoujifield.clearsOnBeginEditing = YES;
        _yijianrenshoujifield.keyboardAppearance=UIKeyboardTypeNumbersAndPunctuation;
        _yijianrenshoujifield.textAlignment =NSTextAlignmentLeft;
        
    }
    return _yijianrenshoujifield;
    
}



- (UIButton *)tijiaoBttn
{
    if (!_tijiaoBttn) {
        _tijiaoBttn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width - 54, 17, 44, 40)];
        [_tijiaoBttn setTitle:@"提交" forState:UIControlStateNormal];
        _tijiaoBttn.titleLabel.font = [UIFont systemFontOfSize:18];
        
        [_tijiaoBttn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [_tijiaoBttn addTarget:self action:@selector(tijiaoBttnnClcked) forControlEvents:UIControlEventTouchUpInside];
        
        
        
    }
    
    return _tijiaoBttn;
    
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.yijianrenshoujifield resignFirstResponder];
    [self.yijianneirongfield resignFirstResponder];
    
    return YES;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


//- (void)dismissBtnnClicked
//{
//    if (self.yijianneirongfield.text.length > 0 && self.yijianrenshoujifield.text.length > 0) {
//        //
//        UIAlertView *jiangaobiao=[[UIAlertView alloc]initWithTitle:@"感谢你的反馈" message:@"你的反馈我们会尽快处理的,请耐心等待." delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
//        [jiangaobiao show];
//    } else {
//    
//        [self.navigationController popViewControllerAnimated:YES];
//    
//    }
//    
//    
//
//}



- (void)tijiaoBttnnClcked
{

    if (self.yijianneirongfield.text.length > 0 && self.yijianrenshoujifield.text.length > 0) {
        
        UIAlertView *jiangaobiao=[[UIAlertView alloc]initWithTitle:@"感谢你的反馈" message:@"你的反馈我们会尽快处理的,请耐心等待." delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        
        [jiangaobiao show];

        
    } else {
        
        
        [AnyObjectActivityView showWithTitle:@"请填写反馈内容~" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
        
        
        
    }
    

}



-(void)navRightBtnAction:(UIButton *)sender
{
    
}

#pragma mark 意见反馈 button点击方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex

{
    if(buttonIndex == 0)
    {
        
        //上传到服务器里
        NSMutableDictionary *parmeters = [NSMutableDictionary dictionary];
         [parmeters setObject:self.yijianrenshoujifield.text forKey:@"contact"];
        [parmeters setObject:self.yijianneirongfield.text forKey:@"content"];
        if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
        {
            if ([[ZMUserInfo sharedUserInfo] isUserInfo])
            {
                [parmeters setObject:[ZMUserInfo sharedUserInfo].user_id forKey:@"user_id"];
                [parmeters setObject:[ZMUserInfo sharedUserInfo].sign forKey:@"sign"];
                [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"/statistics/feedback.php" theParmeters:parmeters sucess:^(id object)
                 {
                     if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                     {
                         [AnyObjectActivityView showWithTitle:@"我们已收到你的反馈" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                         self.yijianrenshoujifield.text=@"";
                         self.yijianneirongfield.text=@"你的反馈内容:";
                     }
                     
                 } error:^(NSError *error)
                 {
                     [AnyObjectActivityView showWithTitle:@"反馈无效" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                 }];
            }
        }

        
        
        
    }
    
    
    
}


@end
