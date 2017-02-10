//
//  SettingViewModel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/3/2.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SettingViewModel : NSObject

/**
 图片名称
 */
@property (nonatomic,retain) NSString  *imageName;


/**
 箭头图标的名字
 */
@property (nonatomic,retain) NSString *accessoryName;


/**
 单元格的内容标题
 */
@property (nonatomic,retain) NSString  *titleText;


/**
 每行的行高
 */
@property (nonatomic) float  cellHight;

/**
 每行分割线的类型
 因为设计图设计分割线风格不一样所以需要自定义分割线的长短和位置
 */
@property (nonatomic) MeCellLineType celllineType;


/**
 每行分割线的类型
 因为设计图设计分割线风格不一样所以需要自定义分割线的长短和位置
 */
@property (nonatomic) MeCellType cellType;


/**
 是否要显示箭头信息
 */
@property (nonatomic) AccessoryType accessoryType;


/**
 是否已登录
 NO ： 未登录
 YES： 已登录
 */
@property (nonatomic)   BOOL isLogin;



@end
