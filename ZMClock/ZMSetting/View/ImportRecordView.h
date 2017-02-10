//
//  ImportRecordView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/21.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImportRecordView : UIView


/**
 提示标签
 */
@property (nonatomic,strong) UILabel *tipLabel;


/**
 内容输入框
 */
@property (nonatomic,strong) UITextField *inputTextFiled;


/**
 导入按钮
 */
@property (nonatomic,strong) ZMButton *importButton;




/**
 高度为：240
 宽度为：kScreen_Width-20*2
 */

-(instancetype)initWithFrame:(CGRect)frame;


@end
