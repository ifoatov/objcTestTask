//
//  AppCoordinator.h
//  objcTestTask
//
//  Created by Iskander Foatov on 15.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataProvider.h"
#import "NetworkLayerProtocol.h"

@protocol Coordinator <NSObject>

- (void)start;

@end

NS_ASSUME_NONNULL_BEGIN

@interface AppCoordinator : NSObject<Coordinator>

- (instancetype)initWith:(id<DataProvider>) dataProvider networkLayer:(id<NetworkLayerProtocol>) networkLayer;

@end

NS_ASSUME_NONNULL_END
