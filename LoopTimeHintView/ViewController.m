//
//  ViewController.m
//  LoopTimeHintView
//
//  Created by 宋澎 on 16/7/12.
//  Copyright © 2016年 宋澎. All rights reserved.
//

#import "ViewController.h"

#import "SP_LoopTips.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self performSelector:@selector(startHint) withObject:self afterDelay:1];
}

- (void)startHint{
    
    NSString * avatarPath = @"http://wdquan-space.b0.upaiyun.com/IMAGE/2016/07/08/7a9f1ac9e589b25c03c62d73c601fa0b81000!thumb.avatar";
    
    NSArray * imageArray = @[avatarPath,avatarPath,avatarPath,avatarPath,avatarPath];
    
    NSArray * textArray = @[
                            @"1111111111111111111111111111111111111111111111111111111111111111111",
                            @"222222222",
                            @"333",
                            @"444444444444444",
                            @"55555555555"
                           ];
    
    SP_LoopTips * tips = [SP_LoopTips shareLoopTips];
    
    [tips startLoopTipsWithAvatarImageArray:imageArray andTextArray:textArray];
    
//    [[SP_LoopTips shareLoopTips] startLoopTipsWithAvatarImageArray:imageArray andTextArray:textArray];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
