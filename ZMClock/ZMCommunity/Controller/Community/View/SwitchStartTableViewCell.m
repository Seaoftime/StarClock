//
//  SwitchStartTableViewCell.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/6.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "SwitchStartTableViewCell.h"

@implementation SwitchStartTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
    }
    return self;
}




-(void)setSwitchStartModel:(SwitchStartModel *)model
{
    [self.textLabel setText:model.startName];
}




@end
