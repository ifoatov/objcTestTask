//
//  DataProvider.h
//  objcTestTask
//
//  Created by Iskander Foatov on 14.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataProvider <NSObject>

- (nullable NSString *)getCode;
- (void)setCode:(NSString * _Nullable)code;

@end
