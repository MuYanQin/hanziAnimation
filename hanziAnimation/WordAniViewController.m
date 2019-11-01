//
//  WordAniViewController.m
//  hanziAnimation
//
//  Created by leaduMac on 2019/10/31.
//  Copyright © 2019 leaduadmin. All rights reserved.
//

#import "WordAniViewController.h"
#import <wordAnimation/WordAnimateView.h>
@interface WordAniViewController ()

@end

@implementation WordAniViewController
{
    WordAnimateView *animationV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    animationV = [[WordAnimateView alloc]initWithFrame:CGRectMake(100, 100, 240,240)];
    animationV.word = @"我";
    //描绘颜色 注意颜色格式
    animationV.strokeColor = @"#00bc12";
    //部首颜色
    animationV.radicalsColor = @"#afdd22";
    //加载成功过后再做操作
    __weak typeof(animationV)weakAnimationV = animationV;
    //加载成功
    animationV.loadWordSuccess = ^(NSString * _Nonnull word) {
        NSLog(@"%@ load success",word);
        //开始单次动画
//        [weakAnimationV startAnimation];
        //开始循环动画
//        [weakAnimationV startAnimationWithLoop];
    };
    //加载失败
    animationV.loadWordFailed = ^(NSString * _Nonnull word) {
        NSLog(@"%@ load failed",word);
    };
    animationV.animationDone = ^(NSString * _Nonnull word) {
        NSLog(@"%@ 动画完毕",word);
    };
    [self.view addSubview:animationV];
    
    
    UIButton *btn2 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn2 setTitleColor:[UIColor purpleColor] forState:(UIControlStateNormal)];
    btn2.backgroundColor = [UIColor lightGrayColor];
    [btn2 addTarget:self action:@selector(animaClick) forControlEvents:(UIControlEventTouchUpInside)];
    btn2.frame = CGRectMake(100, 400, 170, 40);
    [btn2 setTitle:@"开始有回调的动画" forState:(UIControlStateNormal)];
    [self.view addSubview:btn2];
    
    
    UIButton *btn1 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn1 setTitleColor:[UIColor purpleColor] forState:(UIControlStateNormal)];
    btn1.backgroundColor = [UIColor lightGrayColor];
    [btn1 addTarget:self action:@selector(animaCli:) forControlEvents:(UIControlEventTouchUpInside)];
    btn1.frame = CGRectMake(100, 480, 170, 40);
    [btn1 setTitle:@"隐藏底线" forState:(UIControlStateNormal)];
    [self.view addSubview:btn1];
    
}
- (void)animaClick
{
    [animationV startAnimationWithCallBack:^(NSInteger index) {
        NSLog(@"开始第%ld画",index);
    }];
}
- (void)animaCli:(UIButton *)btn
{
    if (!btn.isSelected) {
        [animationV hiddenBaseline];
        [btn setTitle:@"隐藏底线" forState:(UIControlStateNormal)];
    }else{
        [btn setTitle:@"显示底线" forState:(UIControlStateNormal)];
        [animationV showBaseline];
    }
    btn.selected = !btn.selected;
}
- (void)dealloc
{
    [animationV viewRelease];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
