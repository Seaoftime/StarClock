//
//  TopicAlertView.h
//  TraBook
//
//  Created by ZhongMeng on 16/4/18.
//  Copyright © 2016年 yaolizhi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZMButton.h"
#import "TopicAlertTableView.h"
#import "TopicMoreAlertTableView.h"

@protocol TopicAlertViewDeletage <NSObject>



@optional
-(void)topicAlertButton:(ZMButton *)sender;
-(void)topicAlertDatePicker:(ZMButton*)sender;
-(void)topicAlertSelectRowAtIndexPathWithModel:(TinkleModel*)model;
-(void)topicMoreAlertSelectRowAtIndexPathWithModel:(TinkleModel*)model;
-(void)topicInputAlertButton:(NSString*)sender;

@end



@interface TopicAlertView : UIControl




@property (nonatomic,assign) id <TopicAlertViewDeletage> alertDeletage;

@property (nonatomic,strong) TopicAlertTableView *topicAlertTableView;  //!< 提醒表视图

@property (nonatomic,strong) TopicMoreAlertTableView *topicMoreAlertTableView; //!< 周一....周日表视图

/**
 取消按钮
 */
@property (nonnull,nonatomic,strong) ZMButton *cancelButton;
/**
 确定按钮
 */
@property (nonnull,nonatomic,strong) ZMButton *doneButton;


@property (nonatomic,strong) UIView *topicAlertView;


@property (nonatomic,strong) UIView *topicMoreAlertView; //!< 周一...周日

@property (nonatomic,strong) UIView *inputAlertView; //!< 文本输入框视图
@property (nonatomic,strong) UITextField *inputTextFiedld; //!< 文本输入框

-(instancetype)initWithTitle:(NSString*)title withMessage:(NSString*)message delegate:(id<TopicAlertViewDeletage>)deletage cancelButtonTitle:(NSString*)cancelTitle otherButtonTitle:(NSString*)otherTitle;

-(void)show;

-(void)dismissAlertView;


#pragma mark - 弹出新闹钟重复方式
-(instancetype)initWithTitle:(NSString *)title withTopicTitle:(NSString*)topicTitle setDelegate:(id<TopicAlertViewDeletage>)deletage;

-(void)showTopicAlertView;

-(void)dismissTopicAlertView;



#pragma mark - 弹出新闹钟周一至周五重复方式
-(instancetype)initWithMoreTitle:(NSString *)title setDelegate:(id<TopicAlertViewDeletage>)deletage cancelButtonTitle:(NSString*)cancelTitle otherButtonTitle:(NSString*)otherTitle;

-(void)showTopicMoreAlertView;
-(void)dismissTopicMoreAlertView;




#pragma mark - 弹出输入标签的文本输入框
-(instancetype)initInpputWithTitle:(NSString *)title setDelegate:(id<TopicAlertViewDeletage>)deletage cancelButtonTitle:(NSString*)cancelTitle otherButtonTitle:(NSString*)otherTitle;

-(void)showInpputAlertView;
-(void)dismissInpputAlertView;


#pragma mark - ==================== 时间弹出框（注册选择）====================
/**
 Type:创建的时间弹出框类型
 deletage:设置代理对象
 */
-(instancetype)initWithDatePickerType:(int)type setDeletage:(id<TopicAlertViewDeletage>)deletage;

/**
 显示时间操作表
 */
-(void)showDateActionSheetView;

/**
 销毁时间操作表
 */
-(void)dismissDateActionSheetView;

@end
