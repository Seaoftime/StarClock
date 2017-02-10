//
//  ZMClockChooseLoveDouModel.m
//  ZMClock
//
//  Created by ZhongMeng on 16/11/8.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMClockChooseLoveDouModel.h"


#define kDocumentPath (NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0])


@implementation ZMClockChooseLoveDouModel


+ (NSMutableArray *)parseRespondsChooseLoveDouData:(NSDictionary *)dictionary
{
    NSMutableArray *diangeModelAry = [NSMutableArray array];
    
    NSDictionary *resultDic = dictionary[@"data"];
    //NSArray *dataArray = resultDic[@"search"];
    NSArray *dataArray = resultDic[@"voice_list"];
    
    
    
    for (NSDictionary *dic in dataArray) {
        
        ZMClockChooseLoveDouModel *model = [[ZMClockChooseLoveDouModel alloc] init];
        
        //NSString *strr = dic[@"author_name"];
        
        model.voice_pic = dic[@"list_page_url"][@"path"];
        model.voice_url = dic[@"voice_url"];
        model.voice_name = dic[@"voice_name"];
        model.author_name = dic[@"author_name"];
        
        
        model.clocklist_pic = dic[@"clock_page_url"][@"path"];
        
        //model.voice_pathh = [kDocumentPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.mp3",strr]];
        
        
        
        [diangeModelAry addObject:model];
        
    }
    
    return diangeModelAry;


}




@end
