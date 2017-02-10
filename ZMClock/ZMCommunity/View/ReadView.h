//
//  ReadView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/29.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReadView : UIView

@property (nonatomic,strong) UILabel *numberLabel; //!< 评论数量
@property (nonatomic,strong) UIImageView *commentImageView; //!< 评论图标


/**
 该视图大小为宽度为45，高度为15
 */
-(instancetype)initWithFrame:(CGRect)frame;

@end
