//
//  ZMMusicTaskCollectionViewCell.h
//  ZMClock
//
//  Created by ZhangRui on 16/6/26.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZMMusicTaskModel.h"

@interface ZMMusicTaskCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *musicNameLb;

@property (weak, nonatomic) IBOutlet UILabel *uploadPeopleLb;
@property (weak, nonatomic) IBOutlet UIButton *downloadBtn;
@property (weak, nonatomic) IBOutlet UILabel *downloadCountLb;
@property (weak, nonatomic) IBOutlet UIProgressView *downloadProgressV;

@property (weak, nonatomic) IBOutlet UIButton *onlinePlayyBtn;


- (IBAction)onlinePlayBtn:(id)sender;

- (IBAction)downloadBtnClicked:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *topImgV;

@property (weak, nonatomic) IBOutlet UIImageView *downImgV;





@property(nonatomic,copy)void (^downloadBlock)(UIButton *sender);


@property(nonatomic,copy)void (^onlinePlayBlock)(UIButton *sender);


-(void)updateCellWithModel:(ZMMusicTaskModel *)model;


@end
