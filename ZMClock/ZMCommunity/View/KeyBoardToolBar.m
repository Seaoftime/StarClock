//
//  keyBoardToolBar.m
//  IM
//
//  Created by ZhongMeng on 16/4/8.
//  Copyright © 2016年 yaolizhi. All rights reserved.
//

#import "keyBoardToolBar.h"

@interface KeyBoardToolBar () <UITextFieldDelegate>

@property (nonatomic,strong) UITableView *transferTableView;
@property (nonatomic,strong) NSMutableArray *transferArray;

@end



@implementation KeyBoardToolBar



-(instancetype)initWithFrame:(CGRect)frame withDeletage:(id<KeyBoardToolBarDeletage>)deletage setTableView:(UITableView*)tableView setArray:(NSMutableArray*)array
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setBackgroundColor:RGB(237.0, 237.0, 237.0)];
        [self setTransferTableView:tableView];
        [self setTransferArray:array];
        [self setKeyBoardDeletage:deletage];
        [self addSubview:self.inputTextField];
        [self.inputTextField setDelegate:self];
        [self addSubview:self.sendMessageButton];
        
        
        
        
    }
    return self;
}






-(UITextField *)inputTextField
{
    if (_inputTextField == nil)
    {
        _inputTextField = [[UITextField alloc]initWithFrame:CGRectMake(10, 5, kScreen_Width-100, 30)];
        [_inputTextField setFont:[UIFont systemFontOfSize:14.0]];
        [_inputTextField setPlaceholder:@"说点什么吧"];
    }
    return _inputTextField;
}



-(UIButton *)sendMessageButton
{
    if (_sendMessageButton == nil)
    {
        _sendMessageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sendMessageButton setImage:[UIImage imageNamed:@"发送箭头"] forState:UIControlStateNormal];
        [_sendMessageButton setFrame:CGRectMake(kScreen_Width-50, 5, 50, 30)];
        [_sendMessageButton addTarget:self action:@selector(sendMessageAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sendMessageButton;
}



-(void)sendMessageAction:(UIButton*)sneder
{
    if ([self.keyBoardDeletage respondsToSelector:@selector(sendMessageButtonAction:)])
    {
        
        [self.keyBoardDeletage sendMessageButtonAction:sneder];
       

    }
}




-(void)addNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWilShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWilHide:) name:UIKeyboardWillHideNotification object:nil];
}


-(void)removeNotification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}





#pragma mark 通知方法
-(void)keyboardWilShow:(NSNotification *)notification
{
    /**
     获取键盘升起时的动画时间
     */
    float AnimationDuration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    /**
     获取键盘的位置
     */
    CGRect keyBoardRect = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    
    CGFloat keyBoard_Y = keyBoardRect.origin.y;
    
    
    [UIView animateWithDuration:AnimationDuration animations:^{
        
        [self setFrame:CGRectMake(0,keyBoard_Y - 40, kScreen_Width, 40)];
        
        [self.transferTableView setFrame:CGRectMake(0,  0,kScreen_Width, kScreen_Height-(kScreen_Height-keyBoard_Y+40))];
        
        
        [self scrollToBottom:self.transferArray];
        
    }];
    
    
    
    
}

-(void)keyboardWilHide:(NSNotification *)notification
{
    [UIView animateWithDuration:0.1 animations:^{
        
        [self setFrame:CGRectMake(0, kScreen_Height-40, kScreen_Width, 40)];
        
        [self.transferTableView setFrame:CGRectMake(0,  60,kScreen_Width, kScreen_Height-60)];
        
        
    }];
}




-(void)scrollToBottom:(NSMutableArray*)array
{
    NSInteger count = [array count];
    if (count)
    {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(count-1) inSection:0];
        [self.transferTableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:YES];
    }
}



#pragma mark - UITextFieldDelegate 文本输入框代理方法
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


@end
