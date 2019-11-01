//
//  WordAnimateView.h
//  wordAnimation
//
//  Created by leaduMac on 2019/10/16.
//  Copyright © 2019 leaduadmin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
//为了展示效果。 动画的view建议宽高相同正方形。分解笔画的view长方形
@interface WordAnimateView : UIView
/**
 单个动画结束回调
 */
@property (nonatomic , copy) void(^animationDone)(NSString *word);

/**
 加载失败
 */
@property (nonatomic , copy) void(^loadWordFailed)(NSString *word);

/**
 加载成功
 */
@property (nonatomic , copy) void(^loadWordSuccess)(NSString *word);

/**
 描写某一画失败
 */
@property (nonatomic , copy) void(^depictMistake)(id value);

/**
 描写某一画成功
 */
@property (nonatomic , copy) void(^depictCorrectStroke)(id value);


/**
 描写完成
 */
@property (nonatomic , copy) void(^depictComplete)(id value);

/**
 文字
 */
@property (nonatomic , copy) NSString * word;

/**
 描绘的颜色 十六进制字符串 #000000。必须带#
 */
@property (nonatomic , copy) NSString * strokeColor;

/**
 部首的颜色 十六进制字符串 #000000 必须带#
 */
@property (nonatomic , copy) NSString * radicalsColor;


/**
 展示分解步骤 yes是。no否 默认NO
 */
@property (nonatomic , assign) BOOL onStep;


/**
 笔画分解的视图边长
 */
@property (nonatomic , assign) CGFloat  unitSide;

/**
 右面的距离
 */
@property (nonatomic , assign) CGFloat  marginRight;

/**
 检查是否支持动画

 @param word 文字
 */
+ (BOOL)canAnimation:(NSString *)word;

/**
 开始描写 loadWordSuccess后调用
 */
- (void)startDepict;


/**
 开始播放动画 loadWordSuccess后调用
 */
- (void)startAnimation;

/**
 开始播放动画 loadWordSuccess后调用
 */
- (void)startAnimationWithCallBack:(void(^)(NSInteger index))callBack;
/**
 开始播放循环动画 loadWordSuccess后调用
 */
- (void)startAnimationWithLoop;


/**
 展示背景字  loadWordSuccess后调用
 */
- (void)showBaseline;

/**
 隐藏背景字 loadWordSuccess后调用
 */
- (void)hiddenBaseline;

/**
 书写第几划 从0开始计数

 @param index 笔划数
 */
- (void)animateWithStroke:(NSInteger)index;


/**
 释放View vc释放的时候调用
 */
- (void)viewRelease;
@end

NS_ASSUME_NONNULL_END
