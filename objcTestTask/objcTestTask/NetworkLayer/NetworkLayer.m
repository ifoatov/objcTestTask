//
//  NetworkLayer.m
//  objcTestTask
//
//  Created by Iskander Foatov on 14.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

#import "NetworkLayer.h"

@implementation NetworkLayer

- (instancetype)init {
    self = [super init];
    
    return self;
}

- (void)loginWith:(NSString *)userName password:(NSString *)password completion:(LoginCallback) completion {
    NSString *urlString = [NSString stringWithFormat:@"http://www.alarstudios.com/test/auth.cgi?username=%@&password=%@", userName, password];
    [[NSURLSession.sharedSession dataTaskWithURL:[NSURL URLWithString:urlString]
                               completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (completion) {
            completion(data, error);
        }
    }] resume];
}

- (void)loadPageWithCount:(NSUInteger)page code:(nonnull NSString *)code completion:(nonnull PageLooadingCallback)completion {
    NSString *urlString = [NSString stringWithFormat:@"http://www.alarstudios.com/test/data.cgi?page=%lu&code=%@", (unsigned long)page, code];
    [[NSURLSession.sharedSession dataTaskWithURL:[NSURL URLWithString:urlString]
                               completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (completion) {
            completion(data, error);
        }
    }] resume];
}




@end
