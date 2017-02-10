//
//  ZMTableView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/3/2.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableTipView.h"

@protocol ZMTableViewDeletage <NSObject>

-(void)tipAction:(TableTipView*)sender;

@end


@interface ZMTableView : UITableView
@property (nonatomic,assign) id <ZMTableViewDeletage> tipDeletage;

-(instancetype)initWithFrame:(CGRect)frame withCellSeparatorStyle:(UITableViewCellSeparatorStyle)stype withImageName:(NSString*)imageName withTiptitle:(NSString*)tipTitle setDeletage:(id<ZMTableViewDeletage>)deletage;

-(void)tableTipViewWithArray:(NSArray*)taskArray;


@end
