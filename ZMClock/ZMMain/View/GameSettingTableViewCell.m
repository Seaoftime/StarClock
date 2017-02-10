//
//  GameSettingTableViewCell.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/18.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "GameSettingTableViewCell.h"


@interface GameSettingTableViewCell ()


@property (nonatomic,strong) UIImageView *accessoryImageView; //!< 附件视图



@end

@implementation GameSettingTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
      
         [self setAccessoryView:self.imageV1];
       
        
    }
    return self;
}

- (UIImageView *)imageV1
{
    if (_imageV1 == nil) {
        _imageV1 = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width - 50, 0, 10, 15)];
        _imageV1.image = IMAGE(@"返回-小me");
    }


    return _imageV1;
}

//-(UILabel *)label1
//{
//    if (_label1 == nil)
//    {
//        _label1 = [[UILabel  alloc]initWithFrame:CGRectMake(-100, 0, kScreen_Width/2, 20)];
//        //_label1.backgroundColor=[UIColor redColor];
//        _label1.text = @">";
//    
//        //_label1.textColor = RGB(235, 235, 235);
//        _label1.font=[UIFont systemFontOfSize:15];
//        
//        
//        [self.label1 setTextAlignment:NSTextAlignmentRight];
//        
//        
//        
//           }
//    return _label1;
//}

-(UILabel *)label2
{
    if (_label2 == nil)
    {
        _label2 = [[UILabel  alloc]initWithFrame:CGRectMake(-100, 80, 70, 20)];
        _label2.backgroundColor=[UIColor redColor];
        _label2.text=@"";
        _label2.font=[UIFont systemFontOfSize:15];
       // _label2.textAlignment = UITextAlignmentRight;
        
        
        
    }
    return _label2;
}







@end
