//
//  TableTipView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/29.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "TableTipView.h"


@interface TableTipView ()


@property (nonatomic,strong) UIImageView *tipImageView; //!<提示图片视图
@property (nonatomic,strong) UILabel *tipLabel;

@end

@implementation TableTipView


#pragma mark 项目中表视图数据源空的时候使用的初始化方法
/**
 项目中表视图数据源空的时候使用的初始化方法，主要使用在表视图中
 */
-(instancetype)initWithTaskStudyTableViewEmptyFrame:(CGRect)frame withImageName:(NSString*)imageName withTiptitle:(NSString*)tipTitle
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.tipImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,frame.size.width,frame.size.height-30)];
        [self.tipImageView setContentMode:UIViewContentModeScaleAspectFit];
        [self.tipImageView setImage:[UIImage imageNamed:imageName]];
        [self addSubview:self.tipImageView];
        
        self.tipLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, frame.size.height-30, frame.size.width, 30)];
        [self.tipLabel setFont:[UIFont systemFontOfSize:16.0]];
        [self.tipLabel setTextAlignment:NSTextAlignmentCenter];
        [self.tipLabel setText:tipTitle];
        [self addSubview:self.tipLabel];
    }
    return self;
}




@end
