//
//  GameAlertButton.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/7.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//
//弹出食物，花朵，清洁品的alertView
//
//

#import <UIKit/UIKit.h>
#import "GameItemsModel.h"


@interface GameAlertButton : UIButton

@property (nonatomic,strong) UILabel *tipLabel; //!< 提示标签

@property (nonatomic,strong) GameItemsModel *model; //!< 数据模型


////////////
//@property (nonatomic,strong) UILabel *jiagelabel; //!< 价格标签

//@property (nonatomic,strong) UILabel *tishiLabel;//!<  提示 Label






-(void)resetFrame:(CGRect)frame;


@end
