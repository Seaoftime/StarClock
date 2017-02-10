//
//  ZMClockChooseLoveDouTableViewCell.m
//  ZMClock
//
//  Created by ZhongMeng on 16/11/8.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMClockChooseLoveDouTableViewCell.h"


#import "FGGDownloadManager.h"


@implementation ZMClockChooseLoveDouTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    //self.chooseBtn.layer.cornerRadius = 10;
    //self.chooseBtn.layer.masksToBounds = YES;
    
    //self.chooseBtn.backgroundColor = MAIN_MAIN_APP_COLOR;
    [self.chooseBtn setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)chooseBtnClickeds:(id)sender {
    
    if (self.downloadBlock) {
        
        self.downloadBlock(sender);
    }
    
}



- (void)setLoveModel:(ZMClockChooseLoveDouModel *)loveModel
{

    _loveModel = loveModel;
    
    
    if (loveModel.choose_isSelected){
        
        [self.chooseBtn setBackgroundImage:[UIImage imageNamed:@"已选cll"] forState:UIControlStateNormal];
        
    } else {
        
        [self.chooseBtn setBackgroundImage:[UIImage imageNamed:@"选他clooc"] forState:UIControlStateNormal];
    }

}



- (void)setLoveGirllModel:(ZMClockChooseLoveDouModel *)loveGirllModel
{

    _loveGirllModel = loveGirllModel;
    
    
    if (loveGirllModel.choose_isSelected){
        
        [self.chooseBtn setBackgroundImage:[UIImage imageNamed:@"已选cll"] forState:UIControlStateNormal];
        
    } else {
        
        [self.chooseBtn setBackgroundImage:[UIImage imageNamed:@"选她clloo"] forState:UIControlStateNormal];
    }




}





- (void)updateChooseRingCellWithModel:(ZMClockChooseLoveDouModel *)loveDouModel
{

    //检查之前是否已经下载，若已经下载，获取下载进度。
    BOOL exist = [[NSFileManager defaultManager] fileExistsAtPath:loveDouModel.voice_pathh];
    
    if(exist)
    {
        
        
        
        //[self.chooseBtn setTitle:@"已选" forState:UIControlStateNormal];
        //[self.chooseBtn setBackgroundColor:[UIColor whiteColor]];
        //[self.chooseBtn setTitleColor:MAIN_MAIN_APP_COLOR forState:UIControlStateNormal];
        
        
    }
    


}






@end
