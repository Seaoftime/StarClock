//
//  WeatherRecordTableViewCell.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/22.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "WeatherRecordTableViewCell.h"

@implementation WeatherRecordTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setBackgroundColor:[UIColor clearColor]];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self.contentView addSubview:self.tableViewContentView];
    }
    return self;
}



#pragma mark Getter / Setter
-(WeatherRecordViewTableViewContentView*)tableViewContentView
{
    if (_tableViewContentView == nil)
    {
        _tableViewContentView = [[WeatherRecordViewTableViewContentView alloc]initWithFrame:CGRectMake(10, 2.5, kScreen_Width-20, 65)];
    }
    return _tableViewContentView;
}
@end
