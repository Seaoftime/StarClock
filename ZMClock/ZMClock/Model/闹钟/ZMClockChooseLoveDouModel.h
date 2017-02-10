//
//  ZMClockChooseLoveDouModel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/11/8.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMBaseModel.h"

#import "JKDBModel.h"

@interface ZMClockChooseLoveDouModel : JKDBModel


@property (nonatomic, copy) NSString *voice_url;//歌曲链接
@property (nonatomic, copy) NSString *voice_pic;//歌曲图片
@property (nonatomic, copy) NSString *voice_name;//歌手名称
@property (nonatomic, copy) NSString *author_name;


@property (nonatomic, copy) NSString *voice_pathh;//歌曲下载路径
@property (nonatomic, copy) NSString *clocklist_pic;// 闹钟列表




//选中状态
@property(nonatomic, assign) BOOL choose_isSelected;




+ (NSMutableArray *)parseRespondsChooseLoveDouData:(NSDictionary *)dictionary;




@end
