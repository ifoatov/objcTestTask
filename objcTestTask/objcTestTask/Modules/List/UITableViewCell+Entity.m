//
//  UITableViewCell+Entity.m
//  objcTestTask
//
//  Created by Iskander Foatov on 17.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

#import "UITableViewCell+Entity.h"
#import "Entity.h"
#import <ReactiveObjC/ReactiveObjC.h>

@implementation UITableViewCell (Entity)

- (void)configureWith:(Entity *)entity {
    int tagId = [entity.entityId intValue];
    self.tag = tagId;
    self.textLabel.text = entity.name;
    self.detailTextLabel.text = entity.country;
    if (entity.image) {
        self.imageView.image = entity.image;
        return;
    }
    
    self.imageView.image = [UIImage imageNamed:@"placeholder"];
    NSURL *url = [NSURL URLWithString:@"http://lorempixel.com/200/200/"];
    @weakify(entity);
    @weakify(self);
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!data) {
            return;
        }
        UIImage *image = [UIImage imageWithData:data];
        if (!image) {
            return;
        }
        @strongify(entity);
        entity.image = image;
        @strongify(self);
        dispatch_async(dispatch_get_main_queue(), ^{
            if (image && self.tag == tagId) {
                self.imageView.image = image;
                [self setNeedsLayout];
            }
        });
    }] resume];
}

@end
