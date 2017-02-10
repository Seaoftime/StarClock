//
//  RecordTableViewCell.h
//  ZMClock
//
//  Created by ZhongMeng on 16/3/21.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecordTableViewCell : UITableViewCell

/**
 背景图片视图
 */
@property (nonatomic,strong) UIImageView *backGroundImageView;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
