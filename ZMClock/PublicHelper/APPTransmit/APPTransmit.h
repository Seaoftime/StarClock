//
//  APPTransmit.h
//  CornFM
//
//  Created by ZHANGRUI on 16/1/8.
//  Copyright © 2016年 ZhangRui. All rights reserved.
//




//单利传值类
#import <Foundation/Foundation.h>

@interface APPTransmit : NSObject
{
    NSString *_recordPath;//录音本地路径
    NSString *_ringName;//铃声名字
    NSString *_ringLocalPath;//铃声本地路径
    NSString *_hour;//小时
    NSString *_min;//分
    NSString *_ringOnce;//只响一次
    NSString *_ringOnce2;//只响一次
    
    
    
    NSString *_imgStrr;//图库图片
    NSString *_justStt;//判断
    
    NSString *_imgStrr2;//相机图片
    
    NSString *_isPlayingSongName;//正在播放的音乐名字
   // NSString *_hiddenIsPlayBgV;//隐藏正在播放背景
    
    
    NSString *_userHeadPortaitStr;//聊天用户头像
    
    
    NSString *_xingbanStr;//星伴号
    
    
    NSString *_diangeFirstPageHeadPoritStr;//向点歌首页传值
    NSString *_diangeFirstPageSongNameStr;
    NSString *_diangeFirstPageSongerNameeStr;
    
    //diy 头像裁剪
    NSString *_diyHeadPoritCutStr;
    
    
    //点歌
    NSString *_textSearchSongStr;
    
    
}
//
@property (nonatomic, copy) NSString *recordPath;
@property (nonatomic, copy) NSString *ringName;
@property (nonatomic, copy) NSString *ringLocalPath;
@property (nonatomic, copy) NSString *hour;
@property (nonatomic, copy) NSString *min;
@property (nonatomic, copy) NSString *ringOnce;
@property (nonatomic, copy) NSString *ringOnce2;
@property (nonatomic, copy) NSString *imgStrr;
@property (nonatomic, copy) NSString *justStt;
@property (nonatomic, copy) NSString *imgStrr2;

@property (nonatomic, copy) NSString *isPlayingSongName;
//@property (nonatomic, copy) NSString *hiddenIsPlayBgV;
@property (nonatomic, copy) NSString *userHeadPortaitStr;
@property (nonatomic, copy) NSString *xingbanStr;


@property (nonatomic, copy) NSString *diangeFirstPageHeadPoritStr;
@property (nonatomic, copy) NSString *diangeFirstPageSongNameStr;
@property (nonatomic, copy) NSString *diangeFirstPageSongerNameeStr;
@property (nonatomic, copy) NSString *diyHeadPoritCutStr;

@property (nonatomic, copy) NSString *textSearchSongStr;


+ (APPTransmit *)shareInstance;

@end















