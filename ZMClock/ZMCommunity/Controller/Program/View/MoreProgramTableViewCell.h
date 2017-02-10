//
//  MoreProgramTableViewCell.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/4.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoreProgramView.h"
#import "MoreProgramFrame.h"



@interface MoreProgramTableViewCell : UITableViewCell

@property (nonatomic,strong) MoreProgramView *moreProgramInfoView;  //!< 更多行程详情视图
@property (nonatomic,strong) MoreProgramView *moreProgramBriefView; //!< 简要视图



@property (nonatomic,strong) MoreProgramFrame *moreProgramFrame;
@end
