//
//  ZMHonourViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/9.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMHonourViewController.h"
#import "HonourModel.h"
#import "HonourContentTableViewCell.h"



@interface ZMHonourViewController () <UITableViewDelegate,UITableViewDataSource>


@property (nonatomic,strong) UITableView *honourTableView; //!<头衔表视图


@end

@implementation ZMHonourViewController




-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"我的头衔"];
    [self.view addSubview:self.honourTableView];
}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}



#pragma mark - Getter / Setter
-(UITableView *)honourTableView
{
    if (_honourTableView == nil)
    {
        _honourTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 60, kScreen_Width, kScreen_Height-60) style:UITableViewStylePlain];
        [_honourTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [_honourTableView setDelegate:self];
        [_honourTableView setDataSource:self];
    }
    return _honourTableView;
}




-(NSMutableArray*)honourArray
{
    if (_honourArray == nil)
    {
        _honourArray = [NSMutableArray array];
        
    }
    return _honourArray;
}







#pragma mark - Deletage Method
#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.honourArray[indexPath.row] cellHight];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:
        {
            
        }
            break;
        case 3:
        {
            
        }
            break;
        case 4:
        {
            
        }
            break;
        case 5:
        {
            
        }
            break;
    }
}


#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.honourArray count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HonourContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[HonourContentTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell setHonourModel:self.honourArray[indexPath.row]];
    return cell;
}



@end
