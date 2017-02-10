//
//  ZRRActionSheet.h
//  ZMClock
//
//  Created by ZhongMeng on 16/11/1.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZRRActionSheet;

@protocol MyDatePickerActionSheetDelegate <NSObject>

@optional
-(void)willDismissMyActionSheet:(ZRRActionSheet *)sheet;
-(void)didDismissMyActionSheet:(ZRRActionSheet *)sheet;
-(void)commitAction:(ZRRActionSheet *)sheet withMyView:(UIView*)myView;

@end

@interface ZRRActionSheet : NSObject

@property (strong,nonatomic) UIWindow *mainWindow;
@property (strong,nonatomic) UIWindow *myWindow;
@property (strong,nonatomic) NSString *myTitle;
@property (strong,nonatomic) UIView *backView;
@property (weak,nonatomic) UIView *myView;

@property (weak) id<MyDatePickerActionSheetDelegate> delegate;

-(void)dismissMyActionSheet;
-(void)presentMyActionsheetWithView:(UIView*)view;

@end
