//
//  ListNavigationProtocol.h
//  objcTestTask
//
//  Created by Iskander Foatov on 17.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

@class Entity;

@protocol ListNavigationProtocol

- (void)showInfoWith:(Entity *)entity;
- (void)logOut;

@end
