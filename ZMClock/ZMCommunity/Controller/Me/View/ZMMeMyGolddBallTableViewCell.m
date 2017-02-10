//
//  ZMMeMyGolddBallTableViewCell.m
//  ZMClock
//
//  Created by ZhongMeng on 16/9/14.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMMeMyGolddBallTableViewCell.h"

@implementation ZMMeMyGolddBallTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
    
    //平移
    //self.ballImgV.transform = CGAffineTransformMakeTranslation (- 50,  50);
    
    //逆时针旋转
    self.ballImgV.transform  = CGAffineTransformMakeRotation(-M_PI /2);
    
    
    self.levelLb.transform  = CGAffineTransformMakeRotation(M_PI /2);
    
    self.levelLb.textColor = [UIColor whiteColor];
    
    
    self.goldLbb.transform  = CGAffineTransformMakeRotation(M_PI /2);
    self.goldLbb.textColor =  RGB(235, 84, 129);
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
