//
//  HonourContentTableViewCell.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/9.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "HonourContentTableViewCell.h"

@implementation HonourContentTableViewCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        
        //添加视图到当前的ContentView上
        [self.contentView addSubview:self.nickNameView];
        [self.contentView addSubview:self.honourView];
        [self.contentView addSubview:self.experienceView];
        [self.contentView addSubview:self.actionView];
        
        
    }
    return self;
}



#pragma mark - 数据填充
-(void)setHonourModel:(HonourModel *)model
{
    
    switch (model.honourType)
    {
        case honourNickNameType:
        {
            [self.honourView setHidden:YES];
            [self.experienceView setHidden:YES];
            [self.actionView setHidden:YES];
            [self.nickNameView setHidden:NO];
            [self.nickNameView resetNickNameFrame:CGRectMake(0, 0, kScreen_Width, model.cellHight)];
            
            //设置数据
            [self.nickNameView.imageView sd_setImageWithURL:[NSURL URLWithString:model.headPortraitUrl]];
            [self.nickNameView.nickNameLabel setText:model.nickName];
            [self.nickNameView.concernLabel setText:[NSString stringWithFormat:@"积分：%@",model.points]];
            [self.nickNameView.fansLabel setText:[NSString stringWithFormat:@"等级：LV%@",model.level]];
            
        }
            break;
        case honourHonourType:
        {
            [self.honourView setHidden:NO];
            [self.experienceView setHidden:YES];
            [self.actionView setHidden:YES];
            [self.nickNameView setHidden:YES];
            [self.honourView resetHonourHonourFrame:CGRectMake(0, 0,kScreen_Width, model.cellHight)];
            
            
            [self.honourView.nickNameLabel setText:model.editorLevelNmae];
            [self.honourView.concernLabel setText:model.editorExperience];
            [self.honourView.fansLabel setText:@"我的经验值"];
            [self.honourView.levelLabel setText:[NSString stringWithFormat:@"升级到下一级还需%@",model.nextLevelExperience]];
            
            if ([model.editorLevel isEqualToString:@"1"])
            {
                [self.honourView.oneView.startImageView setImage:[UIImage imageNamed:@"staryellow"]];
                [self.honourView.twoView.startImageView setImage:[UIImage imageNamed:@"starwhiter"]];
                [self.honourView.threeView.startImageView setImage:[UIImage imageNamed:@"starwhiter"]];
                [self.honourView.fourView.startImageView setImage:[UIImage imageNamed:@"starwhiter"]];
            }
            else if ([model.editorLevel isEqualToString:@"2"])
            {
                [self.honourView.oneView.startImageView setImage:[UIImage imageNamed:@"staryellow"]];
                [self.honourView.twoView.startImageView setImage:[UIImage imageNamed:@"staryellow"]];
                [self.honourView.threeView.startImageView setImage:[UIImage imageNamed:@"starwhiter"]];
                [self.honourView.fourView.startImageView setImage:[UIImage imageNamed:@"starwhiter"]];
            }
            else if ([model.editorLevel isEqualToString:@"3"])
            {
                [self.honourView.oneView.startImageView setImage:[UIImage imageNamed:@"staryellow"]];
                [self.honourView.twoView.startImageView setImage:[UIImage imageNamed:@"staryellow"]];
                [self.honourView.threeView.startImageView setImage:[UIImage imageNamed:@"staryellow"]];
                [self.honourView.fourView.startImageView setImage:[UIImage imageNamed:@"starwhiter"]];
            }
            else if ([model.editorLevel isEqualToString:@"4"])
            {
                [self.honourView.oneView.startImageView setImage:[UIImage imageNamed:@"staryellow"]];
                [self.honourView.twoView.startImageView setImage:[UIImage imageNamed:@"staryellow"]];
                [self.honourView.threeView.startImageView setImage:[UIImage imageNamed:@"staryellow"]];
                [self.honourView.fourView.startImageView setImage:[UIImage imageNamed:@"staryellow"]];
            }
            
            
        }
            break;
        case experienceType:
        {
            
            [self.honourView setHidden:YES];
            [self.experienceView setHidden:NO];
            [self.actionView setHidden:YES];
            [self.nickNameView setHidden:YES];
            
            [self.experienceView setBackgroundColor:[UIColor redColor]];
            [self.experienceView resetHonourExperienceFrame:CGRectMake(0, 0, kScreen_Width, model.cellHight)];
            
            //设置数据
            [self.experienceView.titleLabel setText:model.title];
            [self.experienceView setBackgroundColor:LineViewColor];
        }
            break;
        case actionType:
        {
            [self.honourView setHidden:YES];
            [self.experienceView setHidden:YES];
            [self.actionView setHidden:NO];
            [self.nickNameView setHidden:YES];
            [self.actionView resetHonourActionFrame:CGRectMake(0, 0, kScreen_Width, model.cellHight)];
            [self.actionView.titleLabel setText:model.title];
            [self.actionView.nickNameLabel setText:model.remark];
            [self.actionView.describeLabel setText:model.describe];
        }
            break;
        case otherType:
        {
            [self.honourView setHidden:YES];
            [self.experienceView setHidden:NO];
            [self.actionView setHidden:YES];
            [self.nickNameView setHidden:YES];
            
            
            [self.experienceView resetHonourExperienceFrame:CGRectMake(0, 0, kScreen_Width, model.cellHight)];
            [self.experienceView.titleLabel setText:model.title];
            [self.experienceView.titleLabel setTextColor:MainColor];
            [self.experienceView setBackgroundColor:RGB(237.0, 237.0, 237.0)];
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




-(MeTableViewContentView *)honourView
{
    if (_honourView == nil)
    {
        _honourView = [[MeTableViewContentView alloc]initWithHonourHonourFrame];
    }
    return _honourView;
}


-(MeTableViewContentView *)experienceView
{
    if (_experienceView == nil)
    {
        _experienceView = [[MeTableViewContentView alloc]initWithHonourExperienceFrame];
    }
    return _experienceView;
}



-(MeTableViewContentView *)actionView
{
    if (_actionView == nil)
    {
        _actionView = [[MeTableViewContentView alloc]initWithHonourActionFrame];
    }
    return _actionView;
}






@end
