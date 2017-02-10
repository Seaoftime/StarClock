//
//  TopHeaderView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/16.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//  头部包含闹钟、天气视图
//
//

#import <UIKit/UIKit.h>
#import "TopHeaderControl.h"
#import "WeatherModel.h"

@protocol TopHeaderViewDeletae <NSObject>

-(void)topHeaderViewAction:(TopHeaderControl*)sender;


@end

@interface TopHeaderView : UIView

@property (nonatomic,strong) TopHeaderControl *clockView; //!<闹钟视图
@property (nonatomic,strong) TopHeaderControl *weatherView; //!< 天气视图

@property (nonatomic,assign) id <TopHeaderViewDeletae> deletage; 


-(instancetype)initWithFrame:(CGRect)frame withDeletahe:(id<TopHeaderViewDeletae>)deletage;


/**
 设置天气参数
 */
-(void)resetModel:(WeatherModel*)model;

@end
