//
//  ZMClockChooseLoveDouTableViewCell.h
//  ZMClock
//
//  Created by ZhongMeng on 16/11/8.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZMClockChooseLoveDouModel.h"


@interface ZMClockChooseLoveDouTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *peopleImgV;

@property (weak, nonatomic) IBOutlet UILabel *peopleNameLb;


@property (weak, nonatomic) IBOutlet UIButton *listenBtn;

@property (weak, nonatomic) IBOutlet UIButton *chooseBtn;



- (IBAction)chooseBtnClickeds:(id)sender;



@property (nonatomic, strong) ZMClockChooseLoveDouModel *loveModel;



@property (nonatomic, strong) ZMClockChooseLoveDouModel *loveGirllModel;




@property(nonatomic,copy)void (^downloadBlock)(UIButton *sender);


- (void)updateChooseRingCellWithModel:(ZMClockChooseLoveDouModel *)loveDouModel;




@end
