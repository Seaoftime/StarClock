//
//  ZMTextFieldView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/28.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//
//  左边是显示标题的标标签，右边输入内容TextFiled
//
//

#import <UIKit/UIKit.h>
#import "ZMTextField.h"


@interface ZMTextFieldView : UIView

/**
 标题标签
 */
@property (nonatomic,strong) UILabel *titleLabel;


/**
 输入文本框
 */
@property (nonatomic,strong) ZMTextField *inputTextField;


/**
 图片视图
 */
@property (nonatomic,strong) UIImageView *imageView;

@property (nonatomic,strong) ZMButton *verifyCodeButton; //!< 获取验证码按钮


-(void)resetFrame:(CGRect)frame;



/**
 初始化分割线TextField
 */
-(instancetype)initWithLineViewFrame:(CGRect)frame withImageName:(NSString*)imageNam;

/**
 初始化分割线TextField和按钮Frame
 */
-(instancetype)initWithLineViewAndButtonFrame:(CGRect)frame withImageName:(NSString*)imageName withTitle:(NSString *)title;

@end
