//
//  WBRefreshHeaderView.h
//  上下拉刷新
//
//  Created by Double on 15/9/27.
//  Copyright (c) 2015年 wdabo. All rights reserved.
//

#import "WBRefreshBaseView.h"
#import "WBClockView.h"

@interface WBRefreshHeaderView : WBRefreshBaseView

@property (nonatomic, strong) WBClockView *clockView;

+ (instancetype)headerWithRefreshHandler:(WBRefreshedHandler)refreshHandler;

@end
