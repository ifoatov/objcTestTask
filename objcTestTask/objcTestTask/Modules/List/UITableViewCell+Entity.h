//
//  UITableViewCell.h
//  objcTestTask
//
//  Created by Iskander Foatov on 17.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Entity;

@interface UITableViewCell (Entity)

- (void)configureWith:(Entity *)entity;

@end
