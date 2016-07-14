//
//  SP_Tools.m
//  wdquan
//
//  Created by 宋澎 on 16/3/21.
//  Copyright © 2016年 wdquan. All rights reserved.
//

#import "SP_Tools.h"

@implementation SP_Tools

+(UIButton *)createButton:(CGRect)rect backgroundColor:(UIColor *)backgroundColor title:(NSString *)title titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action event:(UIControlEvents)event{
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=rect;
    button.backgroundColor=backgroundColor;
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:event];
    return button;
}
+(UILabel *)createLabel:(CGRect)rect text:(NSString *)text textAlignmnet:(NSTextAlignment)align textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor{
    UILabel *label=[[UILabel alloc] init];
    label.frame=rect;
    label.text=text;
    label.textAlignment=align;
    label.textColor=textColor;
    label.backgroundColor=backgroundColor;
    return label;
}
+(UITextField *)createTextField:(CGRect)rect placeholder:(NSString *)placeholder backgroundColor:(UIColor *)backgroundColor borderStyle:(UITextBorderStyle)borderStyle keyboardType:(UIKeyboardType)keyboardType secure:(BOOL)isSecure clearButtonMode:(UITextFieldViewMode)mode returnKeyType:(UIReturnKeyType)keyType delegate:(id)delegate{
    
    UITextField *textField=[[UITextField alloc] initWithFrame:rect];
    textField.placeholder=placeholder;
    textField.backgroundColor=backgroundColor;
    textField.borderStyle=borderStyle;
    textField.keyboardType=keyboardType;
    textField.secureTextEntry=isSecure;
    textField.clearButtonMode=mode;
    textField.returnKeyType=keyType;
    textField.delegate=delegate;
    return  textField;
}
+(UIBarButtonItem *)createBarButtonItem:(CGRect)rect title:(NSString *)title image:(UIImage *)image target:(id)target action:(SEL)action edgeInsets:(UIEdgeInsets)contentEdgInsets{
    UIButton * button = [self createButton:rect backgroundColor:nil title:title titleColor:[UIColor blackColor] target:target action:action event:UIControlEventTouchUpInside];
    [button setImage:image forState:UIControlStateNormal];
    UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    button.contentEdgeInsets = contentEdgInsets;
    button.backgroundColor = [UIColor clearColor];
//    button.backgroundColor = [UIColor redColor];
    return barButtonItem;
}
+(UITableView *)createTableView:(CGRect)rect style:(UITableViewStyle)style delegate:(id)delegate dataSource:(id)dataSource{
    UITableView * tableView = [[UITableView alloc] initWithFrame:rect style:style];
    tableView.delegate = delegate;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.showsHorizontalScrollIndicator = NO;
    tableView.dataSource = dataSource;
    return tableView;
}
+(UICollectionViewFlowLayout *)createCollectionViewLayoutWithItemSize:(CGSize)itemSize minInteritemSpace:(CGFloat)itemSpace minLineSpace:(CGFloat)lineSpace direction:(UICollectionViewScrollDirection)direction{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing = itemSpace;
    layout.minimumLineSpacing = lineSpace;
    [layout setItemSize:itemSize];
    [layout setScrollDirection:direction];
    return layout;
}
+(UICollectionView *)createCollectionView:(CGRect)rect layout:(UICollectionViewLayout *)layout delegate:(id)delegate dataSource:(id)dataSource{
    UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor clearColor];
    collectionView.delegate = delegate;
    collectionView.dataSource = dataSource;
    return collectionView;
}
@end
