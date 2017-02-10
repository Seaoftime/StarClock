//
//  CreateRecordToolView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/25.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CreateRecordToolViewDeletage <NSObject>

-(void)createRecordToolButtonAction:(ZMButton*)sender;

@end



@interface CreateRecordToolView : UIView


/**
 清空重录
 */
@property (nonatomic,strong) ZMButton *clearButton;


/**
 生成我的语音
 */
@property (nonatomic,strong) ZMButton *createButton;

/**
 重新生成
 */
@property (nonatomic,strong) ZMButton *resetButton;


@property (nonatomic,strong) id <CreateRecordToolViewDeletage> recordToodeletage;


-(instancetype)initWithFrame:(CGRect)frame setDeletage:(id<CreateRecordToolViewDeletage>)deletage;

@end
