//
//  AppCoordinator.m
//  objcTestTask
//
//  Created by Iskander Foatov on 15.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

#import "AppCoordinator.h"
#import "LoginPresentor.h"
#import "LoginInteractor.h"
#import "LoginViewController.h"
#import "ListViewController.h"
#import "ListViewModel.h"

@interface AppCoordinator ()

@property (nonatomic, strong) UIWindow *mainWindow;
@property (nonatomic, strong) UINavigationController *navController;
@property (nonatomic, strong) id<DataProvider> dataProvider;
@property (nonatomic, strong) id<NetworkLayerProtocol> networkLayer;

@end

@implementation AppCoordinator

- (instancetype)initWith:(id<DataProvider>) dataProvider networkLayer:(id<NetworkLayerProtocol>) networkLayer {
    self = [super init];
    if (self) {
        _mainWindow = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
        _navController = [UINavigationController new];
        _dataProvider = dataProvider;
        _networkLayer = networkLayer;
    }
    return self;
}

- (NSString *)identificator {
    return @"AppCoordinator";
}

- (void)start {
    [self.mainWindow makeKeyAndVisible];
    NSString *code = [self.dataProvider getCode];
    if (code.length) {
        [self presentListStackWith:code];
    } else {
        [self presentLoginStack];
    }
}

- (void)presentLoginStack {
    LoginViewController *controller = [LoginViewController new];
    LoginPresentor *presentor = [LoginPresentor new];
    LoginInteractor *interactor = [[LoginInteractor alloc] initWith:self.networkLayer dataProvider:self.dataProvider];

    controller.presentor = presentor;
    presentor.view = controller;
    presentor.interactor = interactor;
    presentor.navigation = self;
    interactor.presentor = presentor;
    [self.mainWindow setRootViewController:controller];
}

- (void)presentListStackWith:(NSString *)code {
    ListViewController *controller = [ListViewController new];
    ListViewModel *viewModel = [[ListViewModel alloc] initWith:self.networkLayer code:code];
    controller.viewModel = viewModel;
    viewModel.view = controller;
    [self.navController pushViewController:controller animated:false];
    
    [self.mainWindow setRootViewController:self.navController];
}

- (void)loginedWith:(NSString *) code {
    [self presentListStackWith:code];
}

@end
