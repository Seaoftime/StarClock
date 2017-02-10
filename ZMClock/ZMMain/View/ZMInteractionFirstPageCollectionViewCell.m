//
//  ZMInteractionFirstPageCollectionViewCell.m
//  ZMClock
//
//  Created by ZhongMeng on 16/9/6.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMInteractionFirstPageCollectionViewCell.h"

@implementation ZMInteractionFirstPageCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.flowerCollectionCellImgV.backgroundColor = RGB(167, 235, 253);
    
    self.bottomBgImgVv.backgroundColor = [UIColor blackColor];
    self.bottomBgImgVv.alpha = 0.3;
    
    
    self.flowerNameLb.textColor = [UIColor whiteColor];
    
    
    
}

@end
