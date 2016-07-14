//
//  SP_LoopTips.m
//  wdquan
//
//  Created by 宋澎 on 16/7/12.
//  Copyright © 2016年 wdquan. All rights reserved.
//

#import "SP_LoopTips.h"

#import "SP_Tools.h"

#import "UIView+Frame.h"

#import "UIImageView+WebCache.h"

#define kScreenSize           [[UIScreen mainScreen] bounds].size

#define kScreenWidth          [UIScreen mainScreen].bounds.size.width

#define kScreenHeight         [UIScreen mainScreen].bounds.size.height

static const NSUInteger BackgroundViewWidth = 200;      //背景视图的高度

static const NSUInteger BackgroundViewHeight = 50;      //背景视图的宽度

static const NSUInteger AvatarImageHeight = 30;         //头像的高度

static const NSUInteger ViewSpace = 10;                 //各个控件之间的间隔

static const NSUInteger TimeSpace = 1;                  //时间间隔

static const NSUInteger LabelFontSize = 14;             //字体大小

@interface SP_LoopTips ()

@property (nonatomic,strong) UIView * backgroundView;       //背景视图

@property (nonatomic,strong) UIImageView * avatarImage;     //头像

@property (nonatomic,strong) UILabel * textLabel;           //文字

@end

@implementation SP_LoopTips
{
    NSArray * _avatarArray;
    
    NSArray * _textArray;
    
    NSUInteger _index;
}
+ (SP_LoopTips *)shareLoopTips{
    
    static SP_LoopTips *loopTips = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        loopTips = [[self alloc] init];
        
        [loopTips initView];
    });
    
    return loopTips;
}

- (void)startLoopTipsWithAvatarImageArray:(NSArray *)avatarArray andTextArray:(NSArray *)textArray{
    
    _avatarArray = avatarArray;
    
    _textArray = textArray;
    
    //开始动画
    self.backgroundView.hidden = NO;
    
    _index = 0;
    
    [self startAnimation];
}

- (void)stopLoopTips{
    self.backgroundView.hidden = YES;
}

-(void)initView{
    
    UIWindow * window = [UIApplication sharedApplication].keyWindow;

    //增加背景视图
    [window addSubview:self.backgroundView];
    
    //增加头像
    [self.backgroundView addSubview:self.avatarImage];
    
    //增加文字
    [self.backgroundView addSubview:self.textLabel];
    
}

- (void)startAnimation{
    
    [self.avatarImage sd_setImageWithURL:[NSURL URLWithString:_avatarArray[_index]] placeholderImage:[UIImage imageNamed:@"110"]];
    
    self.textLabel.text = _textArray[_index];
    
    CGSize size = [self.textLabel.text boundingRectWithSize:CGSizeMake(kScreenWidth - self.avatarImage.right - ViewSpace * 4, BackgroundViewHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:LabelFontSize]} context:nil].size;
    
    self.backgroundView.size = CGSizeMake(self.textLabel.x + size.width + ViewSpace, BackgroundViewHeight);
    
    self.textLabel.size = CGSizeMake(size.width, BackgroundViewHeight);
    
    self.backgroundView.alpha = 0.0;
    
    self.backgroundView.transform = CGAffineTransformMakeTranslation(0, 30);
    
    [UIView animateWithDuration:0.3 animations:^{
    
        self.backgroundView.transform = CGAffineTransformIdentity;
        
        self.backgroundView.alpha = 1.0;
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:3.0 animations:^{
            
            self.backgroundView.transform = CGAffineTransformMakeTranslation(0, -100);
            
            self.backgroundView.alpha = 0;
            
        } completion:^(BOOL finished) {
            
            self.backgroundView.transform = CGAffineTransformIdentity;
            
            self.backgroundView.alpha = 0.0;
            
            _index++;
            
            if (_index < _avatarArray.count) {
                [self performSelector:@selector(startAnimation) withObject:self afterDelay:self.timeSpace>0?self.timeSpace:TimeSpace];
            }
        }];
    }];
}

- (UIView *)backgroundView{
    if (!_backgroundView) {
        _backgroundView =  [[UIView alloc] initWithFrame:CGRectMake(10, 144, BackgroundViewWidth, BackgroundViewHeight)];
        _backgroundView.backgroundColor = [UIColor blackColor];
        _backgroundView.alpha = 0.9f;
        _backgroundView.layer.masksToBounds = YES;
        _backgroundView.layer.cornerRadius = _backgroundView.height/2;
    }
    return _backgroundView;
}

- (UIImageView *)avatarImage{
    if (!_avatarImage) {
        _avatarImage = [[UIImageView alloc] initWithFrame:CGRectMake(ViewSpace, (BackgroundViewHeight - AvatarImageHeight)/2, AvatarImageHeight, AvatarImageHeight)];
        _avatarImage.layer.cornerRadius = _avatarImage.height/2;
        _avatarImage.layer.masksToBounds = YES;
    }
    return _avatarImage;
}

- (UILabel *)textLabel{
    if (!_textLabel) {
        _textLabel = [SP_Tools createLabel:CGRectMake(_avatarImage.right + ViewSpace, 0, _backgroundView.width - _avatarImage.right - ViewSpace, _backgroundView.height) text:@"测试数据,哈哈哈哈" textAlignmnet:NSTextAlignmentLeft textColor:[UIColor whiteColor] backgroundColor:[UIColor clearColor]];
        _textLabel.font = [UIFont systemFontOfSize:LabelFontSize];
    }
    return _textLabel;
}

@end
