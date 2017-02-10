//
//  AddClockEditTableViewCell.h
//  ZMClock
//
//  Created by ZhongMeng on 16/3/3.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMTableViewCell.h"
#import "AddClockEditView.h"
#import "AddClockEditViewModel.h"

@interface AddClockEditTableViewCell : ZMTableViewCell


@property (nonatomic,strong) AddClockEditView *editView;
@property (nonatomic,strong) AddClockEditViewModel *model;



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;


@end
