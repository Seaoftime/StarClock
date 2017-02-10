//
//  ZMDIanGePageDataModel.m
//  ZMClock
//
//  Created by ZhongMeng on 16/8/16.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMDIanGePageDataModel.h"

@implementation ZMDIanGePageDataModel


+ (NSMutableArray *)parseRespondsDianGePageData:(NSDictionary *)dictionary
{
    NSMutableArray *diangeModelAry = [NSMutableArray array];
    
    NSDictionary *resultDic = dictionary[@"data"];
    //NSArray *dataArray = resultDic[@"search"];
    NSArray *dataArray = resultDic[@"play_his"];
    
    
    
    for (NSDictionary *dic in dataArray) {
        
        ZMDIanGePageDataModel *model = [[ZMDIanGePageDataModel alloc] init];
        model.mp3_url = dic[@"mp3_url"];
        model.music_id = dic[@"music_id"];
        model.music_pic = dic[@"music_pic"];
        model.singer_name = dic[@"singer_name"];
        model.song_name = dic[@"song_name"];
        model.play_time_1st = dic[@"play_time_1st"];
        
        [diangeModelAry addObject:model];
    }
    
    return diangeModelAry;
}





@end
