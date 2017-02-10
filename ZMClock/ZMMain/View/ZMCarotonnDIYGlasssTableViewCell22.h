//
//  ZMCarotonnDIYGlasssTableViewCell22.h
//  ZMClock
//
//  Created by ZhongMeng on 16/9/27.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "ZMCartoonDIYYModel.h"
#import "ZMCartoonDIYYModel2.h"



@interface ZMCarotonnDIYGlasssTableViewCell22 : UITableViewCell



@property (nonatomic, strong) ZMCartoonDIYYModel *diyGlassModel;
@property (nonatomic, strong) ZMCartoonDIYYModel2 *girl_diyGlassModel;






@property (weak, nonatomic) IBOutlet UIImageView *diyGlassImgV;

@property (weak, nonatomic) IBOutlet UIButton *selectGlassBtn;



@end
