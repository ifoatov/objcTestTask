//
//  LoginViewProtocol.h
//  objcTestTask
//
//  Created by Iskander Foatov on 15.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

@protocol LoginViewProtocol <NSObject>

@property (nonatomic, strong) LoginPresentor *presentor;

- (void)showErrorMessage:(NSString *)message;

@end
