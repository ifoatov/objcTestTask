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
    NSString *code = [self.dataProvider getCode];
    if (!code.length) {
        self.mainWindow.rootViewController = self.navController;
        
        
    } else {
        LoginViewController *controller = [LoginViewController new];
        LoginPresentor *presentor = [LoginPresentor new];
        LoginInteractor *interactor = [[LoginInteractor alloc] initWith:self.networkLayer dataProvider:self.dataProvider];
        
        controller.presentor = presentor;
        presentor.view = controller;
        presentor.interactor = interactor;
        interactor.presentor = presentor;
        self.mainWindow.rootViewController = controller;
    }
    [self.mainWindow makeKeyAndVisible];
}

@end
