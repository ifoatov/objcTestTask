//
//  EntityFactory.m
//  objcTestTask
//
//  Created by Искандер Фоатов on 16.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

#import "EntityFactory.h"
#import "Entity+Private.h"

@implementation EntityFactory

+ (nullable NSArray<Entity *> *)entityFromDate:(NSData * _Nullable)data {
    if (!data) {
        return [NSArray array];
    }
    NSError *error = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    if (error
        || !json) {
        return [NSArray array];
    }
    NSArray<NSDictionary<NSString *, id> *> *items = json[@"data"];
    NSMutableArray<Entity *> *result = [[NSMutableArray alloc] initWithCapacity:items.count];
    for (int i = 0; i < items.count; i++) {
        Entity *item = [EntityFactory entityFromDictiondary:item];
        if (item) {
            result[i] = item;
        }
    }
    return [result copy];
}

+ (nullable Entity *)entityFromDictiondary:(NSDictionary<NSString *, id> * _Nullable)dict {
    if (!dict) {
        return nil;
    }
    
    NSArray *properties = @[@"id", @"name", @"country", @"lat", @"lon"];
    for (NSInteger i = 0; i < properties.count; i++) {
        if (!dict[properties[i]]) {
            return nil;
        }
    }
    
    Entity *result = [Entity new];
    result.entityId = [dict valueForKey:@"id"] ? (NSString *)[dict valueForKey:@"id"] : @"";
    result.name = [dict valueForKey:@"name"] ? (NSString *)[dict valueForKey:@"name"] : @"";
    result.country = [dict valueForKey:@"country"] ? (NSString *)[dict valueForKey:@"country"] : @"";
    result.lat = [(NSNumber *)[dict valueForKey:@"lat"] doubleValue] ? [(NSNumber *)[dict valueForKey:@"lat"] doubleValue] : 0;
    result.lon = [(NSNumber *)[dict valueForKey:@"lot"] doubleValue] ? [(NSNumber *)[dict valueForKey:@"lot"] doubleValue] : 0;
    
    return result;
}

@end
