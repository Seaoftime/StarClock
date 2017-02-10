//
//  HeadPortraitImageView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/19.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol HeadPortraitImageViewDeletage <NSObject>


-(void)tapGestureRecognizer:(UITapGestureRecognizer*)sender;

@end


@interface HeadPortraitImageView : UIView

@property (nonatomic,strong) UIImageView *backGroundImageView; //!< 头像截取图片视图
@property (nonatomic,strong) UIImageView *partImageView; //!< 头像截取图片视图



@property (nonatomic,assign) id <HeadPortraitImageViewDeletage> headPortraitDeletage;


-(instancetype)initWithFrame:(CGRect)frame setDeletage:(id<HeadPortraitImageViewDeletage>)deletage;


@end
