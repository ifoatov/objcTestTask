//
//  ListViewController.h
//  objcTestTask
//
//  Created by Искандер Фоатов on 16.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ListViewController : UIViewController

@property (nonatomic, strong) ListViewModel *viewModel;

@end

NS_ASSUME_NONNULL_END
