//
//  MeInfoTableViewCell.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/28.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "MeInfoTableViewCell.h"

@implementation MeInfoTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier setDeletage:(id<MeInfoTableViewCellDeletage>)deletage
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setDeletage:deletage];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        //[self.contentView addSubview:self.headPortraitView];
        [self.contentView addSubview:self.normalView];
        
        
        
    }
    return self;
}




#pragma  mark 我得数据模型赋值
-(void)setModel:(MeInfoModel *)model
{
    switch (model.meInfoType)
    {
        case headPortraitType:
        {
            [self.headPortraitView resetHeadPortraitFrame:CGRectMake(0, 0, kScreen_Width, model.cellHight)];
            
            [self.headPortraitView.titleLabel setText:model.title];
            //[self.headPortraitView.describeLabel setText:[NSString stringWithFormat:@"手机:%@",model.describe]];
            [self.headPortraitView.imageView sd_setImageWithURL:[NSURL URLWithString:model.headPortraitUrl]];
            
//            UIImage *imgg = self.headPortraitView.imageView.image;
//            NSData *imgData = UIImageJPEGRepresentation(imgg, .2f);
//            NSString *encodeImgStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
//            
//            [NSUserDefaults standardUserDefaults].mainUserHeadPortaitStr = encodeImgStr;
            
            
        }
            break;
        case normalType:
        {
            [self.normalView resetNormalFrame:CGRectMake(0, 0, kScreen_Width, model.cellHight)];
            
            
            [self.normalView.titleLabel setText:model.title];
            [self.normalView.describeLabel setText:model.describe];
        }
            break;
    }
}
















#pragma mark - Getter / Setter
-(MeInfoTableViewContentView *)headPortraitView
{
    if (_headPortraitView == nil)
    {
        _headPortraitView = [[MeInfoTableViewContentView alloc]initWithHeadPortrait];
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureRecognizer:)];;
        [_headPortraitView.imageView addGestureRecognizer:tapGestureRecognizer];
    }
    return _headPortraitView;
}



-(MeInfoTableViewContentView *)normalView
{
    if (_normalView == nil)
    {
        _normalView = [[MeInfoTableViewContentView alloc]initWithNormal];
    }
    return _normalView;
}


#pragma mark 头像点击方法
-(void)tapGestureRecognizer:(UITapGestureRecognizer*)sender
{
    if ([self.deletage respondsToSelector:@selector(tapGestureRecognizer:)])
    {
        [self.deletage tapGestureRecognizer:sender];
    }
    
}


@end
