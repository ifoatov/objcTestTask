//
//  AppDelegate.m
//  objcTestTask
//
//  Created by Iskander Foatov on 14.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"

@interface AppDelegate ()

@property (nonatomic, readwrite, strong) UIWindow *mainWindow;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    _mainWindow = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    _mainWindow.rootViewController = [[LoginViewController alloc] init];
    [_mainWindow makeKeyAndVisible];
    return YES;
}

@end
