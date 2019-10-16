//
//  ListCoordinator.m
//  objcTestTask
//
//  Created by Искандер Фоатов on 16.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

#import "ListCoordinator.h"

@interface ListCoordinator ()

@property (nonatomic, strong) UINavigationController *navController;

@end

@implementation ListCoordinator

- (instancetype) initWith:(UINavigationController *)navController {
    self = [super init];
    if (self) {
        _navController = navController;
    }
    return self;
}


- (NSString *)identificator {
    return @"AppCoordinator";
}

- (void) start {
    
}

@end
