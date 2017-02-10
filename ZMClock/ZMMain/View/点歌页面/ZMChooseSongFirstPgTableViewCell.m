//
//  ZMChooseSongFirstPgTableViewCell.m
//  ZMClock
//
//  Created by ZhongMeng on 16/8/12.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMChooseSongFirstPgTableViewCell.h"



@interface ZMChooseSongFirstPgTableViewCell ()


@end

@implementation ZMChooseSongFirstPgTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
//    self.songPictureImgV.userInteractionEnabled = YES;
//    
//    self.songPictureImgV.layer.cornerRadius = 40;
//    self.songPictureImgV.layer.masksToBounds = YES;
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (IBAction)playPauseButtonClicked:(id)sender {
    
    //if(self.playSongBlock)
    //    self.playSongBlock(sender);
    
}




- (IBAction)cellButtonAction:(id)sender {
    
    if (self.cellDelegate) {
        [self.cellDelegate cellButtonAction:sender];
    }
    
}






- (void)updateSearchSongCellWith:(ZMSearchSonngModell *)searchSongModel
{

    NSString *url = searchSongModel.music_pic;
    
    if (url == nil || url == NULL || [url isKindOfClass:[NSNull class]]) {
        
        
    }else {
    
        [self.songPictureImgV sd_setImageWithURL:[NSURL URLWithString:searchSongModel.music_pic]];
    
    }
    
    
    self.songNameLb.text = searchSongModel.song_name;
    self.songerNameLb.text = searchSongModel.singer_name;

    
    
    
    _searchSongModel = searchSongModel;
    
    
    
    
//    if (searchSongModel.isSelected){
//        
//        [self.playPauseBtn setBackgroundImage:[UIImage imageNamed:@"暂停-图标"] forState:UIControlStateNormal];
//        
//        
//        
//        
//    } else {
//        
//        [self.playPauseBtn setBackgroundImage:[UIImage imageNamed:@"播放-图标"] forState:UIControlStateNormal];
//        
//      
//    }

    

}







@end
