//
//  NetworkDecorator.h
//  objcTestTask
//
//  Created by Iskander Foatov on 14.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^LoginCallback)(NSData * _Nullable, NSError * _Nullable);
typedef void(^PageLooadingCallback)(NSData * _Nullable, NSError * _Nullable);

@protocol NetworkLayerProtocol <NSObject>

- (void)loginWith:(nonnull NSString *)userName password:(nonnull NSString *)password completion:(nonnull LoginCallback) completion;
- (void)loadPageWithCount:(NSUInteger)page code:(nonnull NSString *)code completion:(nonnull PageLooadingCallback)completion;


@end


