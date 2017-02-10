//
//  ZMMusicTaskTableViewCell.m
//  ZMClock
//
//  Created by ZhangRui on 16/6/25.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMMusicTaskTableViewCell.h"

#import "FGGDownloadManager.h"

@implementation ZMMusicTaskTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)downloadBtnClicked:(id)sender {
    
    if(self.downloadBlock)
        self.downloadBlock(sender);
    
}

- (void)updateCellWithModel:(ZMMusicTaskModel *)model
{
    _musicNameLb.text = model.musicName;
    
    //_musicNameLb.adjustsFontSizeToFitWidth=YES;
    //检查之前是否已经下载，若已经下载，获取下载进度。
    BOOL exist = [[NSFileManager defaultManager] fileExistsAtPath:model.musicDestinationPath];
    
    if(exist)
    {
        //获取原来的下载进度
        _downloadProgressV.progress = [[FGGDownloadManager shredManager] lastProgress:model.musicUrl];
        
        //获取原来的文件已下载部分大小及文件总大小
        //_sizeLabel.text=[[FGGDownloadManager shredManager] filesSize:model.url];
        //原来的进度
        //_progressLabel.text=[NSString stringWithFormat:@"%.2f%%",_progressView.progress*100];
    }
    
    if(_downloadProgressV.progress==1.0)
    {
        [_downloadBtn setTitle:@"完成" forState:UIControlStateNormal];
        _downloadBtn.enabled=NO;
    }
    else if(_downloadProgressV.progress > 0.0)
        [_downloadBtn setTitle:@"恢复" forState:UIControlStateNormal];
    else
        [_downloadBtn setTitle:@"开始" forState:UIControlStateNormal];


}


@end
