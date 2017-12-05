//
//  BHHistoryInfoCell.m
//  brain-hole-ios
//
//  Created by Chen on 2017/11/30.
//  Copyright © 2017年 Xihe. All rights reserved.
//

#import "BHHistoryInfoCell.h"
#import <Masonry/Masonry.h>
static NSString *FONTNAME                   =       @"PINGFANGTC-Thin";
static NSString *FONTNAME_TITLE             =       @"PINGFANGTC-Regular";

@interface BHHistoryInfoCell()
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UIView *bottomLineView;
@property (nonatomic, strong) UIView *smallLineView;
@end

@implementation BHHistoryInfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configView];
    }
    return self;
}

- (void)configView {
    [self addSubview:self.detailLabel];
    [self addSubview:self.bottomLineView];
    [self addSubview:self.smallLineView];

    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.height.equalTo(@150);
        make.centerX.equalTo(self.mas_centerX);
        make.width.equalTo(@250);
    }];
    
    [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@5);
        make.width.equalTo(@0.6);
        make.left.equalTo(self.mas_left).offset(40);
        make.centerY.equalTo(self.detailLabel.mas_centerY);
    }];
    
    [self.smallLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.width.equalTo(@40);
        make.height.equalTo(@0.6);
        make.top.equalTo(self.detailLabel.mas_bottom);
        make.bottom.equalTo(self.mas_bottom);
    }];
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.textColor = [UIColor blackColor];
        _detailLabel.text = @"有幸记录下阿多尼斯的读诗视频。从他的诗歌朗诵中，能从感官层面上体会到\n-- 阿尔伯特·爱因斯坦";
        _detailLabel.font = [UIFont fontWithName:FONTNAME size:17.];
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        _detailLabel.numberOfLines = 0;
    }
    return _detailLabel;
}

- (UIView *)bottomLineView {
    if (!_bottomLineView) {
        _bottomLineView = [[UIView alloc] init];
        _bottomLineView.backgroundColor = [UIColor grayColor];
    }
    return _bottomLineView;
}

- (UIView *)smallLineView {
    if (!_smallLineView) {
        _smallLineView = [[UIView alloc] init];
        _smallLineView.backgroundColor = [UIColor grayColor];
    }
    return _smallLineView;
}
@end
