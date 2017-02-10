//
//  MeTableViewCell.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/28.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//
//  我
//
//
//

#import <UIKit/UIKit.h>
#import "MeTableViewContentView.h"
#import "MeModel.h"

@interface MeTableViewCell : UITableViewCell


@property (nonatomic,strong) MeTableViewContentView *nickNameView; //!< 昵称视图
@property (nonatomic,strong) MeTableViewContentView *fansView;  //!< 粉丝视图
@property (nonatomic,strong) MeTableViewContentView *honourView; //!< 头衔视图
@property (nonatomic,strong) MeTableViewContentView *messageView; //!< 消息视图
@property (nonatomic,strong) MeTableViewContentView *startViwe;  //!< 明星视图


@property (nonatomic,strong) MeModel *model;  //数据模型






@end
