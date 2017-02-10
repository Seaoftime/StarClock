//
//  ZMGameSettingViewController.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/18.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//
//  游戏设置视图控制器
//
//
//

#import "ZMGameBaseViewController.h"


#import "ZMBaseeNavigationViewController.h"


@interface ZMGameSettingViewController : ZMBaseeNavigationViewController

@property (nonatomic,strong) NSString *baobaostr1;//宝宝的名字
@property (nonatomic,strong) NSString *baobaostr2;//宝宝的金币
@property (nonatomic,strong) NSString *baobaostr3;//宝宝的亲密度等级
@property (nonatomic,strong) NSMutableArray *meInfoArray1; //!< 我的个人资料数据源数组


@property (nonatomic,strong) NSString *touxiangmingstr;// 头像字符
@property (nonatomic,strong) NSString *nichenstr;//昵称字符
@property(nonatomic,strong) UIImageView *touxiangview;// 头像
@property(nonatomic,strong) UILabel *nichenglabel;// 用户昵称
@property(nonatomic, strong) UILabel *xingbanLb;//星伴号


@property(nonatomic,strong) UILabel *baobaonichenglabel;//宝宝昵称
@property(nonatomic,strong) UILabel *baobaodengjilabel;// 宝宝金币
@property(nonatomic,strong) UILabel *baobaojingbilabel;// 宝宝等级

@end
