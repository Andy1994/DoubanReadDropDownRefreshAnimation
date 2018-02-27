//
//  ViewController.m
//  DoubanReadDropDownRefreshAnimation
//
//  Created by wangwenbo on 2018/2/26.
//  Copyright © 2018年 wangwenbo. All rights reserved.
//

#import "ViewController.h"
#import "WBRefreshHeaderView.h"
#import "UIScrollView+WBRefresh.h"

@interface ViewController ()
@property (nonatomic, strong) WBRefreshHeaderView *headerView;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"豆瓣阅读刷新动画";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
    
    __weak typeof(self) weakSelf = self;
    self.headerView = [self.tableView addHeaderWithRefreshHandler:^(WBRefreshBaseView *refreshView) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.headerView endRefresh];
        });
    }];
    self.headerView.clockView = [WBClockView defaultClockView];
    self.headerView.backgroundColor = [UIColor colorWithRed:236.0 / 255.0 green:240.0 / 255.0 blue:242.0 / 255.0 alpha:1];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
        _tableView.backgroundColor = [UIColor colorWithRed:236.0 / 255.0 green:240.0 / 255.0 blue:242.0 / 255.0 alpha:1];
        _tableView.alwaysBounceVertical = YES;
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
