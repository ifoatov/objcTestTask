//
//  ListViewModel.h
//  objcTestTask
//
//  Created by Искандер Фоатов on 16.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkLayerProtocol.h"
#import "ListViewController.h"
#import "Entity.h"

NS_ASSUME_NONNULL_BEGIN

@interface ListViewModel : NSObject

@property (nonatomic, weak) ListViewController *view;
@property (nonatomic, readonly) BOOL isLoading;
@property (nonatomic, readonly) NSArray<Entity *> *items;

- (instancetype)initWith:(id<NetworkLayerProtocol>)networkLayer code:(NSString *)code;

@end

NS_ASSUME_NONNULL_END
