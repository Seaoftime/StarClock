//
//  TinkleTableViewCell.h
//  ZMClock
//
//  Created by ZhongMeng on 16/3/21.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TinkleModel.h"

@interface TinkleTableViewCell : UITableViewCell

@property (nonatomic,strong) UIView *TinkleBackGroundView; //!<背景视图
@property (nonatomic,strong) UIImageView *accessoryImageView; //!<每行的表格标题
@property (nonatomic,strong) UILabel *titleLabel; //!< 标题标签


@property (nonatomic,strong) TinkleModel *model; //!< 数据模型





-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;



@end
