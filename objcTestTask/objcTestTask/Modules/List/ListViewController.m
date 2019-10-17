//
//  ListViewController.m
//  objcTestTask
//
//  Created by Искандер Фоатов on 16.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

#import "ListViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "Entity.h"
#import "UITableViewCell+Entity.h"

NSString *tableViewCellKey = @"listTableCell";

@interface ListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView registerClass:UITableViewCell.class
           forCellReuseIdentifier:tableViewCellKey];
    
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self setupRx];
}

- (void)setupRx {
    @weakify(self)
    [RACObserve(self.viewModel, items) subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        // TODO use main reactive sheduler like ObserveOn: mainSheduler
        dispatch_async(dispatch_get_main_queue(), ^{
           [self.tableView reloadData];
        });
    }];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath { 
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:tableViewCellKey];
    Entity *entity = self.viewModel.items[indexPath.row];
    [cell configureWith:entity];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section { 
    return self.viewModel.items.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.viewModel modelSelectedWith:indexPath.row];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.viewModel.items.count - 1) {
        [self.viewModel loadList];
    }
}

@end
