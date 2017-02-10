//
//  CommunityFrame.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/3.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//


#define LineViewHight 6
#define width_20 200


#import "CommunityFrame.h"

@implementation CommunityFrame



-(void)setModel:(CommunityModel *)model
{
    _model = model;
    
    switch (model.communityType)
    {
        case startImageType:
        {
            //设置标题的Frame
            [self setStartImageFrame:CGRectMake(0, 0, kScreen_Width, 100)];
            
            //[self setStartImageViewFrame:CGRectMake(0, 0, kScreen_Width, 100)];
            
            
            [self setStartImageViewFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Width/2.4)];
            
            //设置行高
            [self setCellHight:kScreen_Width/2.4];
        }
            break;
        case infoType:
        {
            [self setPrograminfonnextProgramViewFrame:CGRectMake(5,5 , kScreen_Width/2.0, 15.0)];
            [self setPrograminfomoreProgramButtonFrame:CGRectMake(kScreen_Width-100,5,80,30)];
            [self setPrograminfoDateFrame:CGRectMake(40, 35, kScreen_Width-80, 20)];
            [self setPrograminfoTitleLabelFrame:CGRectMake(40, 60, kScreen_Width-80, 15)];
            [self setPrograminfoLocationFrame:CGRectMake(30, 100, 80, 15)];
            [self setPrograminfoTimeFrame:CGRectMake(120, 100, 80, 15)];
            [self setPrograminfoViewFrame:CGRectMake(0, 0, kScreen_Width, 120)];
            
            [self setCellHight:120+LineViewHight];
        }
            break;
        case commentitemsType:
        {
            [self setCommentViewFrame:CGRectMake(0, 0,kScreen_Width, 100)];
            [self setCellHight:self.commentViewFrame.size.height + LineViewHight];
        }
            break;
    }
}

@end
