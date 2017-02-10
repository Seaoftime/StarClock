//
//  ZMClockCreateRecordViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/25.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMClockCreateRecordViewController.h"
#import "TopicAlertView.h"


@interface ZMClockCreateRecordViewController () <TopicAlertViewDeletage>

@property (nonatomic,strong) ZMButton *createRecordButton;
@property (nonatomic,strong) UITextField *inputTextField; //!< 输入语音名称
@property (nonatomic,strong) UILabel *titleName; //!< 语音名称 提示标题

@end

@implementation ZMClockCreateRecordViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"生成我的语音"];
    [self.view addSubview:self.createRecordButton];
    [self.view addSubview:self.titleName];
    [self.view addSubview:self.inputTextField];
}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}



-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}


-(ZMButton *)createRecordButton
{
    if (_createRecordButton == nil)
    {
        _createRecordButton = [[ZMButton alloc]initWithFrame:CGRectMake(kScreen_Width/2-148/2,200 , 148, 50)];
        [_createRecordButton setImage:[UIImage imageNamed:@"立即生成"] forState:UIControlStateNormal];
        [_createRecordButton addTarget:self action:@selector(recordButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_createRecordButton setTag:20];
    }
    return _createRecordButton;
}


-(UILabel *)titleName
{
    if (_titleName == nil)
    {
        _titleName = [[UILabel alloc]initWithFrame:CGRectMake(20, 150, 100, 20)];
        [_titleName setFont:[UIFont boldSystemFontOfSize:20.0]];
        [_titleName setText:@"语音名称"];
        [_titleName setTextColor:MainColor];
    }
    return _titleName;
}

-(UITextField *)inputTextField
{
    if (_inputTextField == nil)
    {
        _inputTextField = [[UITextField alloc]initWithFrame:CGRectMake(130, 140, kScreen_Width-160, 40)];
        [_inputTextField setFont:[UIFont systemFontOfSize:15.0]];
        [_inputTextField.layer setBorderWidth:2.0];
        [_inputTextField.layer setBorderColor:[LineViewColor CGColor]];
        [_inputTextField.layer setCornerRadius:5];
        [_inputTextField.layer setMasksToBounds:YES];
        [_inputTextField setPlaceholder:@"输入语音包名称(必填)"];
        [_inputTextField setTextColor:MainColor];
        [_inputTextField setTintColor:MainColor];
    }
    return _inputTextField;
}



-(void)recordButtonAction:(ZMButton*)recordButtonAction
{
    if ([self.inputTextField.text isEqualToString:@""])
    {
        TopicAlertView *alertView = [[TopicAlertView alloc]initWithTitle:@"生成语音" withMessage:@"语音包名称不能为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitle:nil];
        [alertView show];
        
    }
    else
    {
        if ([[NSFileManagerHelper sharedInstance] copyItemAtPath:KColockPath toPath:self.inputTextField.text])
        {
            [NSUserDefaults setObject:@"生成闹钟录音完毕" forKey:@"闹钟录音"];
        }
    }
}


#pragma mark - TopicAlertViewDeletage
-(void)topicAlertButton:(ZMButton*)sender
{
    
}



@end
