//
//  PaparazziAppDelegate.h
//  Paparazzi
//
//  Created by Ken Riley on 7/24/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaparazziAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UITabBarController *tabBarController;
	UINavigationController *contactsNavController;
	UINavigationController *recentsNavController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

