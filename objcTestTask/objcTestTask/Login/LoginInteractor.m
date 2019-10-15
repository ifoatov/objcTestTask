//
//  LoginInteractor.m
//  objcTestTask
//
//  Created by Iskander Foatov on 14.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

#import "LoginInteractor.h"
#import "LoginPresentor.h"

@interface LoginInteractor ()

@property (nonatomic, strong) id<NetworkLayerProtocol> networkLayer;
@property (nonatomic, strong) id<DataProvider> dataProvider;

@end

@implementation LoginInteractor

- (instancetype)initWith:(id<NetworkLayerProtocol>)networkLayer dataProvider:(id<DataProvider>) dataProvider {
    self = [super init];
    if (self) {
        _networkLayer = networkLayer;
        _dataProvider = dataProvider;
    }
    return self;
}

- (void)loginWith:(NSString *)userName password:(NSString *)password {
    if (!userName.length && !password.length) {
            [self.presentor showError];
            return;
        }
    __weak LoginInteractor *weakSelf = self;
    [self.networkLayer loginWith:userName password:password completion:^(NSData *data, NSError *error) {
        if (!weakSelf) {
            return;
        }
        __strong LoginInteractor *strongSelf = weakSelf;
        if (error
            || !data) {
            [strongSelf.presentor showError];
        }
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        NSString *code = [json objectForKey:@"code"];
        
        if (!code
            && code.length > 0) {
            [strongSelf.dataProvider setCode:code];
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
              [[weakSelf presentor] showError];
            });
        }
    }];
}

@end
