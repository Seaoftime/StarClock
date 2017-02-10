//
//  ZMNewRecordMyMusicModel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/6/23.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZMNewRecordMyMusicModel : NSObject


@property (nonatomic,copy) NSString *primary_id; //!< 这个是数据库中的主键id号


@property (nonatomic,copy) NSString *myMusicName;

@property (nonatomic,copy) NSString *recordPath;

@property (nonatomic,copy) NSString *fromType;


@end
