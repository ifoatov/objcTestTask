//
//  FakeDataProvider.m
//  objcTestTask
//
//  Created by Iskander Foatov on 14.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

#import "FakeDataProvider.h"

@interface FakeDataProvider()

@property (nonatomic, strong) NSUserDefaults *storage;

@end

@implementation FakeDataProvider

- (instancetype)initWith:(NSUserDefaults *)defaults {
    self = [super init];
    if (self) {
        self.storage = defaults;
    }
    return self;
}

- (nullable NSString *)getCode {
    return [self.storage stringForKey:@"code"];
}

- (void)setCode:(NSString *)code {
    [self.storage setValue:code forKey:@"code"];
}

@end
