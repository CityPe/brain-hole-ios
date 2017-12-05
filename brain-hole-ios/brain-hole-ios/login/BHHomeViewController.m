//
//  BHHomeViewController.m
//  brain-hole-ios
//
//  Created by Xihe on 2017/11/23.
//  Copyright © 2017年 Chen. All rights reserved.
//

#import "BHHomeViewController.h"
#import "BHIndexViewController.h"

@interface BHHomeViewController ()

@end

@implementation BHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"login";
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 200, 200)];
    [btn setTitle:@"click" forState:UIControlStateNormal];
    btn.titleLabel.textColor = [UIColor blueColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}
- (void)btnClick {
    BHIndexViewController *index = [[BHIndexViewController alloc] init];
    [self.navigationController presentViewController:index animated:YES completion:nil];
    
}

@end
