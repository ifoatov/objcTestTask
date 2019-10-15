//
//  LoginInteractor.h
//  objcTestTask
//
//  Created by Iskander Foatov on 14.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkLayerProtocol.h"
#import "DataProvider.h"

@class LoginPresentor;

NS_ASSUME_NONNULL_BEGIN

@interface LoginInteractor : NSObject

@property (nonatomic, weak) LoginPresentor *presentor;

- (instancetype)initWith:(id<NetworkLayerProtocol>)networkLayer dataProvider:(id<DataProvider>) dataProvider;
- (void)loginWith:(NSString *)userName password:(NSString *)password;

@end

NS_ASSUME_NONNULL_END
