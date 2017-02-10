//
//  ZMUserCenterrVoiceSpeakerTableViewCell.m
//  ZMClock
//
//  Created by ZhongMeng on 16/10/28.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMUserCenterrVoiceSpeakerTableViewCell.h"

@implementation ZMUserCenterrVoiceSpeakerTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setBoySpeakerModel:(ZMUserCennnterVoiceSpeakerModel *)boySpeakerModel
{
    _boySpeakerModel = boySpeakerModel;
    
    
    if (boySpeakerModel.useOrnot_isSelected){
        
        [self.useOrnotBtn setBackgroundImage:[UIImage imageNamed:@"使用中speaker"] forState:UIControlStateNormal];
        
    } else {
        
        [self.useOrnotBtn setBackgroundImage:[UIImage imageNamed:@"使用speaker"] forState:UIControlStateNormal];
    }

}



- (void)setGirllSpeakerModel:(ZMUserCennnterVoiceSpeakerModel *)girllSpeakerModel
{

    _girllSpeakerModel = girllSpeakerModel;
    
    if (girllSpeakerModel.useOrnot_isSelected) {
        
        [self.useOrnotBtn setBackgroundImage:[UIImage imageNamed:@"使用中speaker"] forState:UIControlStateNormal];
        
    } else {
        
        
        [self.useOrnotBtn setBackgroundImage:[UIImage imageNamed:@"使用speaker"] forState:UIControlStateNormal];
    }



}

@end
