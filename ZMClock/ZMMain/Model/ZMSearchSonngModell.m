//
//  ZMSearchSonngModell.m
//  ZMClock
//
//  Created by ZhongMeng on 16/8/13.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMSearchSonngModell.h"

@implementation ZMSearchSonngModell


+ (NSMutableArray *)parseRespondsSearchhSongData:(NSDictionary *)dictionary
{
    NSMutableArray *searchSongModelAry = [NSMutableArray array];
    NSDictionary *resultDic = dictionary[@"data"];
    NSArray *dataArray = resultDic[@"search"];
    
    for (NSDictionary *dic in dataArray) {
        
        ZMSearchSonngModell *model = [[ZMSearchSonngModell alloc] init];
        model.mp3_url = dic[@"mp3_url"];
        model.music_id = dic[@"music_id"];
        model.music_pic = dic[@"music_pic"];
        model.singer_name = dic[@"singer_name"];
        model.song_name = dic[@"song_name"];
       
        
        [searchSongModelAry addObject:model];
    }
    
    return searchSongModelAry;
}



@end
