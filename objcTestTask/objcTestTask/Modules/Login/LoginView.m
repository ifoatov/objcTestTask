//
//  Login.m
//  objcTestTask
//
//  Created by Iskander Foatov on 14.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

#import "LoginView.h"
#import <Masonry/Masonry.h>
#import "Constants.h"

@interface LoginView()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextField *userNameTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UILabel *errorLabel;

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
    _userNameTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    _userNameTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _userNameTextField.placeholder = NSLocalizedString(@"login.username.placeholder", @"");
    
    _passwordTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    _passwordTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    _passwordTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _passwordTextField.placeholder = NSLocalizedString(@"login.password.placeholder", @"");
    
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
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.userNameTextField.mas_top).inset(Constants.topOffset);
    }];
    
    [_userNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).offset(Constants.topOffset * -4);
        make.left.right.equalTo(self).inset(Constants.doubleOffset);
    }];
    
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.left.right.equalTo(self.userNameTextField);
        make.top.equalTo(self.userNameTextField.mas_bottom).offset(Constants.doubleOffset);
    }];
    
    [_errorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordTextField.mas_bottom).offset(Constants.doubleOffset);
        make.centerX.equalTo(self);
    }];
    
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self).inset(Constants.topOffset);
    }];
}

- (void)keyboardUpdateWith:(CGSize) size {
    CGFloat offset = size.height == 0 ? Constants.topOffset : size.height + Constants.doubleOffset;
    [_loginButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).inset(offset);
    }];
}


@end
