//
//  BHAboutMeViewController.m
//  brain-hole-ios
//
//  Created by Chen on 2017/11/23.
//  Copyright © 2017年 Xihe. All rights reserved.
//

#import "BHAboutMeViewController.h"
#import <Masonry/Masonry.h>
#import "BHHistoryInfoCell.h"
static NSString *FONTNAME                   =       @"PINGFANGTC-Thin";
static NSString *FONTNAME_TITLE             =       @"PINGFANGTC-Regular";
const static CGFloat HEAD_IMAGE_HEIGHT      =       200.;
@interface BHAboutMeViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *headerImgView;
@property (nonatomic, strong) UIImageView *bigImgView;
@property (nonatomic, copy) NSString *bigImgName;
@end

@implementation BHAboutMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我";
    [self configView];
    [self setBackGroundView];
    [self setHeaderView];
    
}

#pragma mark - 设置HeaderView
- (void)setHeaderView{
    CGFloat margin = 10;
    CGFloat iconWH = 80;
    
    CGFloat headerH = HEAD_IMAGE_HEIGHT + iconWH - margin;
    UIView *headerView = [[UIView alloc] init];
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(100, headerH-0.6, SCREEN_WIDTH-200, 0.6)];
    lineView.backgroundColor = [UIColor grayColor];
    headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, headerH);
    headerView.clipsToBounds = YES;
    
    // header头像按钮
    UIButton *iconBtn = [[UIButton alloc] init];
    iconBtn.layer.cornerRadius = iconWH/2;
    iconBtn.clipsToBounds = YES;
    NSString *bigImgName = @"picture3";
    self.bigImgName = bigImgName;
    [iconBtn setImage:[UIImage imageNamed:bigImgName] forState:UIControlStateNormal];
    CGFloat iconX = SCREEN_WIDTH - iconWH - margin;
    CGFloat iconY = headerH - iconWH;
    iconBtn.frame = CGRectMake(iconX, iconY, iconWH, iconWH);

    [headerView addSubview:iconBtn];
    
    // 添加昵称
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"陈质申";
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.font = [UIFont fontWithName:FONTNAME_TITLE size:17.];

    CGSize maxSize = CGSizeMake(200, MAXFLOAT);
    NSDictionary *attribute = @{NSFontAttributeName : [UIFont fontWithName:FONTNAME_TITLE size:17.]};
    CGSize nameSize = [nameLabel.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
    // 计算 nameX
    CGFloat nameX = iconX - nameSize.width - margin;
    // 计算 nameY
    CGFloat nameY = iconY + nameSize.height;
    nameLabel.frame = CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
    
    [headerView addSubview:nameLabel];
    [headerView addSubview:lineView];
    self.tableView.tableHeaderView = headerView;

}

#pragma mark - 设置背景
- (void)setBackGroundView{
    UIImageView *headerImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, HEAD_IMAGE_HEIGHT)];
    headerImgView.contentMode = UIViewContentModeScaleAspectFill;
    headerImgView.image = [UIImage imageNamed:@"1"];
    self.headerImgView = headerImgView;
    
    UIView *backGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    
    [backGroundView addSubview:headerImgView];

    self.tableView.backgroundView = backGroundView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.bigImgView removeFromSuperview];

    CGRect tempRect = self.headerImgView.frame;
 
    if (scrollView.contentOffset.y > 0) {
        tempRect.origin.y = -scrollView.contentOffset.y;
        self.headerImgView.frame = tempRect;

    }else{
        tempRect.size.height = HEAD_IMAGE_HEIGHT - scrollView.contentOffset.y;
        tempRect.origin.y = 0;
        self.headerImgView.frame = tempRect;
    }
}
#pragma mark - TableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 12;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BHHistoryInfoCell *cell = [[BHHistoryInfoCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"BHHistoryInfoCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)configView {
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(self.view);
    }];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 200;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

@end
