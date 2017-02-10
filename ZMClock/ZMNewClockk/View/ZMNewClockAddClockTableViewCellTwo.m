//
//  ZMNewClockAddClockTableViewCellTwo.m
//  ZMClock
//
//  Created by ZhongMeng on 16/11/1.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMNewClockAddClockTableViewCellTwo.h"

@implementation ZMNewClockAddClockTableViewCellTwo

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.layer.cornerRadius = 15;
    self.layer.borderWidth = 2.0f;
    self.layer.borderColor = MAIN_MAIN_APP_COLOR.CGColor;
    self.layer.masksToBounds = YES;

    
    
    [self.everyDayBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.workDayBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.noworkDayBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    [self.dayOneBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.dayTwoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.dayThreeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.dayFourBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.dayFiveBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.daySixBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.dayEightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
