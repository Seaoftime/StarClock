//
//  ZMNewwClockkFirstpageTableViewCell.m
//  ZMClock
//
//  Created by ZhongMeng on 16/10/31.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMNewwClockkFirstpageTableViewCell.h"

@implementation ZMNewwClockkFirstpageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.layer.cornerRadius = 15;
    self.layer.borderWidth = 2.0f;
    self.layer.borderColor = MAIN_MAIN_APP_COLOR.CGColor;
    self.layer.masksToBounds = YES;
    
    
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
