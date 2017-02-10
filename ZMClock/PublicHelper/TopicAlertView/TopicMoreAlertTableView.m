//
//  TopicMoreAlertTableView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/18.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "TopicMoreAlertTableView.h"

@interface TopicMoreAlertTableView () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *topicArray; //!< 数据源数组


@end


@implementation TopicMoreAlertTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self)
    {
        [self setBackgroundColor:[UIColor clearColor]];
        [self setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    }
    return self;
}



-(void)resetTopicArray:(NSMutableArray*)array
{
    [self.topicArray setArray:array];
    [self setDelegate:self];
    [self setDataSource:self];
}



-(NSMutableArray*)topicArray
{
    if (_topicArray == nil)
    {
        _topicArray = [NSMutableArray array];
    }
    return _topicArray;
}


#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.topicArray enumerateObjectsUsingBlock:^(TinkleModel  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
     {
         if (indexPath.row == idx)
         {
             switch (obj.selectType)
             {
                 case select_type:
                 {
                     [obj setSelectType:no_select_type];
                 }
                     break;
                 case no_select_type:
                 {
                     [obj setSelectType:select_type];
                   
                 }
                     break;
             }
             
             if ([self.topicMoreAlertDeletage respondsToSelector:@selector(topicMoreAlertTableViewSelectRowAtIndexPathWithModel:)])
             {
                 [self.topicMoreAlertDeletage topicMoreAlertTableViewSelectRowAtIndexPathWithModel:obj];
             }
             
             
             *stop = YES;
         }
     }];
    [self reloadData];
    
}


#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.topicArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TopicAlertTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[TopicAlertTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    if (indexPath.row%2==0)
    {
        [cell.TinkleBackGroundView setBackgroundColor:RGB(235.0, 255.0, 255.0)];
    }
    else
    {
        [cell.TinkleBackGroundView setBackgroundColor:RGB(255.0, 249.0, 215.0)];
    }
    
    [cell setModel:self.topicArray[indexPath.row]];
    return cell;
}

@end
