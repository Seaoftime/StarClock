//
//  CommunityHedToolView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/3.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZMButton.h"

@protocol CommunityHedToolViewDeletage <NSObject>


-(void)communityHedToolViewButton:(ZMButton*)sender;

@end




@interface CommunityHedToolView : UIView


@property (nonatomic,strong) ZMButton *newsButton; //!< 资讯按钮
@property (nonatomic,strong) ZMButton *storyButton; //!< 小说按钮
@property (nonatomic,strong) ZMButton *comicButton; //!< 漫画按钮




@property (nonatomic,assign) id <CommunityHedToolViewDeletage> hedTooldeletage;

-(instancetype)initWithFrame:(CGRect)frame withDeletage:(id<CommunityHedToolViewDeletage>)deletage;

@end
