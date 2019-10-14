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
                                             selector:@selector(keyboardAppearWith:)
                                                 name:UIKeyboardDidChangeFrameNotification
                                               object:nil];
}

- (LoginView *) loginView {
    return (LoginView *)self.view;
}

- (void)tapRecognizeWith:(id *) sender {
    [self.view endEditing:true];
}

- (void)keyboardAppearWith:(NSNotification *) notification {
    CGRect keyboardRect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    keyboardRect = [self.view convertRect:keyboardRect fromView:nil];
    [self.loginView keyboardUpdateWith:keyboardRect.size];
}

@end
