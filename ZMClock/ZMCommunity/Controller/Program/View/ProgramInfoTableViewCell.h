//
//  ProgramInfoTableViewCell.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/30.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProgramView.h"
#import "ProgramFrame.h"


@interface ProgramInfoTableViewCell : UITableViewCell

@property (nonatomic,strong) ProgramView *startView; //!< 明星视图
@property (nonatomic,strong) ProgramView *infoView; //!< 行程详情视图
@property (nonatomic,strong) ProgramView *commentView; //!< “评论”视图

@property (nonatomic,strong) ProgramView *commentItemsView;


@property (nonatomic,strong) ProgramFrame *programFrame;

@end
