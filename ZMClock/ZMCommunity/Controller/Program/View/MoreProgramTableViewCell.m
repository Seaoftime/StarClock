//
//  MoreProgramTableViewCell.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/4.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "MoreProgramTableViewCell.h"

@implementation MoreProgramTableViewCell




-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self.contentView addSubview:self.moreProgramInfoView];
        [self.contentView addSubview:self.moreProgramBriefView];
    }
    return self;
}




-(void)setMoreProgramFrame:(MoreProgramFrame *)frame
{
    switch (frame.model.moreProgramModelType)
    {
        case MoreProgramInfoType:
        {
            [self.moreProgramInfoView setHidden:NO];
            [self.moreProgramBriefView setHidden:YES];
            
            
            [self.moreProgramInfoView resetWithMoreProgramInfoFrame:frame.MoreProgramViewFrame withdateLabelFrame:frame.dateLabelFrame withtitleLabelFrame:frame.titleLabelFrame withlocalctionViewFrame:frame.localctionViewFrame withtimeViewFrame:frame.timeViewFrame withModel:frame.model];
        }
            break;
        case MoreProgramBriefType:
        {
            [self.moreProgramInfoView setHidden:YES];
            [self.moreProgramBriefView setHidden:NO];
            
            
            
            [self.moreProgramBriefView resetWithProgramListFrame:frame.MoreProgramViewFrame withdayLabelFrame:frame.dayLabelFrame withtweekLabelFrame:frame.weekLabelFrame withtitleLabelFrame:frame.titleLabelFrame withlocalctionViewFrame:frame.localctionViewFrame withtimeViewFrame:frame.timeViewFrame withlineViewFrame:frame.lineViewFrame withModel:frame.model];
        }
            break;
    }
}





























#pragma mark Getter / Setter
-(MoreProgramView *)moreProgramInfoView
{
    if (_moreProgramInfoView == nil)
    {
        _moreProgramInfoView = [[MoreProgramView alloc]initWithMoreProgramInfoFrame];
    }
    return _moreProgramInfoView;
}


-(MoreProgramView *)moreProgramBriefView
{
    if (_moreProgramBriefView == nil)
    {
        _moreProgramBriefView = [[MoreProgramView alloc]initWithProgramListFrame];
    }
    return _moreProgramBriefView;
}


@end
