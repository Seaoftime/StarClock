//
//  ZMRecordDBModel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/6/27.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

typedef NS_ENUM(NSInteger,MyRecordSelectType)
{
    no_select_type2 = 0, //!< 未选中
    select_type2 = 1, //!< 选中
};



#import "JKDBModel.h"

@interface ZMRecordDBModel : JKDBModel


@property(nonatomic, copy) NSString *recordDBName;
@property(nonatomic, copy) NSString *recordDBUrl;


@property (nonatomic) MyRecordSelectType selectType; //!< 选择状态
//选中状态
@property(nonatomic, assign) BOOL isSelected;

@end
