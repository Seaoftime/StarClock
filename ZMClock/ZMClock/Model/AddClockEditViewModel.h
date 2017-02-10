//
//  AddClockEditViewModel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/3/3.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddClockEditViewModel : NSObject

/**
 每行分割线的类型
 因为设计图设计分割线风格不一样所以需要自定义分割线的长短和位置
 */
@property (nonatomic) MeCellType cellType;


/**
 标题
 */
@property (nonatomic,retain) NSString *title;


@end
