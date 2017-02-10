//
//  SystemTinkleView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/3/4.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMView.h"

@interface SystemTinkleView : ZMView

@property (nonatomic,strong) ZMTableView *systemTinkleTableView;

-(instancetype)initWithFrame:(CGRect)frame withCellSeparatorStyle:(UITableViewCellSeparatorStyle)stype withArray:(NSMutableArray*)array withDeletage:(id)deletage;

@end
