//
//  Login.h
//  objcTestTask
//
//  Created by Iskander Foatov on 14.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginView : UIView

@property (nonatomic, readonly) UITextField *userNameTextField;
@property (nonatomic, readonly) UITextField *passwordTextField;
@property (nonatomic, readonly) UIButton *loginButton;

- (void)setErrorMessage:(NSString*) message;
- (void)keyboardUpdateWith:(CGSize) size;

@end

NS_ASSUME_NONNULL_END
