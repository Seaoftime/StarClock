//
//  ZMNewClockMusicLeftTableViewCell.h
//  ZMClock
//
//  Created by ZhongMeng on 16/6/23.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//





#import <UIKit/UIKit.h>

//#import "ZMNewRecordMyMusicModel.h"
//#import "ZFSessionModel.h"

#import "ZMMusicTaskModel.h"
#import "ZMRecordDBModel.h"
#import "ZMSystemClockRingModell.h"



@interface ZMNewClockMusicLeftTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *musicNameLb;

@property (nonatomic, strong) ZMMusicTaskModel *model;
@property (nonatomic, strong) ZMRecordDBModel *recordDBModel;

@property (nonatomic, strong) ZMSystemClockRingModell *systemModel;

//@property (nonatomic,strong) UIImageView *accessoryImageView; //

@property (weak, nonatomic) IBOutlet UIImageView *rightImgV;

@property (weak, nonatomic) IBOutlet UIButton *rightSelectedBtn;




@end
