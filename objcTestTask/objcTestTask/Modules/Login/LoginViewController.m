//
//  LoginViewController.m
//  objcTestTask
//
//  Created by Iskander Foatov on 14.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"

@interface LoginViewController ()

@property (nonatomic, readonly) LoginView *loginView;

@end

@implementation LoginViewController

@synthesize presentor;

- (void)loadView {
    LoginView *myView = [[LoginView alloc] initWithFrame:CGRectZero];
    self.view = myView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc]
                                     initWithTarget:self
                                     action:@selector(tapRecognizeWith:)]];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardChangeWith:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                            selector:@selector(keyboardChangeWith:)
                                                name:UIKeyboardDidHideNotification
                                              object:nil];
    [self.loginView.loginButton addTarget:self
                                   action:@selector(login)
                         forControlEvents:UIControlEventTouchDown];
}

- (LoginView *) loginView {
    return (LoginView *)self.view;
}

- (void)tapRecognizeWith:(id *) sender {
    [self.view endEditing:true];
}

- (void)keyboardChangeWith:(NSNotification *) notification {
    if (notification.name == UIKeyboardDidHideNotification) {
        [self.loginView keyboardUpdateWith:CGSizeZero];
        return;
    }
    CGRect keyboardRect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    keyboardRect = [self.view convertRect:keyboardRect fromView:nil];
    [self.loginView keyboardUpdateWith:keyboardRect.size];
}

- (void)showErrorMessage:(NSString *)message {
    [self.loginView setErrorMessage:message];
}

- (void)login {
    NSString *userName = self.loginView.userNameTextField.text;
    NSString *password = self.loginView.passwordTextField.text;
    [self.presentor loginWith:userName password:password];
}

@end
