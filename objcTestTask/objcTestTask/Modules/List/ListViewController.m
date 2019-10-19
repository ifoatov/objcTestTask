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
@property (nonatomic, strong) NSMutableArray<Entity *> *items;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"login.logout.button.title", nil)
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:nil
                                                                             action:nil];
    self.items = [NSMutableArray array];
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
    [self.navigationItem rightBarButtonItem].rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        [[self viewModel] logOut];
        return [RACSignal empty];
    }];
    
    [RACObserve(self.viewModel, items) subscribeNext:^(NSArray<Entity *>  *_Nullable newItems) {
        if (!newItems.count) {
            return;
        }
        @strongify(self);
        // TODO use main reactive sheduler like ObserveOn: mainSheduler
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView performBatchUpdates:^{
                NSUInteger count = self.items.count;
                [self.items addObjectsFromArray:newItems];
                NSMutableArray *indexes = [NSMutableArray arrayWithCapacity:newItems.count];
                for (NSUInteger i = 0; i < newItems.count; i++) {
                    indexes[i] = [NSIndexPath indexPathForRow:count + i inSection:0];
                }
                [self.tableView insertRowsAtIndexPaths:[indexes copy] withRowAnimation:UITableViewRowAnimationRight];
            } completion:nil];
        });
    }];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath { 
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:tableViewCellKey];
    Entity *entity = self.items[indexPath.row];
    [cell configureWith:entity];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section { 
    return self.items.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.viewModel modelSelectedWith:self.items[indexPath.row]];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.items.count - 1) {
        [self.viewModel loadList];
    }
}

@end
