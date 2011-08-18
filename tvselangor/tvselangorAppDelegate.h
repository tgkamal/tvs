//
//  tvselangorAppDelegate.h
//  tvselangor
//
//  Created by TENGKU KAMAL FAIZAL on 8/13/11.
//  Copyright 2011 ILAUNCH SDN BHD. All rights reserved.
//

#import <UIKit/UIKit.h>


@class DetailViewController;
@class BlogRss;

@interface tvselangorAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
