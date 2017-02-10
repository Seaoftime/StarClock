//
//  SubmitView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/28.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZMTextFieldView.h"
#import "ZMTextView.h"
#import "ZMButton.h"
#import "SubmitScrollView.h"

@protocol SubmitViewDeletage <NSObject>


-(void)submitPhotoButton:(ZMButton*)sender;

@end


@interface SubmitView : UIView


@property (nonatomic,strong) ZMTextFieldView *titleView; //!< 标题输入视图
@property (nonatomic,strong) ZMTextFieldView *sourceView; //!< 来源输入视图
@property (nonatomic,strong) ZMTextView *submitInputView; //!< 正文输入框
@property (nonatomic,strong) ZMButton *addPhotoButton; //!<添加相片按钮的
@property (nonatomic,strong) SubmitScrollView *submitScrollView;

@property (nonatomic,strong) id <SubmitViewDeletage> submitDeletage; //!< 代理对象



-(instancetype)initWithDeletage:(id<SubmitViewDeletage>)deletage;


/**
 重新设置Frame
 */
-(void)resetFrame:(CGRect)frame;


@end
