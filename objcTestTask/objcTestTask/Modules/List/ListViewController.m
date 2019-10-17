//
//  ListViewController.m
//  objcTestTask
//
//  Created by Искандер Фоатов on 16.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

#import "ListViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>

NSString *tableViewCellKey = @"listTableCell";

@interface ListViewController ()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:tableViewCellKey];
    
    [self.view addSubview:self.tableView];
}

- (void)setupRx {
    
}

@end
