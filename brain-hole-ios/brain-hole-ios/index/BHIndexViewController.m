//
//  BHIndexViewController.m
//  brain-hole-ios
//
//  Created by Chen on 2017/11/23.
//  Copyright © 2017年 Xihe. All rights reserved.
//

#import "BHIndexViewController.h"
#import "BHAboutMeViewController.h"
#import "BHDataAnalyseViewController.h"
#import "BHWorldViewController.h"
#import "BHSocialViewController.h"

@implementation BHIndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    BHAboutMeViewController *about = [[BHAboutMeViewController alloc] init];
    BHWorldViewController *world = [[BHWorldViewController alloc] init];
    BHDataAnalyseViewController *data = [[BHDataAnalyseViewController alloc] init];
    BHSocialViewController *social = [[BHSocialViewController alloc] init];
    
    UINavigationController *socialNC =  [[UINavigationController alloc] initWithRootViewController:social];
    UINavigationController *aboutNC = [[UINavigationController alloc] initWithRootViewController:about];
    UINavigationController *worldNC = [[UINavigationController alloc] initWithRootViewController:world];
    UINavigationController *dataNC = [[UINavigationController alloc] initWithRootViewController:data];
    [self setNav:socialNC];
    [self setNav:aboutNC];
    [self setNav:worldNC];
    [self setNav:dataNC];
    
    [self.tabBar setTintColor:[UIColor whiteColor]];
    [self.tabBar setBarTintColor:[UIColor blackColor]];
//    social.tabBarItem.image = [UIImage imageNamed:@"appresicate"];
    social.tabBarItem.title = @"社区";
//    about.tabBarItem.image = [UIImage imageNamed:@"share"];
    about.tabBarItem.title = @"我";
    world.tabBarItem.title = @"世界";
//    world.tabBarItem.image = [UIImage imageNamed:@"share"];
    data.tabBarItem.title = @"统计";
//    data.tabBarItem.image = [UIImage imageNamed:@"share"];
    //3、添加到控制器
    self.viewControllers = [NSArray arrayWithObjects:worldNC,socialNC,dataNC,aboutNC, nil];
}

- (void) setNav: (UINavigationController*) nav
{
    [nav.navigationBar setBarTintColor:[UIColor blackColor]];
    [nav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [nav.navigationBar setTintColor:[UIColor blackColor]];
}

@end
