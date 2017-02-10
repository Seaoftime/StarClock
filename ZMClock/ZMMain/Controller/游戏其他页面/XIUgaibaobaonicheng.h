//
//  XIUgaibaobaonicheng.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/30.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//
////
//宝宝昵称控制器
//
//

#import "ZMGameBaseViewController.h"

#import "baobaomodel.h"

#import "Baobaonichenxiugai.h"



@interface XIUgaibaobaonicheng : ZMGameBaseViewController
@property (nonatomic,strong) UITextField *nichenfield;

@property(nonatomic,strong)NSMutableArray *imageArray;

@property (nonatomic,strong) baobaomodel *baobaoInfoModel;



@end
