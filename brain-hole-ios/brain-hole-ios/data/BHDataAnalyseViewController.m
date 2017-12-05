//
//  BHDataAnalyseViewController.m
//  brain-hole-ios
//
//  Created by Chen on 2017/11/27.
//  Copyright © 2017年 Xihe. All rights reserved.
//

#import "BHDataAnalyseViewController.h"
#import <Masonry/Masonry.h>
#import "BHBHDataAnalyseCell.h"
static NSString *FONTNAME                   =       @"PINGFANGTC-Thin";
static NSString *FONTNAME_TITLE             =       @"PINGFANGTC-Regular";
@interface BHDataAnalyseViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation BHDataAnalyseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"数据";
    [self configView];
}

- (void)configView {
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.bottom.equalTo(self.view);
    }];
}
#pragma mark - UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section?2:4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BHBHDataAnalyseCell *cell = [[BHBHDataAnalyseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BHBHDataAnalyseCell"];
    [cell configUI:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 170;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width , 30);
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.font = [UIFont fontWithName:FONTNAME size:30];
    label.backgroundColor = [[UIColor lightGrayColor]colorWithAlphaComponent:0.3];
    label.text = section ? @"Bar":@"Line";
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    return _tableView;
}

@end
