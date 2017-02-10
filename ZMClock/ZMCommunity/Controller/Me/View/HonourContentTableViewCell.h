//
//  HonourContentTableViewCell.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/9.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MeTableViewContentView.h"
#import "HonourModel.h"


@interface HonourContentTableViewCell : UITableViewCell


@property (nonatomic,strong) MeTableViewContentView *nickNameView; //!< 昵称视图
@property (nonatomic,strong) MeTableViewContentView *honourView; //!< 头衔视图
@property (nonatomic,strong) MeTableViewContentView *experienceView;  //!< 经验视图
@property (nonatomic,strong) MeTableViewContentView *actionView; //!< 操作视图



@property (nonatomic,strong) HonourModel *honourModel;

@end
