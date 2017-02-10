//
//  ClockTableViewCell.h
//  ZMClock
//
//  Created by ZhongMeng on 16/3/2.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMTableViewCell.h"
#import "ClockItemView.h"
#import "AddClockViewModel.h"

@protocol ClockTableViewCellDeletage <NSObject>

-(void)swithchAction:(ZMSwitch*)sender;

@end

@interface ClockTableViewCell : ZMTableViewCell
@property (nonatomic,strong) ClockItemView *itemView;
@property (nonatomic,strong) id <ClockTableViewCellDeletage> clockDeletage; //!< 代理对象

@property (nonatomic,strong) AddClockViewModel *model;

-(void)setindexTag:(NSInteger)tag;





@end
