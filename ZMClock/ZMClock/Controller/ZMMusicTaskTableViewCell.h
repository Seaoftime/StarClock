//
//  ZMMusicTaskTableViewCell.h
//  ZMClock
//
//  Created by ZhangRui on 16/6/25.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZMMusicTaskModel.h"

@interface ZMMusicTaskTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *musicNameLb;
@property (weak, nonatomic) IBOutlet UILabel *uploadPeopleLb;

@property (weak, nonatomic) IBOutlet UIButton *downloadBtn;

@property (weak, nonatomic) IBOutlet UILabel *downloadCountLb;

@property (weak, nonatomic) IBOutlet UIProgressView *downloadProgressV;



@property(nonatomic,copy)void (^downloadBlock)(UIButton *sender);

- (IBAction)downloadBtnClicked:(id)sender;







-(void)updateCellWithModel:(ZMMusicTaskModel *)model;

@end
