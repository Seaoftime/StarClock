//
//  CommunityTableViewCell.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/3.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommunityFrame.h"
#import "CommunityView.h"




@interface CommunityTableViewCell : UITableViewCell



@property (nonatomic,strong) CommunityView *startView; //!< 明星视图
@property (nonatomic,strong) CommunityView *infoView; //!< 行程详情视图
@property (nonatomic,strong) CommunityView *communityItemsView; //!< 社区主页内容视图


@property (nonatomic,strong) CommunityFrame *communityFrame;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier setDeletage:(id)deletage;


@end
