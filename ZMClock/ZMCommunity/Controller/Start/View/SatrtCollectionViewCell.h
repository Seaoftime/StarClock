//
//  SatrtCollectionViewCell.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/4.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZMButton.h"
#import "StartModel.h"

@protocol SatrtCollectionViewCellDeletage <NSObject>


-(void)attentionButtonAction:(ZMButton*)sender;


@end


@interface SatrtCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong) UIImageView *startImageView; //!< 明星头像
@property (nonatomic,strong) UILabel *startNanmeLabel; //!< 明星名字
@property (nonatomic,strong) UILabel *fansLabel; //!< 粉丝数量
@property (nonatomic,strong) ZMButton *attentionButton;//!< 关注按钮
@property (nonatomic,strong) StartModel *model;

@property (nonatomic,assign) id <SatrtCollectionViewCellDeletage> deletage; //!<代理对象





@end
