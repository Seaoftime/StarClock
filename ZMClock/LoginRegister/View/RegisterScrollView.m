//
//  Register.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/29.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "RegisterScrollView.h"

@implementation RegisterScrollView



-(instancetype)initWithFrame:(CGRect)frame setDeletage:(id<RegisterScrollViewDeletage>)deletage withType:(RegisterForgetType)type
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setRegisterDeletage:deletage];
        switch (type)
        {
#pragma mrak RegisterType 注册界面使用
            case RegisterType:
            {
                [self setShowsVerticalScrollIndicator:YES];
                [self setShowsHorizontalScrollIndicator:YES];
                
                [self setContentSize:CGSizeMake(kScreen_Width, 600)];
                
                [self addSubview:self.phoneTextFieldView];
                [self addSubview:self.verifyCode];
                [self addSubview:self.passwordFieldView];
                [self addSubview:self.againPasswordFieldView];
                [self addSubview:self.protocolView];
                [self addSubview:self.submitButton];
            }
                break;
#pragma mrak RegisterType 忘记界面使用
            case ForgetType:
            {
                [self setShowsVerticalScrollIndicator:YES];
                [self setShowsHorizontalScrollIndicator:YES];
                
                [self setContentSize:CGSizeMake(kScreen_Width, 600)];
                
                [self addSubview:self.phoneTextFieldView];
                [self addSubview:self.verifyCode];
                [self addSubview:self.passwordFieldView];
                [self addSubview:self.againPasswordFieldView];
                [self addSubview:self.submitButton];
            }
                break;
        }
    }
    return self;
}

#pragma mark - Getter / Setter
-(ZMTextFieldView*)phoneTextFieldView
{
    if (_phoneTextFieldView == nil)
    {
        _phoneTextFieldView = [[ZMTextFieldView alloc]initWithLineViewFrame:CGRectMake(20, 100, kScreen_Width-40, 30) withImageName:@"电话号"];
        [_phoneTextFieldView.inputTextField setKeyboardType:UIKeyboardTypeNumberPad];
        [_phoneTextFieldView.inputTextField setPlaceholder:@"请输入手机号"];
    }
    return _phoneTextFieldView;
}


-(ZMTextFieldView*)verifyCode
{
    if (_verifyCode == nil)
    {
        _verifyCode = [[ZMTextFieldView alloc]initWithLineViewAndButtonFrame:CGRectMake(20, 150, kScreen_Width-40, 30) withImageName:@"验证码" withTitle:@"获取验证码"];
        [_verifyCode.verifyCodeButton setTag:4];
        [_verifyCode.inputTextField setPlaceholder:@"请输入验证码"];
        [_verifyCode.verifyCodeButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _verifyCode;
}

-(ZMTextFieldView*)passwordFieldView
{
    if (_passwordFieldView == nil)
    {
        _passwordFieldView = [[ZMTextFieldView alloc]initWithLineViewFrame:CGRectMake(20, 200, kScreen_Width-40, 30) withImageName:@"请输入密码"];
        [_passwordFieldView.inputTextField setSecureTextEntry:YES];
        [_passwordFieldView.inputTextField setPlaceholder:@"请输入密码"];
    }
    return _passwordFieldView;
}

-(ZMTextFieldView*)againPasswordFieldView
{
    if (_againPasswordFieldView == nil)
    {
        _againPasswordFieldView = [[ZMTextFieldView alloc]initWithLineViewFrame:CGRectMake(20, 250, kScreen_Width-40, 30) withImageName:@"再次输入密码"];
        [_againPasswordFieldView.inputTextField setSecureTextEntry:YES];
        [_againPasswordFieldView.inputTextField setPlaceholder:@"请再次输入密码"];
    }
    return _againPasswordFieldView;
}


-(ZMView*)protocolView
{
    if (_protocolView == nil)
    {
        _protocolView = [[ZMView alloc]initWithProtocolFrame:CGRectMake(20, 300, kScreen_Width-80, 30)];
        [_protocolView.markButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_protocolView.protocolButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _protocolView;
}

-(ZMButton *)submitButton
{
    if (_submitButton == nil)
    {
        _submitButton = [[ZMButton alloc]initWithFrame:CGRectMake(kScreen_Width/2-300/2, 350, 300, 40)];
        [_submitButton.layer setCornerRadius:5.0];
        [_submitButton.layer setMasksToBounds:YES];
        [_submitButton setTitle:@"提交" forState:UIControlStateNormal];
        [_submitButton setBackgroundColor:MainColor];
        [_submitButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_submitButton setTag:3];
    }
    return _submitButton;
}



-(void)buttonAction:(ZMButton*)sender
{
    if ([self.registerDeletage respondsToSelector:@selector(rgisterButtonAction:)])
    {
        [self.registerDeletage rgisterButtonAction:sender];
    }
}







@end
