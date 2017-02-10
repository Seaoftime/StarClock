//
//  woDiyView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/21.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "WoDiyView.h"
#import "WeatherTableViewCell.h"


@interface WoDiyView ()




@end



@implementation WoDiyView



-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
       
        [self addSubview:self.woDiyTableView];
    }
    return self;
}



#pragma mark - Getter / Setter
-(UITableView *)woDiyTableView
{
    if (_woDiyTableView == nil)
    {
        _woDiyTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height-100) style:UITableViewStylePlain];
        [_woDiyTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [_woDiyTableView setDelegate:self];
        [_woDiyTableView setDataSource:self];
    }
    return _woDiyTableView;
}









#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WeatherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[WeatherTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if (indexPath.row%2)
    {
        [cell.tableViewContentView setBackgroundColor:RGB(140.0, 231.0, 255.0)];
    }
    else
    {
        [cell.tableViewContentView setBackgroundColor:RGB(79.0, 185.0, 255.0)];
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
