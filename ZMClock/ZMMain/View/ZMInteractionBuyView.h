//
//  ZMInteractionBuyView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/9/6.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//


//////////张锐

#import <UIKit/UIKit.h>



@protocol InteractionBuyViewCloseButtonDelegete <NSObject>


//- (void)closeButtonClicked:(id)sender;

- (void)closeButtonClicked;


@end




@interface ZMInteractionBuyView : UIView


@property (nonatomic, strong) UIView *bgV;
@property (nonatomic, strong) UILabel *titleLb;
@property (nonatomic, strong) UIButton *closeBtn;
@property (nonatomic, strong) UILabel *mineLb;
@property (nonatomic, strong) UILabel *goldLb;
@property (nonatomic, strong) UIImageView *goldImgV;
@property (nonatomic, strong) UIImageView *flowerImgV;
@property (nonatomic, strong) UIButton *subBtn;
@property (nonatomic, strong) UIButton *addBtn;
@property (nonatomic, strong) UILabel *needGoldLb;

@property (nonatomic, strong) UILabel *heLb;
@property (nonatomic, strong) UILabel *allGoldLb;
@property (nonatomic, strong) UIImageView *goldImgVV;

@property (nonatomic, strong) UIButton *buyyBtn;

@property (nonatomic, strong) UILabel *sorryNoBuyLb;

@property (nonatomic, strong) UILabel *sorryNoBuyLianjieLb;





- (instancetype)initWithInteractionFrame:(CGRect)frame;


@property (nonatomic, weak) id <InteractionBuyViewCloseButtonDelegete> closeBtnDelegate;











@end

















