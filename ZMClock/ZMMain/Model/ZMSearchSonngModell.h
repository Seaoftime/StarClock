//
//  ZMSearchSonngModell.h
//  ZMClock
//
//  Created by ZhongMeng on 16/8/13.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMBaseModel.h"

@interface ZMSearchSonngModell : ZMBaseModel


@property (nonatomic, copy) NSString *mp3_url;//歌曲链接
@property (nonatomic, copy) NSString *music_id;//歌曲 id
@property (nonatomic, copy) NSString *music_pic;//歌曲图片
@property (nonatomic, copy) NSString *singer_name;//歌手名称
@property (nonatomic, copy) NSString *song_name;//歌曲名字


//选中状态
@property(nonatomic, assign) BOOL isSelected;



+ (NSMutableArray *)parseRespondsSearchhSongData:(NSDictionary *)dictionary;




@end
