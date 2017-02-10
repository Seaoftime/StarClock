//
//  TopicMoreAlertTableView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/18.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//
//
//  重复方式的表视图（周一、周二、周三、周四、周五、周六、周日）
//
//
//




#import <UIKit/UIKit.h>


@protocol TopicMoreAlertTableViewDeletage <NSObject>

-(void)topicMoreAlertTableViewSelectRowAtIndexPathWithModel:(TinkleModel*)model;

@end



@interface TopicMoreAlertTableView : UITableView

@property (nonatomic,strong) id <TopicMoreAlertTableViewDeletage> topicMoreAlertDeletage;

-(void)resetTopicArray:(NSMutableArray*)array;

@end
