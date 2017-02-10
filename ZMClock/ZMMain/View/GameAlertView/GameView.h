//
//  GameView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/6.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//
//  游戏上承载各个控件元素视图
//
//

#import <UIKit/UIKit.h>
#import "GameItemView.h"
#import "GameItemTypeModel.h"
#import "GameItemsModel.h"


@protocol GameViewDeletage <NSObject>

-(void)gameItemViewAction:(GameItemView*)sender;


@end

@interface GameView : UIView

@property (nonatomic,strong) GameItemView *loveView; //!< 恋爱值

@property (nonatomic,strong) GameItemView *foodView;  //!< 食物
@property (nonatomic,strong) GameItemView *rinseView; //! 清洁视图
@property (nonatomic,strong) GameItemView *flowerView;  //!< 送花视图
////
@property(nonatomic,strong) UILabel * love_level;//!<等级
@property(nonatomic,strong) UILabel * love_val;//!< 亲密度







@property (nonatomic,retain) id <GameViewDeletage> gameDeletage; //!< 代理对象

-(instancetype)initWithFrame:(CGRect)frame setDeletage:(id<GameViewDeletage>)deletage;

-(void)resetDataArray:(NSMutableArray*)dataArray; //!<重新设置model数据模型


@end
