//
//  ZMUserCennnterVoiceSpeakerModel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/10/28.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZMUserCennnterVoiceSpeakerModel : NSObject

@property (nonatomic, copy) NSString *boy_speakerName;
@property (nonatomic, copy) NSString *boy_speakerVoice;
@property (nonatomic, copy) NSString *boy_speakerUseOrnot;


@property (nonatomic, copy) NSString *girl_speakerName;
@property (nonatomic, copy) NSString *girl_speakerVoice;
@property (nonatomic, copy) NSString *girl_speakerUseOrnot;






//选中状态
@property(nonatomic, assign) BOOL useOrnot_isSelected;




@end
