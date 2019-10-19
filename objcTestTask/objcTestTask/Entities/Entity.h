//
//  Entity.h
//  objcTestTask
//
//  Created by Искандер Фоатов on 16.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Entity : NSObject

@property (nonatomic, strong) NSString *entityId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, assign) double lat;
@property (nonatomic, assign) double lon;
@property (nonatomic, nullable, strong) UIImage *image;

@end

NS_ASSUME_NONNULL_END
