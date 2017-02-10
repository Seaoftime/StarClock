//
//  ZMCartoonFaceeTableViewCell.h
//  ZMClock
//
//  Created by ZhongMeng on 16/9/2.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZMCartoonDIYYModel.h"
#import "ZMCartoonDIYYModel2.h"


@interface ZMCartoonFaceeTableViewCell : UITableViewCell


@property (nonatomic, strong) ZMCartoonDIYYModel *diyFaceModel;
@property (nonatomic, strong) ZMCartoonDIYYModel2 *girl_diyFaceModel;


@property (weak, nonatomic) IBOutlet UIImageView *diyFaceImgV;

@property (weak, nonatomic) IBOutlet UIButton *selectedFaceBtn;


@property (weak, nonatomic) IBOutlet UIImageView *faceeImgV;









@end
