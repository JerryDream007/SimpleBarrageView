//
//  UIView+Frame.h
//  wdquan
//
//  Created by 宋澎 on 16/3/16.
//  Copyright © 2016年 wdquan. All rights reserved.
//

#import <UIKit/UIKit.h>

CGPoint CGRectGetCenter(CGRect rect);
CGRect  CGRectMoveToCenter(CGRect rect, CGPoint center);

@interface UIView (Frame)

@property (nonatomic,assign) CGPoint origin;
@property (nonatomic,assign) CGSize size;

@property (nonatomic,assign,readonly) CGPoint bottomLeft;
@property (nonatomic,assign,readonly) CGPoint bottomRight;
@property (nonatomic,assign,readonly) CGPoint topRight;

@property (nonatomic,assign) CGFloat height;
@property (nonatomic,assign) CGFloat width;

@property (nonatomic,assign) CGFloat top;
@property (nonatomic,assign) CGFloat y;
@property (nonatomic,assign) CGFloat left;
@property (nonatomic,assign) CGFloat x;

@property (nonatomic,assign) CGFloat bottom;
@property (nonatomic,assign) CGFloat right;

@property (nonatomic,assign) CGFloat centerX;
@property (nonatomic,assign) CGFloat centerY;

- (void) moveBy: (CGPoint) delta;
- (void) scaleBy: (CGFloat) scaleFactor;
- (void) fitInSize: (CGSize) aSize;
/**
 * @brief 移除此view上的所有子视图
 */
- (void)removeAllSubviews;

@end
