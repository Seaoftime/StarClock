//
//  ZMAVPlayerManager.h
//  ZMClock
//
//  Created by ZhongMeng on 16/8/24.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AVFoundation/AVFoundation.h>

#import "ZMSearchSonngModell.h"

@interface ZMAVPlayerManager : NSObject


/*
 * 歌曲列表
 */
@property (nonatomic, strong) NSMutableArray<ZMSearchSonngModell *> * songList;


/*
 * 当前播放歌曲
 */
@property (nonatomic, strong)  ZMSearchSonngModell * currentSongModel;


#pragma mark - 播放器
/*
 * 播放器
 */
@property (nonatomic, strong) AVPlayer * player;

/*
 * 播放器播放状态
 */
@property (nonatomic, assign) BOOL isPlaying;

/*
 * 播放进度
 */
@property (nonatomic, assign) float progress;

/*
 * 当前播放时间(秒)
 */
@property (nonatomic, copy) NSString * playTime;

/*
 * 总时长(秒)
 */
@property (nonatomic, copy) NSString * playDuration;


/*
 * 获取单例
 */
+ (instancetype)playerManager;

/*
 * 开始播放
 */
- (void)startPlay;

/*
 * 暂停播放
 */
- (void)pausePlay;


- (void)loadNewSongg:(NSString *)songUrl;




@end
