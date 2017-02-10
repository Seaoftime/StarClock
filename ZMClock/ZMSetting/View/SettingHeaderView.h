//
//  SettingHeaderView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/3/2.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMView.h"


@protocol SettingHeaderDeletage <NSObject>

-(void)settingHeaderAction:(ZMButton*)sender;

@end

@interface SettingHeaderView : ZMView

/**
 头像按钮
 */
@property (nonatomic,strong) ZMButton *headButton;

/**
 昵称(未登录之前是注册/登录)
*/
@property (nonatomic,strong) ZMLabel  *nickNameLabel;


/**
 录音按钮
 */
@property (nonatomic,strong) ZMButton *recordButton;


/**
 设置代理
 */
@property (nonatomic,assign) id <SettingHeaderDeletage> headerDeletage;


/**
 注意，该视图高度为180
 */
-(instancetype)initWithFrame:(CGRect)frame;

@end
