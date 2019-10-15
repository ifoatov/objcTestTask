//
//  AppDelegate.m
//  objcTestTask
//
//  Created by Iskander Foatov on 14.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

#import "AppDelegate.h"
#import "AppCoordinator.h"
#import "FakeDataProvider.h"
#import "NetworkLayer.h"

@interface AppDelegate ()

@property(nonatomic, strong) AppCoordinator *coordinator;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.coordinator = [[AppCoordinator alloc] initWith:[[FakeDataProvider alloc] initWith:NSUserDefaults.standardUserDefaults]
                                           networkLayer:[NetworkLayer new]];
    [self.coordinator start];
    return YES;
}

@end
