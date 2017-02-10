//
//  ZMAVPlayerManager.m
//  ZMClock
//
//  Created by ZhongMeng on 16/8/24.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMAVPlayerManager.h"

@implementation ZMAVPlayerManager


+ (instancetype)playerManager {
    
    static ZMAVPlayerManager * player;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        player = [[ZMAVPlayerManager alloc]init];
    });
    return player;
}

//- (id)init {
//    if (self = [super init]) {
//        self.songList = [NSMutableArray array];
//    }
//    return self;
//}




#pragma mark - 播放器
/*
 * 播放器播放状态
 */
- (BOOL)isPlaying {
    return self.player.rate == 1;
}

/*
 * 开始播放
 */
- (void)startPlay {
    
    if (!_isPlaying) {
        
        [self.player play];
    }else {
    
        [self.player pause];
    }
    
    
}


/*
 * 暂停播放
 */
- (void)pausePlay {
    
    [self.player pause];
    
}



///加载歌曲
- (void)loadNewSongg:(NSString *)songUrl
{

    NSURL * url;
    
    url = [NSURL URLWithString:songUrl];
    
    //重置播放器
    AVPlayerItem * songItem = [[AVPlayerItem alloc] initWithURL:url];
    if (self.player == nil) {
        self.player = [[AVPlayer alloc] initWithPlayerItem:songItem];
    }else {
        [self.player replaceCurrentItemWithPlayerItem:songItem];
    }
    
    
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinished:) name:AVPlayerItemDidPlayToEndTimeNotification object:songItem];
    
    
}



- (void)playbackFinished:(NSNotification *)notice {
    //(@"播放完成");
   
    [[NSNotificationCenter defaultCenter] postNotificationName:@"playbackFinishheedd" object:nil];
    
}





@end
