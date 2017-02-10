//
//  LevelView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/27.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "LevelView.h"

@interface LevelView ()


@property (nonatomic,strong) UILabel *levelLabel; //!<  等级标题


@end


@implementation LevelView


-(instancetype)init
{
    self = [super init];
    if (self)
    {
        [self addSubview:self.levelLabel];
        [self setContentMode:UIViewContentModeScaleAspectFit];
        [self.levelLabel setFont:[UIFont systemFontOfSize:12.0]];
    }
    return self;
}


/**
 重置frame
 imageName:图片名称
 */
-(void)resetLevelViewFrame:(CGRect)frame withImageName:(NSString *)imageName withLevel:(NSString*)level
{
    [self setFrame:frame];
    [self.levelLabel setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    [self.levelLabel setText:level];
    [self setImage:[UIImage imageNamed:imageName]];
}

-(UILabel *)levelLabel
{
    if (_levelLabel == nil)
    {
        _levelLabel = [[UILabel alloc]init];
        [_levelLabel setTextColor:[UIColor whiteColor]];
        [_levelLabel setTextAlignment:NSTextAlignmentCenter];
    }
    return _levelLabel;
}

@end
