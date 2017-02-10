//
//  ZMCarotonnDIYGlasssTableViewCell22.m
//  ZMClock
//
//  Created by ZhongMeng on 16/9/27.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMCarotonnDIYGlasssTableViewCell22.h"

@implementation ZMCarotonnDIYGlasssTableViewCell22

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
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
