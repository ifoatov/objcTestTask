//
//  ListCoordinator.h
//  objcTestTask
//
//  Created by Искандер Фоатов on 16.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AppCoordinator.h"

NS_ASSUME_NONNULL_BEGIN

@interface ListCoordinator : NSObject<Coordinator>

- (instancetype)initWith:(UINavigationController *)navController;

@end

NS_ASSUME_NONNULL_END
