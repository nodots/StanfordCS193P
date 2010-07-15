//
//  HelloPolyAppDelegate.h
//  HelloPoly
//
//  Created by Ken Riley on 7/13/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Controller.h"

@interface HelloPolyAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	IBOutlet Controller *polyController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;


- (void) saveStatus;


@end

