//
//  ZMNewClockMusicLeftTableViewCell.m
//  ZMClock
//
//  Created by ZhongMeng on 16/6/23.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMNewClockMusicLeftTableViewCell.h"

@implementation ZMNewClockMusicLeftTableViewCell


//- (UIImageView*)accessoryImageView
//{
//    if (_accessoryImageView == nil)
//    {
//        _accessoryImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
//    }
//    return _accessoryImageView;
//}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    //self.rightImgV.backgroundColor = RGB(235.0, 255.0, 255.0);
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeBGColor) name:@"cellChangeBGColor" object:nil];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
    //self.rightImgV.image = [UIImage imageNamed:@"选中铃声"];
    
    

}


- (void)changeBGColor
{
    self.rightImgV.image = [UIImage imageNamed:@"选中铃声"];


}

- (void)setModel:(ZMMusicTaskModel *)model
{
    _model = model;
    
    self.musicNameLb.text = model.musicName;
    
    //
//    switch (model.selectType)
//    {
//        case no_select_type1:
//        {
//            [self.rightImgV setImage:[UIImage imageNamed:@"未选中铃声"]];
//        }
//            break;
//        case select_type1:
//        {
//            [self.rightImgV setImage:[UIImage imageNamed:@"选中铃声"]];
//        }
//            break;
//    }
    
    if (model.isSelected){
        
        [self.rightSelectedBtn setBackgroundImage:[UIImage imageNamed:@"选中铃声"] forState:UIControlStateNormal];
    } else {
        [self.rightSelectedBtn setBackgroundImage:[UIImage imageNamed:@"未选中铃声"] forState:UIControlStateNormal];
    }

    

}


- (void)setRecordDBModel:(ZMRecordDBModel *)recordDBModel
{

    _recordDBModel = recordDBModel;
    
    self.musicNameLb.text = recordDBModel.recordDBName;
    
    
    //
//    switch (recordDBModel.selectType)
//    {
//        case no_select_type2:
//        {
//            [self.rightImgV setImage:[UIImage imageNamed:@"未选中铃声"]];
//        }
//            break;
//        case select_type2:
//        {
//            [self.rightImgV setImage:[UIImage imageNamed:@"选中铃声"]];
//        }
//            break;
//    }

    if (recordDBModel.isSelected){
        
        [self.rightSelectedBtn setBackgroundImage:[UIImage imageNamed:@"选中铃声"] forState:UIControlStateNormal];
        
    } else {
        
        [self.rightSelectedBtn setBackgroundImage:[UIImage imageNamed:@"未选中铃声"] forState:UIControlStateNormal];
    }
    


}


- (void)setSystemModel:(ZMSystemClockRingModell *)systemModel
{
    _systemModel = systemModel;
    
    //self.musicNameLb.text = systemModel.systemName;
    
    
    
    if (systemModel.isSelected){
        
        [self.rightSelectedBtn setBackgroundImage:[UIImage imageNamed:@"选中铃声"] forState:UIControlStateNormal];
        
    } else {
        
        [self.rightSelectedBtn setBackgroundImage:[UIImage imageNamed:@"未选中铃声"] forState:UIControlStateNormal];
    }
    

}



@end
