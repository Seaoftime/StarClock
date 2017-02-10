//
//  GameBarView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/7.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameAlertButton.h"
#import "GameItemTypeModel.h"

/////////////
#import "GameItemsModel.h"

#import "goumaimodel.h"
#import "leimodelgoumai.h"







@protocol GameBarViewDeletage  <NSObject>



-(void)gameBarAlertButtonAction:(GameAlertButton *)sender;





@end



@interface GameBarView : UIControl


@property (nonatomic,strong) GameAlertButton *leftAlertButton; //!< 左边的按钮
@property (nonatomic,strong) GameAlertButton *middleAlertButton; //!<中间的按钮
@property (nonatomic,strong) GameAlertButton *rightAlertButton; //!< 右边的按钮


@property (nonatomic,strong) UIImageView *jiagebaoshiduimageview1; //!< 价格饱食度图片1

@property (nonatomic,strong) UIImageView *jiagebaoshiduimageview2; //!< 价格饱食度图片2

@property (nonatomic,strong) UIImageView *jiagebaoshiduimageview3; //!< 价格饱食度图片3

@property (nonatomic,strong)UIButton *goumaibutton1; //!< 购买按钮

@property (nonatomic,strong)UIButton *goumaibutton2; //!< 购买按钮

@property (nonatomic,strong) UIButton *goumaibutton3; //!< 购买按钮


@property (nonatomic,strong) GameAlertButton * shiyongbutton1; //!< 使用按钮

@property (nonatomic,strong) GameAlertButton *shiyongbutton2; //!< 使用按钮

@property (nonatomic,strong) GameAlertButton *shiyongbutton3; //!< 使用按钮

@property (nonatomic,strong) UIImageView *topimage; //!< 头部视图

@property (nonatomic,strong) UIImageView *shangimage; //!< 上视图

@property (nonatomic,strong) UIImageView *zhongimage; //!< 中视图

@property (nonatomic,strong) UIImageView *xiaimage; //!< 下视图



@property (nonatomic,strong) UIImageView *shangimage1; //!< 线视图

@property (nonatomic,strong) UIImageView *zhongimage2; //!< 线视图

@property (nonatomic,strong) UIImageView *xiaimage3; //!< 线视图

@property(nonatomic,strong)UILabel *jiagelabel;//价格 Label
@property(nonatomic,strong)UILabel *baosidulabel;//饱食度 Label

@property(nonatomic,strong)UILabel *jiagelabel1;//价格 Label
@property(nonatomic,strong)UILabel *baosidulabel1;//饱食度 Label

@property(nonatomic,strong)UILabel *jiagelabel2;//价格 Label
@property(nonatomic,strong)UILabel *baosidulabel2;//饱食度 Label

@property (nonatomic,strong) NSMutableArray *gameItemArray; //!< 数组
@property (nonatomic,strong) NSMutableArray *gameItemArray1; //!< 数组
@property (nonatomic,strong) NSMutableArray *gameItemArray2; //!< 数组

@property (nonatomic,strong) GameItemsModel *wupingitme1;
@property (nonatomic,strong) GameItemsModel *wupingitme2;
@property (nonatomic,strong) GameItemsModel *wupingitme3;

@property (nonatomic,strong) NSString *wupingshustr;















@property (nonatomic,strong) id <GameBarViewDeletage> gameBarDeletage;
//!代理对象





#pragma mark 重置Frame
/**
 重置Frame
 */
-(void)resetWithleftImage:(NSString*)leftImage withmiddleImage:(NSString*)middleImagee withrightImage:(NSString*)rightImage withModel:(GameItemTypeModel*)model;

@end
