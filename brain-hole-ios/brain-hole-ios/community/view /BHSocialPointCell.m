//
//  BHSocialPointCell.m
//  brain-hole-ios
//
//  Created by Chen on 2017/11/29.
//  Copyright © 2017年 Xihe. All rights reserved.
//

#import "BHSocialPointCell.h"
#import <Masonry/Masonry.h>
static NSString *FONTNAME                   =       @"PINGFANGTC-Thin";
static NSString *FONTNAME_TITLE             =       @"PINGFANGTC-Regular";
const static CGFloat MARGIN                 =       10.;
const static CGFloat HEAD_IMAGE_WIDTH       =       45;
const static CGFloat SMALL_ICON_HEIGHT      =       15;
const static CGFloat SMALL_LABEL_WIDTH      =       30;
@interface BHSocialPointCell ()
@property (nonatomic, strong) UIImageView *mainImage;
@property (nonatomic, strong) UIImageView *headImage;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UIImageView *userImageView;
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UIButton *replyBtn;
@property (nonatomic, strong) UILabel *replyNumLabel;
@property (nonatomic, strong) UIButton *shareBtn;
@property (nonatomic, strong) UIButton *likeBtn;
@property (nonatomic, strong) UILabel *likeNumLabel;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIButton *collectBtn;
@property (nonatomic, strong) UILabel *collectNumLabel;
@end

@implementation BHSocialPointCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configView];
    }
    return self;
}
- (void)configView {
    [self addSubview:self.mainImage];
    [self addSubview:self.headImage];
    [self addSubview:self.nameLabel];
    [self addSubview:self.dateLabel];
    [self addSubview:self.userImageView];
    [self addSubview:self.detailLabel];
    [self addSubview:self.lineView];
    [self addSubview:self.likeBtn];
    [self addSubview:self.likeNumLabel];
    [self addSubview:self.replyBtn];
    [self addSubview:self.replyNumLabel];
    [self addSubview:self.collectBtn];
    [self addSubview:self.collectNumLabel];
    [self addSubview:self.shareBtn];
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(MARGIN);
        make.left.equalTo(self.mas_left).offset(MARGIN);
        make.height.width.equalTo(@(HEAD_IMAGE_WIDTH));
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImage.mas_right).offset(MARGIN);
        make.top.equalTo(self.headImage.mas_top);
        make.height.equalTo(@20);
        make.right.equalTo(self.mas_right).offset(-MARGIN);
    }];
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.headImage.mas_bottom);
        make.left.equalTo(self.headImage.mas_right).offset(MARGIN);
        make.right.equalTo(self.mas_right).offset(-MARGIN);
        make.height.equalTo(@20);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.dateLabel.mas_bottom).offset(2*MARGIN);
        make.height.equalTo(@150);
        make.centerX.equalTo(self.mas_centerX);
        make.width.equalTo(@250);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.detailLabel.mas_bottom).offset(MARGIN);
        make.height.equalTo(@0.);
        make.right.equalTo(self.mas_right).offset(-MARGIN);
        make.left.equalTo(self.headImage.mas_centerX);
    }];
    [self.likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.equalTo(@(SMALL_ICON_HEIGHT));
        make.top.equalTo(self.lineView.mas_bottom).offset(MARGIN);
        make.bottom.equalTo(self.mas_bottom).offset(-MARGIN);
        make.left.equalTo(self.lineView.mas_left).offset(MARGIN);
    }];
    [self.likeNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.equalTo(self.likeBtn);
        make.left.equalTo(self.likeBtn.mas_right).offset(5);
        make.width.equalTo(@(SMALL_LABEL_WIDTH));
    }];
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(self.likeBtn);
        make.top.equalTo(self.nameLabel);
        make.right.equalTo(self.mas_right).offset(-MARGIN);
    }];
    [self.replyNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.likeBtn);
        make.centerX.equalTo(self.lineView.mas_centerX);
        make.width.equalTo(@(SMALL_LABEL_WIDTH));
    }];
    
    [self.replyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.likeBtn);
        make.width.height.equalTo(self.likeBtn);
        make.right.equalTo(self.replyNumLabel.mas_left).offset(-5);
    }];
    
    [self.collectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.likeBtn);
        make.width.height.equalTo(self.likeBtn);
        make.right.equalTo(self.collectNumLabel.mas_left).offset(-5);
    }];
    [self.collectNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.likeBtn);
        make.width.equalTo(@(SMALL_LABEL_WIDTH));
        make.right.equalTo(self.lineView.mas_right).offset(-MARGIN);
    }];
    
}

