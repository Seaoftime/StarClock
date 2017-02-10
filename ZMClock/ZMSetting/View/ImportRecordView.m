//
//  ImportRecordView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/21.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ImportRecordView.h"

@implementation ImportRecordView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setBackgroundColor:[UIColor whiteColor]];
        [self.layer setBorderColor:[DeepGreen CGColor]];
        [self.layer setBorderWidth:2];
        [self.layer setCornerRadius:10];
        [self.layer setMasksToBounds:YES];
        [self addSubview:self.inputTextFiled];
        [self addSubview:self.tipLabel];
        [self addSubview:self.importButton];
    }
    return self;
}



#pragma mark Getter / Setter

-(UITextField *)inputTextFiled
{
    if (_inputTextFiled == nil)
    {
        _inputTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(20, 20, self.frame.size.width - 40, 40)];
        [_inputTextFiled.layer setBorderColor:[LineViewColor CGColor]];
        [_inputTextFiled.layer setBorderWidth:2];
        [_inputTextFiled.layer setCornerRadius:5];
        [_inputTextFiled.layer setMasksToBounds:YES];
        [_inputTextFiled setBackgroundColor:PinkColor];
    }
    return _inputTextFiled;
}


-(UILabel *)tipLabel
{
    if (_tipLabel == nil)
    {
        _tipLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 60,self.frame.size.width - 40 ,60)];
        [_tipLabel setTextAlignment:NSTextAlignmentCenter];
        [_tipLabel setTextColor:TipAlertViewolor];
        [_tipLabel setNumberOfLines:0];
        [_tipLabel setText:@"粘贴分享来自微博、微信、QQ的语音的链接，导入朋友分享的DIY语音"];
    }
    return _tipLabel;
}




-(ZMButton*)importButton
{
    if (_importButton == nil)
    {
        _importButton = [[ZMButton alloc]initWithFrame:CGRectMake(self.frame.size.width/2-100/2, self.frame.size.height-60, 100, 50)];
        [_importButton setImage:[UIImage imageNamed:@"导入.png"] forState:UIControlStateNormal];
    }
    return _importButton;
}



@end
