//
//  guanFangTableViewCell.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/21.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "WeatherTableViewCell.h"

@implementation WeatherTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self.contentView addSubview:self.tableViewContentView];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return self;
}






-(WeatherTableViewContentView *)tableViewContentView
{
    if (_tableViewContentView == nil)
    {
        _tableViewContentView = [[WeatherTableViewContentView alloc]initWithFrame:CGRectMake(2.5, 2.5, kScreen_Width-5, 55)];
        [_tableViewContentView setBackgroundColor:[UIColor blueColor]];
        
    }
    return _tableViewContentView;
}
@end
