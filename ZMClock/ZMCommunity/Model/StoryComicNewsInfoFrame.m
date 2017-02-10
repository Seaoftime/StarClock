//
//  StoryComicNewsInfoFrame.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/27.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "StoryComicNewsInfoFrame.h"


/**
 每行间隔高度
 */
#define SpaceHight 10

#define width_20 (kScreen_Width-20)



@implementation StoryComicNewsInfoFrame







-(void)setModel:(StoryComicNewsInfoModel *)model
{
    /**
     一定要重新赋值，否则的后果你试试就知道了(会出现调用的时候model对象为空)
     */
    _model = model;
    
    
    
    
    
    switch (model.type)
    {
#pragma mark titleType
        case titleType:
        {
            CGSize titleSize = [self contentWidthAndHight:model.title withSpaceWidth:20 withFontOfSize:[UIFont boldSystemFontOfSize:20.0]];
            //设置标题的Frame
            [self setTitleLabelFrame:CGRectMake(0, 0, width_20, titleSize.height)];
            //设置日期的Frame
            [self setDateLabelFrame:CGRectMake(0,titleSize.height+10, width_20/2, 15)];
            //设置内容来源的Frame
            [self setSourceLabelFrame:CGRectMake(width_20/2,titleSize.height+10, width_20/2, 15)];
            
            
            //设置标题视图的高度
            [self setTitleViewFrame:CGRectMake(10, 0, width_20, titleSize.height+15+10)];
            //设置行高
            [self setCellHight:self.titleViewFrame.size.height+SpaceHight];
           
        }
            break;
#pragma mark describeType
        case describeType:
        {
            CGSize size = [self contentWidthAndHight:model.describe withSpaceWidth:20 withFontOfSize:[UIFont systemFontOfSize:13.0]];
            
            
            
            [self setDescribeLabelFrame:CGRectMake(0, 0, width_20, size.height)];
            [self setDescribeViewFrame:CGRectMake(10, 0, width_20, size.height)];
            [self setCellHight:self.describeViewFrame.size.height+SpaceHight];
            
            
        }
            break;
#pragma mark imageType
        case imageType:
        {
            [self setImageFrame:CGRectMake(0, 0, model.image_Width,model.image_Hight)];
            [self setImageViewFrame:CGRectMake(10, 0, model.image_Width, model.image_Hight)];
            [self setCellHight:self.imageFrame.size.height+SpaceHight];
            
        }
            break;
#pragma mark authorType
        case authorType:
        {
            
            /**
             设置作者标签的Frame
             */
            [self setAuthorLabelFrame:CGRectMake(10, 0, width_20, 15)];
            [self setTopLineViewFrame:CGRectMake(0, 20,kScreen_Width , 6)];
    
            
            
            /**
             下面标签距离上面标签间隔为10
             */
            CGFloat Space_Hight = 15 + 20;
            
            [self setReadLabelFrame:CGRectMake(10, Space_Hight, width_20/3.0, 15)];
            [self setCommentViewFrame:CGRectMake(width_20/3.0+30, Space_Hight, 70, 15)];
            [self setSupportViewFrame:CGRectMake(width_20-70, Space_Hight, 70, 15)];
            [self setAuthorViewFrame:CGRectMake(0, 0, width_20, Space_Hight + 15)];
            
             [self setBottomLineViewFrame:CGRectMake(0, self.authorViewFrame.size.height+6, kScreen_Width, 6)];
            
            
            //设置当前行高（当前承载视图的高+固定间隔SpaceHight=10）
            [self setCellHight:self.authorViewFrame.size.height+SpaceHight];
            
        }
            break;
#pragma mark commentType
        case commentType:
        {
            
            CGSize nickNamesize = [self contentWidthAndHight:model.nickName withSpaceWidth:105 withFontOfSize:[UIFont systemFontOfSize:13.0]];
            [self setHeadPortraitFrame:CGRectMake(10, 10, 60, 60)];
            
            [self setNickNameLabelFrame:CGRectMake(75, 10, nickNamesize.width, 15)];
            [self setCommentLevelFrame:CGRectMake(80+nickNamesize.width, 5, 20, 20)];
            [self setSupportViewFrame:CGRectMake(width_20-80, 10, 70, 15)];
            [self setCommentDateLabelFrame:CGRectMake(75, 30, width_20-150, 15)];
            
            
            CGSize commentDescribeSize = [self contentWidthAndHight:model.commentDescribe withSpaceWidth:85 withFont:[UIFont systemFontOfSize:13.0]];
            
            [self setCommentDescribeLabelFrame:CGRectMake(75,55, commentDescribeSize.width, commentDescribeSize.height)];
            
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
