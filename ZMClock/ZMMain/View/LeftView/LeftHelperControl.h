//
//  LeftHelperControl.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/16.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftHelperView.h"

@protocol LeftHelperControlDeletage <NSObject>

-(void)leftHelperAction:(NSInteger)sender;


@end

@interface LeftHelperControl : UIControl
@property (nonatomic,strong) LeftHelperView *leftHelperView;
@property (nonatomic,strong) id <LeftHelperControlDeletage> deletage; 

-(instancetype)initWithFrame:(CGRect)frame withDeletae:(id<LeftHelperControlDeletage>)deletage;


-(void)show;

-(void)dismiss;

@end
