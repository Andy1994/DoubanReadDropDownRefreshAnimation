//
//  WBClockView.m
//  DoubanReadDropDownRefreshAnimation
//
//  Created by wangwenbo on 2018/2/27.
//  Copyright © 2018年 wangwenbo. All rights reserved.
//

#import "WBClockView.h"

#define WBClockViewSize 25.0
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

@interface WBClockView ()
@property (nonatomic, strong) UIView *clockContentView;
@property (nonatomic, strong) UIImageView *dialImageView;
@property (nonatomic, strong) UIImageView *hoursImageView;
@property (nonatomic, strong) UIImageView *secondsImageView;
@property (nonatomic, strong) UILabel *stateTextLabel;
@end

@implementation WBClockView

+ (instancetype)defaultClockView {
    WBClockView *clockView = [[WBClockView alloc] init];
    return clockView;
}

- (instancetype)init {
    if (self = [super initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 70)]) {
        [self addSubview:self.clockContentView];
        [self addSubview:self.stateTextLabel];
        [self.clockContentView addSubview:self.hoursImageView];
        [self.clockContentView addSubview:self.secondsImageView];
        [self.clockContentView addSubview:self.dialImageView];
    }
    return self;
}

- (UIView *)clockContentView {
    if (!_clockContentView) {
        _clockContentView = [[UIView alloc] initWithFrame:CGRectMake((ScreenWidth - WBClockViewSize) / 2, 10, WBClockViewSize, WBClockViewSize)];
        [_clockContentView setUserInteractionEnabled:NO];
    }
    return _clockContentView;
}

- (UIImageView *)dialImageView {
    if (!_dialImageView) {
        _dialImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WBClockViewSize, WBClockViewSize)];
        _dialImageView.image = [UIImage imageNamed:@"dial"];
    }
    return _dialImageView;
}

- (UIImageView *)hoursImageView {
    if (!_hoursImageView) {
        _hoursImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WBClockViewSize, WBClockViewSize / 2)];
        _hoursImageView.image = [UIImage imageNamed:@"hours"];
        _hoursImageView.layer.anchorPoint = CGPointMake(0.5, 1);
        _hoursImageView.layer.position = CGPointMake(WBClockViewSize / 2, WBClockViewSize / 2);
    }
    return _hoursImageView;
}

- (UIImageView *)secondsImageView {
    if (!_secondsImageView) {
        _secondsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WBClockViewSize, WBClockViewSize / 2)];
        _secondsImageView.image = [UIImage imageNamed:@"seconds"];
        _secondsImageView.layer.anchorPoint = CGPointMake(0.5, 1);
        _secondsImageView.layer.position = CGPointMake(WBClockViewSize / 2, WBClockViewSize / 2);
    }
    return _secondsImageView;
}

- (UILabel *)stateTextLabel {
    if (!_stateTextLabel) {
        UIFont *font = [UIFont systemFontOfSize:14];
        _stateTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, WBClockViewSize + 10 * 2, ScreenWidth, font.lineHeight)];
        _stateTextLabel.textAlignment = NSTextAlignmentCenter;
        _stateTextLabel.textColor = [UIColor colorWithRed:177.0 / 255.0 green:198.0 / 255.0 blue:206.0 / 255.0 alpha:1];
        _stateTextLabel.font = font;
    }
    return _stateTextLabel;
}

- (void)setStateText:(NSString *)stateText {
    _stateText = stateText;
    self.stateTextLabel.text = _stateText;
}

- (void)rotationWithScrollViewContentOffSetY:(CGFloat)contentOffSetY {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [calendar components:NSCalendarUnitMinute | NSCalendarUnitHour fromDate:[NSDate date]];
    
    CGAffineTransform secondsImageViewOldTransform = CGAffineTransformRotate(CGAffineTransformIdentity, (CGFloat)comps.minute / 60.0 * M_PI * 2);
    CGAffineTransform secondsImageViewTransform = CGAffineTransformRotate(secondsImageViewOldTransform, contentOffSetY / -60.0 * M_PI * 2);
    self.secondsImageView.transform = secondsImageViewTransform;
    
    
    CGAffineTransform hoursImageViewOldTransform = CGAffineTransformRotate(CGAffineTransformIdentity, (CGFloat)(comps.hour >= 12 ? comps.hour - 12 : comps.hour) / 12.0 * M_PI * 2);
    CGAffineTransform hoursImageViewTransform = CGAffineTransformRotate(hoursImageViewOldTransform, contentOffSetY / -60 / 12.0 * M_PI * 2);
    self.hoursImageView.transform = hoursImageViewTransform;
}

@end
