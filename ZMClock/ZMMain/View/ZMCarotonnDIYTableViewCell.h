//
//  ZMCarotonnDIYTableViewCell.h
//  ZMClock
//
//  Created by ZhongMeng on 16/8/8.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZMCartoonDIYYModel.h"
#import "ZMCartoonDIYYModel2.h"

@interface ZMCarotonnDIYTableViewCell : UITableViewCell

@property (nonatomic, strong) ZMCartoonDIYYModel *diyModel;
@property (nonatomic, strong) ZMCartoonDIYYModel2 *girl_diyModel;

@property (weak, nonatomic) IBOutlet UIImageView *diyImgV;

@property (weak, nonatomic) IBOutlet UIButton *diySelectedBtn;

@property (weak, nonatomic) IBOutlet UIImageView *xxImmgV;







@end
