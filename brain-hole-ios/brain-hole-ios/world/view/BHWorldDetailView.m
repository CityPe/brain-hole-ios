//
//  BHWorldDetailView.m
//  brain-hole-ios
//
//  Created by Chen on 2017/11/28.
//  Copyright © 2017年 Xihe. All rights reserved.
//

#import "BHWorldDetailView.h"
#import "BHWorldDetailModel.h"
#import <Masonry/Masonry.h>
const static CGFloat HEAD_IMAGE_HEIGHT      =       80;
const static CGFloat SMALL_ICON_HEIGHT      =       15;
const static CGFloat MARGIN_X               =       10;
const static CGFloat SMALL_LABEL_WIDTH      =       30;
static NSString *FONTNAME                   =       @"PINGFANGTC-Thin";
static NSString *FONTNAME_TITLE             =       @"PINGFANGTC-Regular";
@interface BHWorldDetailView ()

@property (nonatomic, strong) UIImageView *headImage;
@property (nonatomic, strong) UIImageView *bgImage;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIButton *replyBtn;
@property (nonatomic, strong) UIButton *likeBtn;
@property (nonatomic, strong) UIButton *collectBtn;
@property (nonatomic, strong) UIButton *shareBtn;
@property (nonatomic, strong) UILabel *replyNumLabel;
@property (nonatomic, strong) UILabel *likeNumLabel;
@property (nonatomic, strong) UILabel *collectNumLabel;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *scrollImage;

@end

@implementation BHWorldDetailView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
//        self.layer.borderColor = [[UIColor lightGrayColor] CGColor];
//        self.layer.borderWidth = 0.5;
        [self configView];
    }
    return self;
}

- (void)configView {
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.headImage];
    [self addSubview:self.shareBtn];
    [self addSubview:self.bgImage];
    [self addSubview:self.nameLabel];
    [self addSubview:self.lineView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.detailLabel];
    [self addSubview:self.scrollView];
    [self addSubview:self.replyBtn];
    [self addSubview:self.likeBtn];
    [self addSubview:self.collectBtn];
    [self.scrollView addSubview:self.scrollImage];
    [self addSubview:self.replyNumLabel];
    [self addSubview:self.likeNumLabel];
    [self addSubview:self.collectNumLabel];
    [self.bgImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self);
    }];
    
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(MARGIN_X);
        make.left.equalTo(self.mas_left).offset(MARGIN_X);
        make.height.equalTo(@(HEAD_IMAGE_HEIGHT));
        make.width.equalTo(@(HEAD_IMAGE_HEIGHT));
    }];
    
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImage.mas_top);
        make.right.equalTo(self.mas_right).offset(-MARGIN_X);
        make.height.equalTo(@(SMALL_ICON_HEIGHT));
        make.width.equalTo(@(SMALL_ICON_HEIGHT));
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.headImage.mas_centerY);
        make.height.equalTo(@20);
        make.width.equalTo(@200);
        make.centerX.equalTo(self.mas_centerX);
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImage.mas_bottom).offset(MARGIN_X);
        make.width.equalTo(@100);
        make.centerX.equalTo(self.mas_centerX);
        make.height.equalTo(@0.);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImage.mas_left);
        make.right.equalTo(self.mas_right).offset(-MARGIN_X);
        make.height.equalTo(@40);
        make.top.equalTo(self.lineView.mas_bottom).offset(MARGIN_X);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.width.equalTo(@250);
        make.centerX.equalTo(self.mas_centerX);
        make.height.equalTo(@150);
    }];
    
    [self.replyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).offset(-MARGIN_X);
        make.left.equalTo(self.mas_left).offset(MARGIN_X);
        make.height.equalTo(@(SMALL_ICON_HEIGHT));
        make.width.equalTo(@(SMALL_ICON_HEIGHT));
    }];
    [self.replyNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.replyBtn.mas_right).offset(2);
        make.top.bottom.equalTo(self.replyBtn);
        make.width.equalTo(@(SMALL_LABEL_WIDTH)) ;
    }];
    
    [self.likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.replyBtn.mas_bottom);
        make.height.equalTo(@(SMALL_ICON_HEIGHT));
        make.width.equalTo(@(SMALL_ICON_HEIGHT));
        make.centerX.equalTo(self.mas_centerX);
    }];
    [self.likeNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.likeBtn.mas_right).offset(2);
        make.width.equalTo(@(SMALL_LABEL_WIDTH));
        make.top.bottom.equalTo(self.likeBtn);
    }];
    [self.collectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(SMALL_ICON_HEIGHT));
        make.width.equalTo(@(SMALL_ICON_HEIGHT));
        make.right.equalTo(self.collectNumLabel.mas_left).offset(-2);
        make.top.equalTo(self.collectNumLabel);
    }];
    [self.collectNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-MARGIN_X);
        make.width.equalTo(@(SMALL_LABEL_WIDTH));
        make.top.equalTo(self.likeBtn.mas_top);
        make.bottom.equalTo(self.likeBtn.mas_bottom);
    }];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.detailLabel.mas_bottom);
        make.bottom.equalTo(self.collectBtn.mas_top).offset(-10);
        make.right.left.equalTo(self.titleLabel);
    }];
    [self.scrollImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.scrollView);
    }];
}

#pragma mark - Accessor

- (UIImageView *)headImage {
    if (!_headImage) {
        _headImage = [[UIImageView alloc] init];
        _headImage.image = [UIImage imageNamed:@"Card_like_1"];
        _headImage.layer.cornerRadius = HEAD_IMAGE_HEIGHT / 2;
        _headImage.clipsToBounds = YES;
    }
    return _headImage;
}

- (UIImageView *)bgImage {
    if (!_bgImage) {
        _bgImage = [[UIImageView alloc] init];
    }
    return _bgImage;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.text = @"阿尔伯特·爱因斯坦";
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.font = [UIFont fontWithName:FONTNAME_TITLE size:17.];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _nameLabel;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor grayColor];
    }
    return _lineView;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont fontWithName:FONTNAME_TITLE size:25.];
        _titleLabel.text = @"当诗歌撕破了时光的衣衫";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
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

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        
    }
    return _scrollView;
}
-(UIImageView *)scrollImage {
    if (!_scrollImage) {
        _scrollImage = [[UIImageView alloc] init];
        _scrollImage.image = [UIImage imageNamed:@"bgimg"];
    }
    return _scrollImage;
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
        _collectNumLabel.text = @"23w";
        _collectNumLabel.font = [UIFont fontWithName:FONTNAME size:11.];
        _collectNumLabel.textColor = [UIColor grayColor];
    }
    return _collectNumLabel;
}

@end
