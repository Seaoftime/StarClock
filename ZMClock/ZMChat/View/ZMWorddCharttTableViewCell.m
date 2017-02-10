//
//  ZMWorddCharttTableViewCell.m
//  ZMClock
//
//  Created by ZhongMeng on 16/11/12.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//


/*
 文字聊天
 */
#import "ZMWorddCharttTableViewCell.h"


#import "ZMChatFrameeModel.h"



#define timeFont [UIFont systemFontOfSize:12.0] //时间的字体大小
#define contentFont [UIFont systemFontOfSize:18.0]//聊天消息字体的大小



@interface ZMWorddCharttTableViewCell ()
{
    UILabel *labelTime;
    UIImageView *imageView;
    UIButton *btnContent;
}
@property (nonatomic, strong) UIImageView *cellImageView;


@end



@implementation ZMWorddCharttTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}




- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createView];
    }
    return self;
}
//创建各个控件
- (void)createView{
    labelTime=[[UILabel alloc] init]; //添加显示时间的Label
    labelTime.font=timeFont;
    labelTime.textAlignment=NSTextAlignmentCenter;
    [self.contentView addSubview:labelTime];
    
    self.cellImageView = [[UIImageView alloc] init]; //添加显示头像的ImageView
    [self.contentView addSubview:self.cellImageView];
    
    btnContent=[[UIButton alloc] init]; //添加显示文字的按钮
    btnContent.titleLabel.font=contentFont;
    btnContent.titleLabel.numberOfLines=0;
    btnContent.titleEdgeInsets=UIEdgeInsetsMake(20, 20, 20, 20);//设置按钮文字的的上 左 下 右的边距
    [self.contentView addSubview:btnContent];
    btnContent.enabled=NO;
    //[btnContent setBackgroundColor:[UIColor whiteColor]]; //去除背景颜色即可
}

- (void)setFrameModel:(ZMChatFrameeModel *)frameModel{
    labelTime.frame=frameModel.timeFrame;//设置坐标
    self.cellImageView.frame=frameModel.headImageFrame;
    btnContent.frame=frameModel.btnFrame;
    
    if (frameModel.myself) {
        
        [btnContent setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        UIImage *bgImage=[UIImage imageNamed:@"chat_send_nor@2x"]; //设置背景图片的
        [btnContent setBackgroundImage:[bgImage resizableImageWithCapInsets:UIEdgeInsetsMake(28, 32, 28, 32) resizingMode:UIImageResizingModeStretch] forState:UIControlStateNormal]; //拉伸图片的方法(固定图片的位置,其他部分被拉伸)
        
        [btnContent setTitleColor:RGB(100, 100, 100) forState:UIControlStateNormal];
        
        
        
        NSString *sssUserr = [NSUserDefaults standardUserDefaults].userr_AvatarImgStr;
        
        if (sssUserr == nil || sssUserr == NULL || [sssUserr isKindOfClass:[NSNull class]]) {
            
            
            //NSLog(@"sss");
            
            self.cellImageView.image = [UIImage imageNamed:@"boyyy.jpg"];
            
            
            
        }else {
            
            
            
            NSData *decodeUserImgData = [[NSData alloc] initWithBase64EncodedString:sssUserr options:NSDataBase64DecodingIgnoreUnknownCharacters];
            UIImage *sssUserImg = [UIImage imageWithData:decodeUserImgData];
            
            self.cellImageView.image = sssUserImg;
            
            
            
        }
        //
        
        
        
        
        
        
        
    }
    else{
        
        
        [btnContent setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        UIImage *bgImage=[UIImage imageNamed:@"chat_recive_press_pic@2x"]; //设置背景图片
        [btnContent setBackgroundImage:[bgImage resizableImageWithCapInsets:UIEdgeInsetsMake(28, 32, 28, 32) resizingMode:UIImageResizingModeStretch] forState:UIControlStateNormal];
        
        [btnContent setTitleColor:RGB(100, 100, 100) forState:UIControlStateNormal];
        
        NSString *sss = [NSUserDefaults standardUserDefaults].robot_AvatarImgStr;
        
        if (sss == nil || sss == NULL || [sss isKindOfClass:[NSNull class]]) {
            
            
            self.cellImageView.image = [UIImage imageNamed:@"girl.jpeg"];
            
        }else {
            
            
            
            NSData *decodeImgData = [[NSData alloc] initWithBase64EncodedString:sss options:NSDataBase64DecodingIgnoreUnknownCharacters];
            UIImage *sssImg = [UIImage imageWithData:decodeImgData];
            
            self.cellImageView.image = sssImg;
            
            
            
        }
        
        
        
        
        
        
    }
    
    
    
    
    
    
    labelTime.text = [NSString stringWithFormat:@"%@",frameModel.dataModel.time];
    
    
    self.cellImageView.image = [UIImage imageNamed:frameModel.dataModel.imageName];
    
    
    
    
    
    
    [btnContent setTitle:frameModel.dataModel.desc forState:UIControlStateNormal];//设置内容
    
    
}





@end
