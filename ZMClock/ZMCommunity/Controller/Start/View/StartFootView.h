//
//  StartFootView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/4.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZMTextField.h"

@interface StartFootView : UIView


@property (nonatomic,strong) UILabel *startTipLabel; //!< 明星提示标签
@property (nonatomic,strong) UILabel *tipNameLabel; //!< 明星
@property (nonatomic,strong) ZMTextField *inputTextField; //!< 文本输入框
@property (nonatomic,strong) ZMButton *subMitButton; //!< 提交按钮

@end