- (UIImageView *)mainImage {
    if (!_mainImage) {
        _mainImage = [[UIImageView alloc] init];
        _mainImage.image = [UIImage imageNamed:@"bgimg"];
    }
    return _mainImage;
}

- (UIImageView *)headImage {
    if (!_headImage) {
        _headImage = [[UIImageView alloc] init];
        _headImage.image = [UIImage imageNamed:@"bgimg"];
        _headImage.layer.cornerRadius = HEAD_IMAGE_WIDTH/2;
        _headImage.clipsToBounds = YES;
    }
    return _headImage;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.text = @"陈质申";
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.font = [UIFont fontWithName:FONTNAME_TITLE size:17.];
    }
    return _nameLabel;
}

- (UILabel *)dateLabel {
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc] init];
        _dateLabel.text = @"2017-02-19";
        _dateLabel.textColor = [UIColor grayColor];
        _dateLabel.font = [UIFont fontWithName:FONTNAME size:12.];
    }
    return _dateLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.text = @"有幸记录下阿多尼斯的读诗视频。从他的诗歌朗诵中，能从感官层面上体会到\n-- 阿尔伯特·爱因斯坦";
        _detailLabel.textColor = [UIColor blackColor];
        _detailLabel.font = [UIFont fontWithName:FONTNAME size:17.];
        _detailLabel.numberOfLines = 0;
        _detailLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _detailLabel;
}
- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor grayColor];
    }
    return _lineView;
}

- (UILabel *)replyNumLabel {
    if (!_replyNumLabel) {
        _replyNumLabel = [[UILabel alloc] init];
        _replyNumLabel.text = @"23";
        _replyNumLabel.font = [UIFont fontWithName:FONTNAME size:11.];
        _replyNumLabel.textColor = [UIColor grayColor];
    }
    return _replyNumLabel;
}

- (UILabel *)likeNumLabel {
    if (!_likeNumLabel) {
        _likeNumLabel = [[UILabel alloc] init];
        _likeNumLabel.text = @"23w";
        _likeNumLabel.font = [UIFont fontWithName:FONTNAME size:11.];
        _likeNumLabel.textColor = [UIColor grayColor];
    }
    return _likeNumLabel;
}

- (UILabel *)collectNumLabel {
    if (!_collectNumLabel) {
        _collectNumLabel = [[UILabel alloc] init];
        _collectNumLabel.text = @"33w";
        _collectNumLabel.font = [UIFont fontWithName:FONTNAME size:11.];
        _collectNumLabel.textColor = [UIColor grayColor];
    }
    return _collectNumLabel;
}
- (UIButton *)replyBtn {
    if (!_replyBtn) {
        _replyBtn = [[UIButton alloc] init];
        [_replyBtn setBackgroundImage:[UIImage imageNamed:@"reply"] forState:UIControlStateNormal];
        [_replyBtn setTitle:@"回复" forState:UIControlStateNormal];
        _replyBtn.titleLabel.font = [UIFont systemFontOfSize:15.];
        _replyBtn.titleLabel.textColor = [UIColor blackColor];
    }
    return _replyBtn;
}
- (UIButton *)likeBtn {
    if (!_likeBtn) {
        _likeBtn = [[UIButton alloc] init];
        [_likeBtn setBackgroundImage:[UIImage imageNamed:@"appreciate"] forState:UIControlStateNormal];
    }
    return _likeBtn;
}
- (UIButton *)shareBtn {
    if (!_shareBtn) {
        _shareBtn = [[UIButton alloc] init];
        [_shareBtn setBackgroundImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    }
    return _shareBtn;
}
- (UIButton *)collectBtn {
    if (!_collectBtn) {
        _collectBtn = [[UIButton alloc] init];
        [_collectBtn setBackgroundImage:[UIImage imageNamed:@"save"] forState:UIControlStateNormal];
    }
    return _collectBtn;
}

- (UIImageView *)userImageView {
    if (!_userImageView) {
        _userImageView = [[UIImageView alloc] init];
        _userImageView.image = [UIImage imageNamed: @"bgimg"];
    }
    return _userImageView;
}
@end
