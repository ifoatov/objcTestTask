//
//  FakeDataProvider.h
//  objcTestTask
//
//  Created by Iskander Foatov on 14.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataProvider.h"


@interface FakeDataProvider: NSObject<DataProvider>

- (instancetype)initWith:(NSUserDefaults *)defaults;

@end
