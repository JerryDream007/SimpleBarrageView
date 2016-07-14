//
//  SP_Tools.h
//  wdquan
//
//  Created by 宋澎 on 16/3/21.
//  Copyright © 2016年 wdquan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SP_Tools : UIView

/**
 *创建Button
 */
+(UIButton *)createButton:(CGRect)rect
          backgroundColor:(UIColor *)backgroundColor
                    title:(NSString *)title
               titleColor:(UIColor *)titleColor
                   target:(id)target
                   action:(SEL)action
                    event:(UIControlEvents)event;

/**
 *创建Label
 */
+(UILabel *)createLabel:(CGRect)rect
                   text:(NSString *)text
          textAlignmnet:(NSTextAlignment)align
              textColor:(UIColor *)textColor
        backgroundColor:(UIColor *)backgroundColor;

/**
 *创建TextField
 */
+(UITextField *)createTextField:(CGRect)rect
                    placeholder:(NSString *)placeholder
                backgroundColor:(UIColor *)backgroundColor
                    borderStyle:(UITextBorderStyle)borderStyle
                   keyboardType:(UIKeyboardType)keyboardType
                         secure:(BOOL)isSecure
                clearButtonMode:(UITextFieldViewMode)mode
                  returnKeyType:(UIReturnKeyType)keyType
                       delegate:(id)delegate;

/**
 *创建BarButtonItem
 */
+(UIBarButtonItem *)createBarButtonItem:(CGRect)rect
                                  title:(NSString *)title
                                  image:(UIImage *)image
                                 target:(id)target
                                 action:(SEL)action
                             edgeInsets:(UIEdgeInsets)contentEdgInsets;
/**
 *创建TableView
 */
+(UITableView *)createTableView:(CGRect)rect
                          style:(UITableViewStyle)style
                       delegate:(id)delegate
                     dataSource:(id)dataSource;
/**
 *创建CollectionView
 */
+(UICollectionView *)createCollectionView:(CGRect)rect
                                   layout:(UICollectionViewLayout *)layout
                                 delegate:(id)delegate
                               dataSource:(id)dataSource;
/**
 *创建UICollectionViewFlowLayout
 */
+(UICollectionViewFlowLayout *)createCollectionViewLayoutWithItemSize:(CGSize)itemSize
                                                    minInteritemSpace:(CGFloat)itemSpace
                                                         minLineSpace:(CGFloat)lineSpace
                                                            direction:(UICollectionViewScrollDirection)direction;

@end;