//
//  ZMChooseSongFirstPgTableViewCell.h
//  ZMClock
//
//  Created by ZhongMeng on 16/8/12.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZMSearchSonngModell.h"




@protocol ZMChooseSongFirstPgTableViewCellDelegate <NSObject>

- (void)cellButtonAction:(UIButton *)sender;

@end





@interface ZMChooseSongFirstPgTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *songPictureImgV;

@property (weak, nonatomic) IBOutlet UIImageView *playPasueBtnImgV;

@property (weak, nonatomic) IBOutlet UILabel *songNameLb;

@property (weak, nonatomic) IBOutlet UILabel *songerNameLb;
@property (weak, nonatomic) IBOutlet UILabel *playTimeLb;


@property (weak, nonatomic) IBOutlet UIButton *playPauseBtn;

@property(nonatomic, copy) void (^playSongBlock)(UIButton *sender);


- (IBAction)playPauseButtonClicked:(id)sender;




@property (nonatomic, weak)id<ZMChooseSongFirstPgTableViewCellDelegate> cellDelegate;



@property (nonatomic, strong) ZMSearchSonngModell *searchSongModel;




- (void)updateSearchSongCellWith:(ZMSearchSonngModell *)searchSongModel;





@end
