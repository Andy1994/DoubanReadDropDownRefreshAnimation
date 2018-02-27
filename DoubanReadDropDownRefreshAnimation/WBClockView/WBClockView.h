//
//  WBClockView.h
//  DoubanReadDropDownRefreshAnimation
//
//  Created by wangwenbo on 2018/2/27.
//  Copyright © 2018年 wangwenbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WBClockView : UIView

@property (nonatomic, copy) NSString *stateText;

+ (instancetype)defaultClockView;

- (void)rotationWithScrollViewContentOffSetY:(CGFloat)contentOffSetY;

@end
