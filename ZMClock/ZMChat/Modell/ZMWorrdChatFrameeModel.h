//
//  ZMWorrdChatFrameeModel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/11/12.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>



#import <UIKit/UIKit.h>
#import "ZMChatModell.h"




@interface ZMWorrdChatFrameeModel : NSObject



/** 时间的Frame */
@property (nonatomic, assign) CGRect timeFrame;
/** 头像的Frame */
@property (nonatomic, assign) CGRect headImageFrame;
/** 按钮(内容)的Frame */
@property (nonatomic, assign) CGRect btnFrame;
/** 是否是自己发送的信息 */
@property (nonatomic, assign) BOOL myself;
/** cell的高度 */
@property (nonatomic, assign) CGFloat cellHeight;

/** 模型数据 */
@property (nonatomic, strong) ZMChatModell *dataModel;

/** 通过模型数据计算出对应的Frame,并且返回出modelFrame自己这个对象 */
- (instancetype)initWithFrameModel:(ZMChatModell *)modelData timeIsEqual:(BOOL)timeBool;
//和上面同理
+ (instancetype)modelFrame:(ZMChatModell *)modelData timeIsEqual:(BOOL)timeBool;





@end
