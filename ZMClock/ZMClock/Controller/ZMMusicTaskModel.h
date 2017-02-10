//
//  ZMMusicTaskModel.h
//  ZMClock
//
//  Created by ZhangRui on 16/6/25.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

//#import "ZMBaseModel.h"


//typedef NS_ENUM(NSInteger,MyMusicSelectType)
//{
//    no_select_type1 = 0, //!< 未选中
//    select_type1 = 1, //!< 选中
//};
//



#import "JKDBModel.h"

@interface ZMMusicTaskModel : JKDBModel


@property(nonatomic, copy) NSString *musicName;
@property(nonatomic, copy) NSString *musicUploadPeopleName;
@property(nonatomic, copy) NSString *musicUrl;
@property(nonatomic, copy) NSString *musicDownloadCount;

@property(nonatomic, copy) NSString *musicDestinationPath;


+ (instancetype)model;

+ (NSMutableArray *)parseRespondsMusicTaskData:(NSDictionary *)dictionary;

//@property (nonatomic) MyMusicSelectType selectType; //!< 选择状态

//选中状态
@property(nonatomic, assign) BOOL isSelected;


@end
