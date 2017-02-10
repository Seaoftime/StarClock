//
//  StartModel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/4.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//



typedef NS_ENUM(NSInteger,StatusModelType)
{
    /**
     关注或者正在申请入住类型
     */
    AlreadyAttentionType = 1,
    
    /**
     未关注或者未开通类型
     */
    NoAttentionType = 2,
};



typedef NS_ENUM(NSInteger,StartType)
{
    /**
     已经入住明星
     */
    EnterStartType,
    
    /**
     申请开通明星
     */
    SupportStartType,
    
    
};



#import <Foundation/Foundation.h>





@interface StartModel : NSObject

@property (nonatomic,retain) NSString *startUrl; //!<明星头像url地址
@property (nonatomic,retain) NSString *startName; //!<明星名称
@property (nonatomic,retain) NSString *startFans; //!< 明星粉丝
@property (nonatomic,retain) NSString *startId; //!< 明星id


@property (nonatomic) StatusModelType statusModelType; //!< 入住类型

@property (nonatomic) StartType startType; //!< 入住类型

@end
