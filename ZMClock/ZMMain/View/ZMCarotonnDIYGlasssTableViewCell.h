//
//  ZMCarotonnDIYGlasssTableViewCell.h
//  ZMClock
//
//  Created by ZhongMeng on 16/8/26.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "ZMCartoonDIYYModel.h"
#import "ZMCartoonDIYYModel2.h"


@interface ZMCarotonnDIYGlasssTableViewCell : UITableViewCell


@property (nonatomic, strong) ZMCartoonDIYYModel *diyGlassModel;
@property (nonatomic, strong) ZMCartoonDIYYModel2 *girl_diyGlassModel;



@property (weak, nonatomic) IBOutlet UIImageView *diyGlassImgV;

@property (weak, nonatomic) IBOutlet UIButton *selectGlassBtn;






















@end
