//
//  ZMChatManagerrTableViewCell1.m
//  ZMClock
//
//  Created by ZhongMeng on 16/8/19.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMChatManagerrTableViewCell1.h"

@implementation ZMChatManagerrTableViewCell1

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.imageV1.layer.cornerRadius = 10;
    self.imageV1.layer.masksToBounds = YES;
    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}




@end
