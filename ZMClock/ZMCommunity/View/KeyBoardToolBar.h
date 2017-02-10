//
//  keyBoardToolBar.h
//  IM
//
//  Created by ZhongMeng on 16/4/8.
//  Copyright © 2016年 yaolizhi. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol KeyBoardToolBarDeletage <NSObject>

-(void)sendMessageButtonAction:(UIButton*)sender;


@end


@interface KeyBoardToolBar : UIView

/**
 输入文本框
 */
@property (nonatomic,strong) UITextField *inputTextField;


/**
 发送消息按钮
 */
@property (nonatomic,strong) UIButton *sendMessageButton;

@property (nonatomic) id <KeyBoardToolBarDeletage> keyBoardDeletage;

-(instancetype)initWithFrame:(CGRect)frame withDeletage:(id<KeyBoardToolBarDeletage>)deletage setTableView:(UITableView*)tableView setArray:(NSMutableArray*)array;


/**
 添加通知
 */
-(void)addNotification;

/**
 移除通知
 */
-(void)removeNotification;

@end
