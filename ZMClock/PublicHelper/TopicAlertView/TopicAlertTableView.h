//
//  TopicAlertTableView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/17.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//
//  重复方式的表视图（周一至周五、直响一次、法定工作日、周末、自定义）
//
//
//

#import <UIKit/UIKit.h>
#import "TinkleModel.h"
#import "TopicAlertTableViewCell.h"

@protocol TopicAlertTableViewDeletage <NSObject>

-(void)topicAlertTableViewSelectRowAtIndexPathWithModel:(TinkleModel*)model;

@end


@interface TopicAlertTableView : UITableView <UITableViewDelegate,UITableViewDataSource>


@property (nonatomic,strong) id <TopicAlertTableViewDeletage> topicAlertDeletage;


-(void)resetTopicArray:(NSMutableArray*)array;


@end
