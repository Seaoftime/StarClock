//
//  MeInfoTableViewCell.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/28.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//
//  我的个人资料自定义单元格
//
//
//

#import <UIKit/UIKit.h>
#import "MeInfoTableViewContentView.h"
#import "MeInfoModel.h"

@protocol MeInfoTableViewCellDeletage <NSObject>

-(void)tapGestureRecognizer:(UITapGestureRecognizer*)sender;

@end

@interface MeInfoTableViewCell : UITableViewCell

@property (nonatomic,strong) MeInfoTableViewContentView *headPortraitView;
@property (nonatomic,strong) MeInfoTableViewContentView *normalView;
@property (nonatomic,assign) id <MeInfoTableViewCellDeletage> deletage;  //!< 代理对象

@property (nonatomic,strong) MeInfoModel *model;


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier setDeletage:(id<MeInfoTableViewCellDeletage>)deletage;

@end
