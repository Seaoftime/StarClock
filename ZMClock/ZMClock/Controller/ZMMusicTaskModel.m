//
//  ZMMusicTaskModel.m
//  ZMClock
//
//  Created by ZhangRui on 16/6/25.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMMusicTaskModel.h"

//#import "JKDBHelper.h"

@implementation ZMMusicTaskModel


+ (instancetype)model
{
    return [[[self class] alloc] init];
}


+ (NSMutableArray *)parseRespondsMusicTaskData:(NSDictionary *)dictionary
{
    NSMutableArray *modelArray = [NSMutableArray array];
    NSDictionary *resultDic = dictionary[@"data"];
    NSArray *dataArray = resultDic[@"voice_list"];
    
    for (NSDictionary *dic in dataArray) {
        
        ZMMusicTaskModel *model = [[ZMMusicTaskModel alloc] init];
        //model.voice_id = dic[@"voice_id"];
        model.musicName = dic[@"voice_name"];
        //model.author_id = dic[@"author_id"];
        model.musicUploadPeopleName = dic[@"author_name"];
        model.musicUrl = dic[@"voice_url"];
        model.musicDownloadCount = dic[@"voice_download_num"];
        
        [modelArray addObject:model];
    }
    return modelArray;

}



@end
