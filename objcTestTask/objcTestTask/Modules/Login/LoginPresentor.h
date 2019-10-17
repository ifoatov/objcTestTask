//
//  LoginPresentor.h
//  objcTestTask
//
//  Created by Iskander Foatov on 14.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginInteractor.h"
#import "LoginViewProtocol.h"
#import "LoginNavigationProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginPresentor : NSObject

@property (nonatomic, strong) LoginInteractor *interactor;
@property (nonatomic, weak) id<LoginViewProtocol> view;
@property (nonatomic, weak) id<LoginNavigationProtocol> navigation;

- (void)loginWith:(NSString *) username password:(NSString *)password;
- (void)showError;
- (void)loginedWithCode:(NSString *)code;

@end

NS_ASSUME_NONNULL_END
