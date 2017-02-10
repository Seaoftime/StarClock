//
//  ProgramFrame.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/30.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ProgramFrame.h"



/**
 每行间隔高度
 */
#define SpaceHight 10

#define width_20 (kScreen_Width-20)




@implementation ProgramFrame




-(void)setModel:(ProgramModel *)model
{
    /**
     一定要重新赋值，否则的后果你试试就知道了(会出现调用的时候model对象为空)
     */
    _model = model;
    
    
    
    
    
    switch (model.programType)
    {
        case startImageType:
        {
            //设置标题的Frame
            [self setStartImageFrame:CGRectMake(0, 0, kScreen_Width, 100)];
            [self setStartImageViewFrame:CGRectMake(0, 0, kScreen_Width, 100)];
            
            //设置行高
            [self setCellHight:100+SpaceHight];
            
        }
            break;
        case infoType:
        {
            [self setPrograminfoDateFrame:CGRectMake(10, 5, width_20, 15)];
            [self setPrograminfoTitleLabelFrame:CGRectMake(10, 25, width_20, 20)];
            [self setPrograminfoLocationFrame:CGRectMake(10, 50, 80, 15)];
            [self setPrograminfoTimeFrame:CGRectMake(120, 50, 80, 15)];
    
            [self setCellHight:70+SpaceHight];
        }
            break;
        case commentNumberType:
        {
            [self setCommentNumberViewFrame:CGRectMake(0, 0, kScreen_Width, 40)];
            [self setCommentFrame:CGRectMake(10, 0, kScreen_Width/2, 40)];
            [self setSupportViewFrame:CGRectMake(kScreen_Width-90, 12.5, 80, 15)];
            [self setCellHight:40];
        }
            break;
        case commentitemsType:
        {
            
            CGSize nickNamesize = [self contentWidthAndHight:model.commentNickName withSpaceWidth:105 withFontOfSize:[UIFont systemFontOfSize:15.0]];
            
            [self setCommentheadPortraiteImageFrame:CGRectMake(10, 10, 60, 60)];
            [self setCommentNickNameFrame:CGRectMake(75, 10, nickNamesize.width, 15)];
            [self setCommentLevelFrame:CGRectMake(80+nickNamesize.width, 10, 15, 15)];
            [self setCommentDateFrame:CGRectMake(75, 30, width_20-150, 15)];
            
            
            CGSize commentDescribeSize = [self contentWidthAndHight:model.commentDescribe withSpaceWidth:85 withFont:[UIFont systemFontOfSize:13.0]];
            
            [self setCommentDescribeFrame:CGRectMake(75,55, commentDescribeSize.width, commentDescribeSize.height)];
            
            [self setCommentViewFrame:CGRectMake(10, 0,width_20, 55 + commentDescribeSize.height)];
            
            [self setCellHight:self.commentViewFrame.size.height + SpaceHight];
            
        }
            break;
    }
}







#pragma mark - 计算“原文””的文本高度
-(CGSize)contentWidthAndHight:(NSString*)content withSpaceWidth:(CGFloat)spaceWidth withFontOfSize:(UIFont*)fontOfSize
{
    //=========得到content的内容高度===========
    NSDictionary *AttriButes = @{NSFontAttributeName:fontOfSize};
    CGSize ContentSize = [content boundingRectWithSize:CGSizeMake(kScreen_Width - spaceWidth, MAXFLOAT)
                                               options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                            attributes:AttriButes
                                               context:nil].size;
    //译文本高度
    return ContentSize;
}




#pragma mark - 计算“原文””的文本高度
-(CGSize)contentWidthAndHight:(NSString*)content withSpaceWidth:(CGFloat)spaceWidth withFont:(UIFont*)font
{
    //=========得到content的内容高度===========
    NSDictionary *AttriButes = @{NSFontAttributeName:font};
    CGSize ContentSize = [content boundingRectWithSize:CGSizeMake(width_20 - spaceWidth, MAXFLOAT)
                                               options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                            attributes:AttriButes
                                               context:nil].size;
    //译文本高度
    return ContentSize;
}




@end
