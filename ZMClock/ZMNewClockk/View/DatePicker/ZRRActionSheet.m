//
//  ZRRActionSheet.m
//  ZMClock
//
//  Created by ZhongMeng on 16/11/1.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZRRActionSheet.h"

@implementation ZRRActionSheet

@synthesize mainWindow = _mainWindow;
@synthesize myWindow = _myWindow;
@synthesize myTitle = _myTitle;
@synthesize backView = _backView;
@synthesize myView = _myView;
@synthesize delegate = _delegate;

- (instancetype)init
{
    self = [super init];
    if (self) {
        _myWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _myWindow.windowLevel = UIWindowLevelStatusBar;
        _myWindow.userInteractionEnabled = YES;
        //_myWindow.backgroundColor = [UIColor colorWithWhite:0.2f alpha:0.5f];
        
        _myWindow.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}

- (void)presentMyActionsheetWithView:(UIView *)view
{
    
    _backView = [[UIView alloc] init];
    
    _backView.backgroundColor = [UIColor whiteColor];
    
    CGRect f;
    f.size.width = kScreen_Width;
    f.size.height = view.frame.size.height + 60;
    f.origin.x = 0;
    f.origin.y = kScreen_Height - f.size.height;
    _backView.frame = f;
    
    f = view.bounds;
    f.origin.y = 40;
    f.origin.x = (kScreen_Width - f.size.width) * 0.5;
    view.frame = f;
    _myView = view;
    
    [_backView addSubview:view];
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(kScreen_Width - 80, 0, 80, 40);
        [button setTitle:@"确定" forState:UIControlStateNormal];
        
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(callBack) forControlEvents:UIControlEventTouchUpInside];
        [_backView addSubview:button];
    }
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 80, 40);
        [button setTitle:@"取消" forState:UIControlStateNormal];
       
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(dismissMyActionSheet) forControlEvents:UIControlEventTouchUpInside];
        [_backView addSubview:button];
    }
    [_myWindow addSubview:_backView];
    
    CGPoint center = _backView.center;
    center.y += _backView.frame.size.height;
    _backView.center = center;
    [_myWindow makeKeyAndVisible];
    
    [UIView animateWithDuration:0.4 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        CGPoint center = _backView.center;
        center.y -= _backView.frame.size.height;
        _backView.center = center;
    } completion:^(BOOL finished) {
        UIView *tapView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height - _backView.frame.size.height)];
        UITapGestureRecognizer* tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissMyActionSheet)];
        [tapView addGestureRecognizer:tap];
        [_myWindow addSubview:tapView];
    }];
}


- (void)dismissMyActionSheet
{
    if ([_delegate respondsToSelector:@selector(willDismissMyActionSheet:)]) {
        [_delegate willDismissMyActionSheet:self];
    }
    [UIView animateWithDuration:0.4 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _myWindow.alpha = 0;
        CGPoint center = _backView.center;
        center.y += _backView.frame.size.height;
        _backView.center = center;
    } completion:^(BOOL finished) {
        _myWindow.hidden = YES;
        [_mainWindow makeKeyAndVisible];
        if ([_delegate respondsToSelector:@selector(didDismissMyActionSheet:)]) {
            [_delegate didDismissMyActionSheet:self];
        }    }];
}


- (void)callBack
{
    if ([_delegate respondsToSelector:@selector(commitAction:withMyView:)]) {
        [_delegate commitAction:self withMyView:_myView];
    }
    [self dismissMyActionSheet];
}





@end
