//
//  ViewController.m
//  hanziAnimation
//
//  Created by leaduMac on 2019/10/31.
//  Copyright © 2019 leaduadmin. All rights reserved.
//

#import "ViewController.h"
#import "WordAniViewController.h"
#import "ResolveViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    UIButton *btn1 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn1 setTitleColor:[UIColor purpleColor] forState:(UIControlStateNormal)];
    btn1.backgroundColor = [UIColor lightGrayColor];
    btn1.frame = CGRectMake(100, 100, 100, 40);
    btn1.tag = 1000;
    [btn1 addTarget:self action:@selector(animaClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [btn1 setTitle:@"动画" forState:(UIControlStateNormal)];
    [self.view addSubview:btn1];
    
    
    UIButton *btn3 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn3 setTitleColor:[UIColor purpleColor] forState:(UIControlStateNormal)];
    btn3.backgroundColor = [UIColor lightGrayColor];
    btn3.frame = CGRectMake(100, 200, 100, 40);
    btn3.tag = 3000;

    [btn3 addTarget:self action:@selector(animaClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [btn3 setTitle:@"分解" forState:(UIControlStateNormal)];
    [self.view addSubview:btn3];
}
- (void)animaClick:(UIButton *)btn
{
    if (btn.tag == 1000) {
        [self.navigationController pushViewController:[WordAniViewController new] animated:YES];
    }else{
        [self.navigationController pushViewController:[ResolveViewController new] animated:YES];
    }
}


@end
