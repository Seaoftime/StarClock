//
//  MeTableViewCell.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/28.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "MeTableViewCell.h"

@implementation MeTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        
        //添加视图到当前的ContentView上
        [self.contentView addSubview:self.nickNameView];
        [self.contentView addSubview:self.fansView];
        [self.contentView addSubview:self.honourView];
        [self.contentView addSubview:self.messageView];
        [self.contentView addSubview:self.startViwe];
        
       
    }
    return self;
}





-(void)setModel:(MeModel *)model
{
    switch (model.meType)
    {
#pragma mark case nickNameType 有昵称单元格
        case nickNameType:
        {
            /**
             先设置箭头的样式
             */
            [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
            
            
            [self.nickNameView resetNickNameFrame:CGRectMake(0, 0, kScreen_Width, 80)];
            
            [self.nickNameView.imageView sd_setImageWithURL:[NSURL URLWithString:model.headPortraitUrl]];
            [self.nickNameView.nickNameLabel setText:model.nickName];
            [self.nickNameView.concernLabel setText:[NSString stringWithFormat:@"积分:%@",model.points]];
            [self.nickNameView.fansLabel setText:[NSString stringWithFormat:@"等级：LV%@",model.level]];
            
            
            
        }
            break;
#pragma mark case fansType 粉丝单元格
        case fansType:
        {
            /**
             先设置箭头的样式
             */
            [self setAccessoryType:UITableViewCellAccessoryNone];
            
            
            [self.fansView resetFansAndConcernFrame:CGRectMake(0, 0, kScreen_Width, 60)];
            
            [self.fansView.concernNumberLabel setText:[NSString stringWithFormat:@"%@",@"102"]];
            [self.fansView.fansNumberLabel setText:[NSString stringWithFormat:@"%@",@"61"]];
        }
            break;
#pragma mark case honourType 社区头衔单元格
        case honourType:
        {
            /**
             先设置箭头的样式
             */
            [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
            
            [self.honourView resetHonourFrame:CGRectMake(0, 0, kScreen_Width, 60)];
            [self.honourView.titleLabel setText:model.title];
            [self.honourView.describeLabel setText:model.describe];
        }
            break;
#pragma mark case messageType 我的消息单元格
        case messageType:
        {
            /**
             先设置箭头的样式
             */
            [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
            
            [self.messageView resetMessageFrame:CGRectMake(0, 0, kScreen_Width, 60)];
            [self.messageView.titleLabel setText:model.title];
        }
            break;
#pragma mark case startType 我的明星单元格
        case startType:
        {
            /**
             先设置箭头的样式
             */
            [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
            
            [self.startViwe resetStarFrame:CGRectMake(0, 0, kScreen_Width, 60)];
            [self.startViwe.titleLabel setText:model.title];
        }
            break;
    }
    
    
    
    
    
    
    
    
    
    
}



#pragma mark - Getter / Setter

-(MeTableViewContentView *)nickNameView
{
    if (_nickNameView == nil)
    {
        _nickNameView = [[MeTableViewContentView alloc]initWithNickName];
    }
    return _nickNameView;
}



-(MeTableViewContentView *)fansView
{
    if (_fansView == nil)
    {
        _fansView = [[MeTableViewContentView alloc]initWithFansAndConcern];
    }
    return _fansView;
}


-(MeTableViewContentView *)honourView
{
    if (_honourView == nil)
    {
        _honourView = [[MeTableViewContentView alloc]initWithHonour];
    }
    return _honourView;
}


-(MeTableViewContentView *)messageView
{
    if (_messageView == nil)
    {
        _messageView = [[MeTableViewContentView alloc]initWithMessage];
    }
    return _messageView;
}



-(MeTableViewContentView *)startViwe
{
    if (_startViwe == nil)
    {
        _startViwe = [[MeTableViewContentView alloc]initWithStar];
    }
    return _startViwe;
}












@end
