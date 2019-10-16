//
//  ListViewModel.m
//  objcTestTask
//
//  Created by Искандер Фоатов on 16.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

#import "ListViewModel.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "EntityFactory.h"

@interface ListViewModel ()

@property (nonatomic, strong) id<NetworkLayerProtocol> networkLayer;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, assign) NSUInteger page;
@property (nonatomic, assign) BOOL isLoading;
@property (nonatomic, strong) NSArray<Entity *> *items;

@end

@implementation ListViewModel

- (instancetype)initWith:(id<NetworkLayerProtocol>)networkLayer code:(NSString *)code {
    self = [super init];
    if (self) {
        _networkLayer = networkLayer;
        _code = code;
        _page = 1;
        [self loadList];
    }
    return self;
}

- (void)loadList {
    if (self.isLoading) {
        return;
    }
    self.isLoading = true;
    @weakify(self);
    [self.networkLayer loadPageWithCount:self.page code:self.code completion:^(NSData *data, NSError *error) {
        if (error) {
            return;
        }
        NSArray *items = [EntityFactory entityFromDate:data];
        if (!items.count) {
            return;
        }
        @strongify(self);
        self.page += 1;
        NSMutableArray *result = [NSMutableArray arrayWithArray:self.items];
        [result addObjectsFromArray:items];
        self.items = [result copy];
        self.isLoading = false;
    }];
}

@end
