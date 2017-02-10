//
//  AddClockTableViewCell.h
//  ZMClock
//
//  Created by ZhongMeng on 16/3/3.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMTableViewCell.h"
#import "AddClockView.h"
#import "AddClockViewModel.h"

@protocol AddClockTableViewCellDeletage <NSObject>

-(void)switchAction:(ZMSwitch*)sender;


@end

@interface AddClockTableViewCell : ZMTableViewCell


@property (nonatomic,strong) AddClockViewModel *model;
@property (nonatomic,strong) AddClockView *addNormalView;
@property (nonatomic,strong) AddClockView *addNoNormalView;
@property (nonatomic,assign) id <AddClockTableViewCellDeletage> addClockDeletage; //！添加闹钟的代理对象

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
