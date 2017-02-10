//
//  Register.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/29.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZMTextFieldView.h"
#import "ZMView.h"

typedef NS_ENUM(NSInteger,RegisterForgetType)
{
    /**
     注册界面使用
     */
    RegisterType = 1,
    
    /**
     忘记界面使用
     */
    ForgetType = 2,
};




@protocol  RegisterScrollViewDeletage  <NSObject>

-(void)rgisterButtonAction:(ZMButton*)sender;

@end

@interface RegisterScrollView : UIScrollView

@property (nonatomic,strong) ZMTextFieldView *phoneTextFieldView; //!< 手机号
@property (nonatomic,strong) ZMTextFieldView *verifyCode; //!< 验证码

@property (nonatomic,strong) ZMTextFieldView *passwordFieldView; //!< 密码
@property (nonatomic,strong) ZMTextFieldView *againPasswordFieldView; //!< 重新验证密码
@property (nonatomic,strong) ZMView *protocolView;
@property (nonatomic,strong) ZMButton *submitButton; //!< 提交注册



@property (nonatomic,assign) id <RegisterScrollViewDeletage> registerDeletage;

-(instancetype)initWithFrame:(CGRect)frame setDeletage:(id<RegisterScrollViewDeletage>)deletage withType:(RegisterForgetType)type;


@end
