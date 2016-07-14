//
//  SP_LoopTips.h
//  wdquan
//
//  Created by 宋澎 on 16/7/12.
//  Copyright © 2016年 wdquan. All rights reserved.
//  循环提示

#import <UIKit/UIKit.h>

@interface SP_LoopTips : UIView

@property (nonatomic,assign) NSUInteger timeSpace;      //时间间隔 (默认是1s)
  
+ (SP_LoopTips *)shareLoopTips;

- (void)startLoopTipsWithAvatarImageArray:(NSArray *)avatarArray andTextArray:(NSArray *)textArray;

- (void)stopLoopTips;

@end
