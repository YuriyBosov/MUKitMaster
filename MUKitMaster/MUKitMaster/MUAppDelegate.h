//
//  MUAppDelegate.h
//  MUKitMaster
//
//  Created by Yuriy Bosov on 1/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MUViewController;

@interface MUAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MUViewController *viewController;

@end
