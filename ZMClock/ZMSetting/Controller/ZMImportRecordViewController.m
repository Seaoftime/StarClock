//
//  ZMImportRecordViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/12.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMImportRecordViewController.h"
#import "ImportRecordView.h"

@interface ZMImportRecordViewController () <TopicAlertViewDeletage>

@property (nonatomic,strong) ImportRecordView *importRecordView;

@end

@implementation ZMImportRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:PinkColor];
    [self setTitle:@"导入语音"];
    
    
    
    [self.view addSubview:self.importRecordView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(ImportRecordView *)importRecordView
{
    if (_importRecordView == nil)
    {
        _importRecordView = [[ImportRecordView alloc]initWithFrame:CGRectMake(20, 100, kScreen_Width-40, 220)];
        [_importRecordView.importButton addTarget:self action:@selector(importButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _importRecordView;
}



#pragma mark 
-(void)importButtonAction:(ZMButton*)sender
{
    /**
     首先取消键盘第一响应者
     */
    [self.importRecordView.inputTextFiled resignFirstResponder];
    TopicAlertView *alertView = [[TopicAlertView alloc]initWithTitle:@"导入星恋语音包" withMessage:@"导入星恋语音包导入星恋语音包导入星恋语音包导入星恋语音包导入星恋语音包" delegate:self cancelButtonTitle:@"取消" otherButtonTitle:@"导入"];
    [alertView show];
}


-(void)topicAlertButton:(nonnull ZMButton*)sender
{
    switch (sender.tag)
    {
        case 1:
        {
            NSLog(@"点击了取消");
        }
            break;
        case 2:
        {
            NSLog(@"点击了导入");
        }
            break;
    }
}
@end
