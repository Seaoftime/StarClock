//
//  ZMCarotonnDIYGlasssTableViewCell.m
//  ZMClock
//
//  Created by ZhongMeng on 16/8/26.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMCarotonnDIYGlasssTableViewCell.h"

@implementation ZMCarotonnDIYGlasssTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
    
    //        if ([ZMSystemTool iPhone5Device]) {
    //
    //
    //
    //        }else if ([ZMSystemTool iPhone6Device]) {
    //
    //            if (indexPath.row == 0) {
    //
    //                cell.diyGlassImgV.frame = CGRectMake(20, 40, 30, 30);
    //            }
    //
    //
    //        } else {
    //
    //            
    //        }
    
    
    
    
    
    
//    self.diyGlassImgV.layer.cornerRadius = 10;
//    self.diyGlassImgV.layer.masksToBounds = YES;
//    
//    self.diyGlassImgV.layer.borderColor = RGB(228, 84, 129).CGColor;
//    
//    self.diyGlassImgV.layer.borderWidth = 1.5;
    
    
    
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}





- (void)setDiyGlassModel:(ZMCartoonDIYYModel *)diyGlassModel
{
    
    _diyGlassModel = diyGlassModel;
    
    
    if (diyGlassModel.isSelected){
        
        [self.selectGlassBtn setBackgroundImage:[UIImage imageNamed:@"选中dii"] forState:UIControlStateNormal];
        
    } else {
        
        [self.selectGlassBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }
    
    
    
}

- (void)setGirl_diyGlassModel:(ZMCartoonDIYYModel2 *)girl_diyGlassModel
{
    
    _girl_diyGlassModel = girl_diyGlassModel;
    
    
    if (girl_diyGlassModel.girl_isSelected){
        
        [self.selectGlassBtn setBackgroundImage:[UIImage imageNamed:@"选中dii"] forState:UIControlStateNormal];
        
    } else {
        
        [self.selectGlassBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }
    
    
    
    
}













@end
