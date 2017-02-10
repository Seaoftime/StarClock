//
//  ZMDIanGePageDataModel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/8/16.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMBaseModel.h"

///歌曲播放历史
@interface ZMDIanGePageDataModel : ZMBaseModel


@property (nonatomic, copy) NSString *music_id;//对应的唯一ID
@property (nonatomic, copy) NSString *mp3_url;//歌曲链接
@property (nonatomic, copy) NSString *music_pic;//歌曲图片
@property (nonatomic, copy) NSString *singer_name;//歌手名称
@property (nonatomic, copy) NSString *song_name;//歌曲名字
@property (nonatomic, copy) NSString *play_time_1st;//首次播放时间


+ (NSMutableArray *)parseRespondsDianGePageData:(NSDictionary *)dictionary;


@end
