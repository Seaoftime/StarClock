//
//  APPTransmit.m
//  CornFM
//
//  Created by ZHANGRUI on 16/1/8.
//  Copyright © 2016年 ZhangRui. All rights reserved.
//

#import "APPTransmit.h"

@implementation APPTransmit


@synthesize recordPath = _recordPath;
@synthesize ringName = _ringName;
@synthesize ringLocalPath = _ringLocalPath;
@synthesize hour = _hour;
@synthesize min = _min;
@synthesize ringOnce = _ringOnce;
@synthesize ringOnce2 = _ringOnce2;
@synthesize imgStrr = _imgStrr;
@synthesize justStt = _justStt;
@synthesize imgStrr2 = _imgStrr2;

@synthesize isPlayingSongName = _isPlayingSongName;
//@synthesize hiddenIsPlayBgV = _hiddenIsPlayBgV;

@synthesize userHeadPortaitStr = _userHeadPortaitStr;
@synthesize xingbanStr = _xingbanStr;

@synthesize diangeFirstPageSongNameStr = _diangeFirstPageSongNameStr;
@synthesize diangeFirstPageHeadPoritStr = _diangeFirstPageHeadPoritStr;
@synthesize diangeFirstPageSongerNameeStr = _diangeFirstPageSongerNameeStr;



@synthesize diyHeadPoritCutStr = _diyHeadPoritCutStr;

@synthesize textSearchSongStr = _textSearchSongStr;


//
- (instancetype)init
{
    if (self = [super init]) {
        //
    }
    return self;
}
//
+ (APPTransmit *)shareInstance
{
    static APPTransmit *app_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        app_instance = [[APPTransmit alloc] init];
    });
    
    return app_instance;
}



@end
