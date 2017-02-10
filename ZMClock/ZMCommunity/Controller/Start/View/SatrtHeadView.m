//
//  SatrtView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/4.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "SatrtHeadView.h"

@implementation SatrtHeadView



-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addSubview:self.headTitleLabel];
        [self.headTitleLabel setFrame:CGRectMake(5, 0, frame.size.width-10, frame.size.height)];
    }
    return self;
}


-(UILabel *)headTitleLabel
{
    if (_headTitleLabel == nil)
    {
        _headTitleLabel = [[UILabel alloc]init];
        [_headTitleLabel setFont:[UIFont boldSystemFontOfSize:15.0]];
    }
    return _headTitleLabel;
}



@end
