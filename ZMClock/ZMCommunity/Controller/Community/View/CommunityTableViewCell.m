//
//  CommunityTableViewCell.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/3.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "CommunityTableViewCell.h"

@interface CommunityTableViewCell ()

@property (nonatomic,strong) UIView *lineView; //!< 分割线

@end


@implementation CommunityTableViewCell






-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier setDeletage:(id)deletage
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        [self.contentView addSubview:self.startView];
        [self.contentView addSubview:self.infoView];
        [self.contentView addSubview:self.communityItemsView];
        [self.infoView setCommunityDeletage:deletage];
    }
    return self;
}


-(void)setCommunityFrame:(CommunityFrame *)frame
{
    switch (frame.model.communityType)
    {
        case startImageType:
        {
            [self.startView setHidden:NO];
            [self.infoView setHidden:YES];
            [self.communityItemsView setHidden:YES];
            [self.lineView setHidden:YES];
            
    
            [self.startView resetStartImageViewFrame:frame.startImageFrame withimageViewFame:frame.startImageViewFrame withModel:frame.model];
        }
            break;
        case infoType:
        {
            [self.startView setHidden:YES];
            [self.infoView setHidden:NO];
            [self.communityItemsView setHidden:YES];
            [self.lineView setHidden:YES];
            
            
            [self.infoView resetWithCommunityInfoFrame:frame.programinfoViewFrame withnextProgramView:frame.programinfonnextProgramViewFrame withmoreProgramButtonFrame:frame.programinfomoreProgramButtonFrame withdateLabelFrame:frame.programinfoDateFrame withtitleLabelFrame:frame.programinfoTitleLabelFrame withlocalctionViewFrame:frame.programinfoLocationFrame withtimeViewFrame:frame.programinfoTimeFrame withModel:frame.model];
            
        }
            break;
        case commentitemsType:
        {
            [self.startView setHidden:YES];
            [self.infoView setHidden:YES];
            [self.communityItemsView setHidden:NO];
            [self.lineView setHidden:NO];
            
            
            [self.communityItemsView resetWithCommunityFrame:frame.commentViewFrame withModel:frame.model];
            
            
            
            
        }
            break;
    }
}



#pragma mark - Getter / Setter
-(CommunityView*)startView
{
    if (_startView == nil)
    {
        _startView = [[CommunityView alloc]initWithStartImageViewFrame];
    }
    return _startView;
}

-(CommunityView*)infoView
{
    if (_infoView == nil)
    {
        _infoView = [[CommunityView alloc]initWithCommunityInfoFrame];
    }
    return _infoView;
    
}

-(CommunityView*)communityItemsView
{
    if (_communityItemsView == nil)
    {
        _communityItemsView = [[CommunityView alloc]initWithCommunityFrame];
    }
    return _communityItemsView;
}

@end
