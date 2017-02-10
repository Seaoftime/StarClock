//
//  ZMMusicTaskCollectionViewCell.m
//  ZMClock
//
//  Created by ZhangRui on 16/6/26.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMMusicTaskCollectionViewCell.h"

#import "FGGDownloadManager.h"

@implementation ZMMusicTaskCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    
    self.topImgV.userInteractionEnabled = YES;
    self.downImgV.userInteractionEnabled = YES;
    
}

- (IBAction)onlinePlayBtn:(id)sender {
    
    if (self.onlinePlayBlock) {
        self.onlinePlayBlock(sender);
    }
    
}

- (IBAction)downloadBtnClicked:(id)sender {
    if (self.downloadBlock) {
        
        self.downloadBlock(sender);
    }
}





- (void)updateCellWithModel:(ZMMusicTaskModel *)model
{
    _musicNameLb.text = model.musicName;
    _uploadPeopleLb.text = model.musicUploadPeopleName;
    _downloadCountLb.text = [NSString stringWithFormat:@"%@次",model.musicDownloadCount];
    _downloadCountLb.textColor = TOPBGColor;
    
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
        [_downloadBtn setTitle:@"已下载" forState:UIControlStateNormal];
        _downloadBtn.enabled=NO;
    }
    else if(_downloadProgressV.progress > 0.0)
//        [_downloadBtn setTitle:@"恢复" forState:UIControlStateNormal];
         [_downloadBtn setTitle:@"下载." forState:UIControlStateNormal];
    else
        [_downloadBtn setTitle:@"下载" forState:UIControlStateNormal];
    
    
    //[self.onlinePlayyBtn setTitle:@"在线播放" forState: UIControlStateNormal];
    //[self.onlinePlayyBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
}


@end
