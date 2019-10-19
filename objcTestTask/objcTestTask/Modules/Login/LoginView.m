//
//  Login.m
//  objcTestTask
//
//  Created by Iskander Foatov on 14.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

#import "LoginView.h"
#import "Constants.h"

@interface LoginView()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextField *userNameTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UILabel *errorLabel;
@property (nonatomic, strong) NSLayoutConstraint *loginButtonBottomConstraint;

@end

@implementation LoginView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureUI];
        [self setupConstraints];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self configureUI];
        [self setupConstraints];
    }
    return self;
}

- (void)setErrorMessage:(NSString*) message {
    self.errorLabel.text = message;
}

- (void)configureUI {
    self.backgroundColor = UIColor.whiteColor;
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _titleLabel.text = NSLocalizedString(@"login.login.button.title", @"");
    
    _userNameTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    _userNameTextField.font = [UIFont systemFontOfSize:20];
    _userNameTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    _userNameTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _userNameTextField.placeholder = NSLocalizedString(@"login.username.placeholder", @"");
    
    _passwordTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    _passwordTextField.font = [UIFont systemFontOfSize:20];
    _passwordTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    _passwordTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _passwordTextField.placeholder = NSLocalizedString(@"login.password.placeholder", @"");
    _passwordTextField.secureTextEntry = true;
    
    _loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_loginButton setTitle:NSLocalizedString(@"login.login.button.title", @"") forState:UIControlStateNormal];
    
    _errorLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    
    [self addSubview:_titleLabel];
    [self addSubview:_userNameTextField];
    [self addSubview:_passwordTextField];
    [self addSubview:_loginButton];
    [self addSubview:_errorLabel];
}

- (void)setupConstraints {

    self.translatesAutoresizingMaskIntoConstraints = false;
    _titleLabel.translatesAutoresizingMaskIntoConstraints = false;
    _userNameTextField.translatesAutoresizingMaskIntoConstraints = false;
    _passwordTextField.translatesAutoresizingMaskIntoConstraints = false;
    _errorLabel.translatesAutoresizingMaskIntoConstraints = false;
    _loginButton.translatesAutoresizingMaskIntoConstraints = false;
    
    [NSLayoutConstraint constraintWithItem:_titleLabel
                                  attribute:NSLayoutAttributeCenterX
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self
                                  attribute:NSLayoutAttributeCenterX
                                 multiplier:1
                                   constant:0].active = true;
    [NSLayoutConstraint constraintWithItem:_titleLabel
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:_userNameTextField
                                 attribute:NSLayoutAttributeTop
                                multiplier:1
                                  constant:-Constants.topOffset].active = true;
    
    [NSLayoutConstraint constraintWithItem:_userNameTextField
                                 attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self
                                 attribute:NSLayoutAttributeCenterY
                                multiplier:1
                                  constant:Constants.topOffset * -4].active = true;
    [NSLayoutConstraint constraintWithItem:_userNameTextField
                                 attribute:NSLayoutAttributeLeading
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self
                                 attribute:NSLayoutAttributeLeading
                                multiplier:1
                                  constant:Constants.doubleOffset].active = true;
    [NSLayoutConstraint constraintWithItem:_userNameTextField
                                 attribute:NSLayoutAttributeTrailing
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self
                                 attribute:NSLayoutAttributeTrailing
                                multiplier:1
                                  constant:-Constants.doubleOffset].active = true;
    
    [NSLayoutConstraint constraintWithItem:_passwordTextField
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:_userNameTextField
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1
                                  constant:Constants.doubleOffset].active = true;
    [NSLayoutConstraint constraintWithItem:_passwordTextField
                                 attribute:NSLayoutAttributeLeading
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:_userNameTextField
                                 attribute:NSLayoutAttributeLeading
                                multiplier:1
                                  constant:0].active = true;
    [NSLayoutConstraint constraintWithItem:_passwordTextField
                                 attribute:NSLayoutAttributeTrailing
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:_userNameTextField
                                 attribute:NSLayoutAttributeTrailing
                                multiplier:1
                                  constant:0].active = true;
    
    [NSLayoutConstraint constraintWithItem:_errorLabel
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:_passwordTextField
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1
                                  constant:Constants.doubleOffset].active = true;
    [NSLayoutConstraint constraintWithItem:_errorLabel
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1
                                  constant:0].active = true;
    
    _loginButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:_loginButton
                                  attribute:NSLayoutAttributeBottom
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self
                                  attribute:NSLayoutAttributeBottom
                                 multiplier:1
                                   constant:-Constants.doubleOffset];
    _loginButtonBottomConstraint.active = true;
    [NSLayoutConstraint constraintWithItem:_loginButton
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1
                                  constant:0].active = true;
     
}

- (void)keyboardUpdateWith:(CGSize) size {
    CGFloat offset = size.height == 0 ? Constants.topOffset : size.height + Constants.doubleOffset;
    self.loginButtonBottomConstraint.constant = -offset;
}


@end
