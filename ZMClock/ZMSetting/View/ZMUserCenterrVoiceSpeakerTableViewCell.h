//
//  ZMUserCenterrVoiceSpeakerTableViewCell.h
//  ZMClock
//
//  Created by ZhongMeng on 16/10/28.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZMUserCennnterVoiceSpeakerModel.h"

@interface ZMUserCenterrVoiceSpeakerTableViewCell : UITableViewCell

@property (nonatomic, strong) ZMUserCennnterVoiceSpeakerModel *boySpeakerModel;

@property (nonatomic, strong) ZMUserCennnterVoiceSpeakerModel *girllSpeakerModel;


@property (weak, nonatomic) IBOutlet UILabel *voiceStyleLb;

@property (weak, nonatomic) IBOutlet UIButton *playBtn;

@property (weak, nonatomic) IBOutlet UIButton *useOrnotBtn;


@end
