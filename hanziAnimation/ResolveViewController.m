//
//  ResolveViewController.m
//  hanziAnimation
//
//  Created by leaduMac on 2019/10/31.
//  Copyright © 2019 leaduadmin. All rights reserved.
//

#import "ResolveViewController.h"
#import <wordAnimation/WordAnimateView.h>

@interface ResolveViewController ()

@end

@implementation ResolveViewController
{
    WordAnimateView *animationV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    animationV = [[WordAnimateView alloc]initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width,180)];
    animationV.onStep = YES;
    animationV.word = @"我";
    //描绘颜色 注意颜色格式
    animationV.strokeColor = @"#00bc12";
    animationV.unitSide = 80;
    animationV.marginRight = 10;
    [self.view addSubview:animationV];
    //加载成功过后再做操作
    __weak typeof(animationV)weakAnimationV = animationV;
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
