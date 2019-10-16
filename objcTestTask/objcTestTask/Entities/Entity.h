//
//  Entity.h
//  objcTestTask
//
//  Created by Искандер Фоатов on 16.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Entity : NSObject

@property (nonatomic, readonly) NSString *entityId;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *country;
@property (nonatomic, readonly) double lat;
@property (nonatomic, readonly) double lon;

@end

NS_ASSUME_NONNULL_END
