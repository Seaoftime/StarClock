//
//  ZMShareMusicModel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/6/24.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMBaseModel.h"

@interface ZMShareMusicModel : ZMBaseModel


@property (nonatomic, copy) NSString *voice_id;
@property (nonatomic, copy) NSString *voice_name;
@property (nonatomic, copy) NSString *author_id;
@property (nonatomic, copy) NSString *author_name;
@property (nonatomic, copy) NSString *voice_url;
@property (nonatomic, copy) NSString *voice_download_num;


+ (NSMutableArray *)parseRespondsShareMusicData:(NSDictionary *)dictionary;



@end
