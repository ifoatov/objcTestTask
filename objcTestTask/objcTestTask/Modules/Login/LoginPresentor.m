//
//  LoginPresentor.m
//  objcTestTask
//
//  Created by Iskander Foatov on 14.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

#import "LoginPresentor.h"

@implementation LoginPresentor

- (void)loginWith:(NSString *) username password:(NSString *)password {
    [self.interactor loginWith:username password:password];
}

- (void)showError {
    [self.view showErrorMessage:@"Invalig login/password"];
}

- (void)loginedWithCode:(NSString *)code {
    [self.navigation loginedWith:code];
}

@end
