//
//  BHWorldViewController.m
//  brain-hole-ios
//
//  Created by Chen on 2017/11/27.
//  Copyright © 2017年 Xihe. All rights reserved.
//

#import "BHWorldViewController.h"
#import "SwipeView.h"
#import "BHWorldDetailView.h"
#import <Masonry/Masonry.h>

@interface BHWorldViewController ()<SwipeDelegate,SwipeViewDataSource>

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) SwipeView *swipeView;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) UIView *grayView;

@end

@implementation BHWorldViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"世界";
    self.view.backgroundColor = [UIColor whiteColor];//[UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    [self configView];
    self.count = 5;
}

- (void)configView {
    [self.view addSubview:self.grayView];
    [self.grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
    [self.grayView addSubview:self.swipeView];
}
- (void)btnClick {
    [self.swipeView swipeDirection:SwipeDirectionLeft];
}

- (NSUInteger)swipeViewNumberOfCards:(SwipeView *)swipeView {
    return self.count;
}

- (UIView *)swipeView:(SwipeView *)swipeView
          cardAtIndex:(NSUInteger)index
{
//    NSString *imageName = [NSString stringWithFormat:@"Card_like_%@",@(index + 1)];
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    BHWorldDetailView *view = [[BHWorldDetailView alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT*1/6, SCREEN_WIDTH - 40, SCREEN_HEIGHT*2/3)];
    
    return view;
}

- (OverlayView *)swipeView:(SwipeView *)swipeView
        cardOverlayAtIndex:(NSUInteger)index
{
    OverlayView *overlay;
    
    return overlay;
}

- (void)swipeView:(SwipeView *)swipeView didSwipeCardAtIndex:(NSUInteger)index inDirection:(SwipeDirection)direction
{
    if (index >= 3) {
        self.count = 6;
        [self.swipeView reloadData];
    }
}

- (void)swipeViewDidRunOutOfCards:(SwipeView *)swipeView
{
    [swipeView resetCurrentCardNumber];
}

- (void)swipeView:(SwipeView *)swipeView didSelectCardAtIndex:(NSUInteger)index
{
    NSLog(@"点击");
}

- (BOOL)swipeViewShouldApplyAppearAnimation:(SwipeView *)swipeView
{
    return YES;
}

- (BOOL)swipeViewShouldMoveBackgroundCard:(SwipeView *)swipeView
{
    return YES;
}

- (BOOL)swipeViewShouldTransparentizeNextCard:(SwipeView *)swipeView
{
    return YES;
}

- (POPPropertyAnimation *)swipeViewBackgroundCardAnimation:(SwipeView *)swipeView
{
    return nil;
}
#pragma mark - Accessor

- (SwipeView *)swipeView {
    if (!_swipeView) {
        _swipeView = [[SwipeView alloc] initWithFrame:CGRectMake(20, 80, SCREEN_WIDTH - 40, SCREEN_HEIGHT-144)];
        _swipeView.delegate = self;
        _swipeView.dataSource = self;
    }
    return _swipeView;
}

- (UIView *)grayView {
    if (!_grayView) {
        _grayView = [[UIView alloc] init];
        _grayView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.3];
    }
    return _grayView;
}

- (UIButton *)btn {
    if (!_btn) {
        _btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 200, 100)];
        [_btn setTitle:@"click" forState:UIControlStateNormal];
        [_btn setBackgroundColor:[UIColor redColor]];
        [_btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}


@end

