//
//  ZMShareMusicModel.m
//  ZMClock
//
//  Created by ZhongMeng on 16/6/24.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMShareMusicModel.h"

@implementation ZMShareMusicModel


+ (NSMutableArray *)parseRespondsShareMusicData:(NSDictionary *)dictionary
{
    NSMutableArray *modelArray = [NSMutableArray array];
    NSDictionary *resultDic = dictionary[@"data"];
    NSArray *dataArray = resultDic[@"voice_list"];
    
    for (NSDictionary *dic in dataArray) {
        ZMShareMusicModel *model = [[ZMShareMusicModel alloc] init];
        model.voice_id = dic[@"voice_id"];
        model.voice_name = dic[@"voice_name"];
        model.author_id = dic[@"author_id"];
        model.author_name = dic[@"author_name"];
        model.voice_url = dic[@"voice_url"];
        model.voice_download_num = dic[@"voice_download_num"];
        
        [modelArray addObject:model];
    }
    return modelArray;
}

@end
