//
//  SwitchStartView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/6.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//  切换明星视图
//
//
//
//




#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "SwitchStartModel.h"


@protocol SwitchStartViewDeletage <NSObject>

-(void)switchStartViewAction:(SwitchStartModel*)model;

@end


@interface SwitchStartView : UIControl <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *startTableView; //!< 切换明星列表

@property (nonatomic,assign) id <SwitchStartViewDeletage> switchStartdeletage;


/**
 初始化切换视图
 */
-(instancetype)initSwitchStartViewWithDeletage:(id<SwitchStartViewDeletage>)deletage;


-(void)showWithStartArray:(NSMutableArray*)array;


@end
