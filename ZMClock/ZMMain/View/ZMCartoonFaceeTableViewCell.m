//
//  ZMCartoonFaceeTableViewCell.m
//  ZMClock
//
//  Created by ZhongMeng on 16/9/2.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMCartoonFaceeTableViewCell.h"

@implementation ZMCartoonFaceeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
    
    
//    self.diyFaceImgV.layer.cornerRadius = 10;
//    self.diyFaceImgV.layer.masksToBounds = YES;
//    
//    self.diyFaceImgV.layer.borderColor = RGB(228, 84, 129).CGColor;
//    
//    self.diyFaceImgV.layer.borderWidth = 1.5;

    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}




- (void)setDiyFaceModel:(ZMCartoonDIYYModel *)diyFaceModel
{
    
    _diyFaceModel = diyFaceModel;
    
    
    if (diyFaceModel.isSelected){
        
        [self.selectedFaceBtn setBackgroundImage:[UIImage imageNamed:@"选中diyi"] forState:UIControlStateNormal];
        
    } else {
        
        [self.selectedFaceBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }
    
    
    
}

- (void)setGirl_diyFaceModel:(ZMCartoonDIYYModel2 *)girl_diyFaceModel
{
    
    _girl_diyFaceModel = girl_diyFaceModel;
    
    
    if (girl_diyFaceModel.girl_isSelected){
        
        [self.selectedFaceBtn setBackgroundImage:[UIImage imageNamed:@"选中diyi"] forState:UIControlStateNormal];
        
    } else {
        
        [self.selectedFaceBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }
    
    
    
    
}








@end
