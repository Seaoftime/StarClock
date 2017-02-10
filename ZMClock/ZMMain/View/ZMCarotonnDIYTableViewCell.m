//
//  ZMCarotonnDIYTableViewCell.m
//  ZMClock
//
//  Created by ZhongMeng on 16/8/8.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMCarotonnDIYTableViewCell.h"

@implementation ZMCarotonnDIYTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
//    self.diyImgV.layer.cornerRadius = 10;
//    self.diyImgV.layer.masksToBounds = YES;
//    
//    self.diyImgV.layer.borderColor = RGB(228, 84, 129).CGColor;
//    
//    self.diyImgV.layer.borderWidth = 1.5;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (void)setDiyModel:(ZMCartoonDIYYModel *)diyModel
{

    _diyModel = diyModel;
    

    if (diyModel.isSelected){
        
        [self.diySelectedBtn setBackgroundImage:[UIImage imageNamed:@"选中铃声"] forState:UIControlStateNormal];
        
    } else {
        
        [self.diySelectedBtn setBackgroundImage:[UIImage imageNamed:@"未选中铃声"] forState:UIControlStateNormal];
    }



}

- (void)setGirl_diyModel:(ZMCartoonDIYYModel2 *)girl_diyModel
{

    _girl_diyModel = girl_diyModel;
    
    
    if (girl_diyModel.girl_isSelected){
        
        [self.diySelectedBtn setBackgroundImage:[UIImage imageNamed:@"选中铃声"] forState:UIControlStateNormal];
        
    } else {
        
        [self.diySelectedBtn setBackgroundImage:[UIImage imageNamed:@"未选中铃声"] forState:UIControlStateNormal];
    }




}




@end
