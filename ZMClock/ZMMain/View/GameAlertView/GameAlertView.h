//
//  GameAlertView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/7.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameBarView.h"
#import "GameItemsModel.h"



@interface GameAlertView : UIControl

@property (nonatomic,strong) GameBarView *gameBarView;  //!< 存放游戏消费内容


@property (nonatomic) BOOL isHiddenAndDismiss;  //!< 是否隐藏并消失


@property(nonatomic,strong)UILabel *weishiSOnghuaQingjielabel;//!>物品总称label

@property(nonatomic,strong)UILabel *jinbilabel;//!>金币个数label

@property(nonatomic,strong)UIImageView *jinbiimageview;//!>金币imageview

@property(nonatomic,strong)UIButton *button;


@property(nonatomic,strong)UIView *jinbiview;
///////////////

@property (nonatomic,strong) NSMutableArray *gameItemArray; //!< 数组



-(instancetype)initWithDeletae:(id)deletage;

-(void)show;

-(void)dismiss;



@end
