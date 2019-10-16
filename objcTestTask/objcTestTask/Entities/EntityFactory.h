//
//  EntityFactory.h
//  objcTestTask
//
//  Created by Искандер Фоатов on 16.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entity.h"

NS_ASSUME_NONNULL_BEGIN

@interface EntityFactory : NSObject

+ (nullable NSArray<Entity *> *)entityFromDate:(NSData * _Nullable)data;
+ (nullable Entity *)entityFromDictiondary:(NSDictionary<NSString *, id> * _Nullable)dict;

@end

NS_ASSUME_NONNULL_END
