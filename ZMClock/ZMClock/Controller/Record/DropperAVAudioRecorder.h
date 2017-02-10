//
//  DropperAVAudioRecorder.h
//  Dropper
//
//  Created by ZhongMeng on 16/2/29.
//  Copyright © 2016年 yaolizhi. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DropperAVAudioRecorder : NSObject



-(instancetype)initWithObject:(UIViewController*)object;


- (void)recordClick:(UIButton *)sender;
- (void)stopClick:(UIButton *)sender;

@end
