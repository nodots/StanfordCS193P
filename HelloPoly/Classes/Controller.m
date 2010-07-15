//
//  Controller.m
//
//  Created by Ken Riley on 7/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Controller.h"

@implementation Controller


- (void)awakeFromNib {
	[self initSides];
}

- (IBAction)increase {
	NSLog(@"Increase pressed");
	if ([polygon numberOfSides] < [polygon maximumNumberOfSides]) {
		polygon.numberOfSides += 1;
	}
	[self updateInterface];
}

- (IBAction)decrease {
	NSLog(@"Decrease pressed");
	if ([polygon numberOfSides] > [polygon minimumNumberOfSides]) {
		polygon.numberOfSides -= 1;
	}
	[self updateInterface];
}

- (IBAction)updateInterface {

	NSLog(@"updateInterface");
	numberOfSidesLabel.text = [NSString stringWithFormat:@"%d", polygon.numberOfSides];
	
	if ([polygon numberOfSides] == [polygon maximumNumberOfSides]) {
		increaseButton.enabled = NO;
	} else if ([polygon numberOfSides] == [polygon minimumNumberOfSides]) {
		decreaseButton.enabled = NO;
	} else {
		increaseButton.enabled = YES;
		decreaseButton.enabled = YES;
	}
}

- (IBAction)initSides {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[polygon setMinimumNumberOfSides:3];
	[polygon setMaximumNumberOfSides:12];
	
	int sides = [defaults integerForKey:@"initSides"];
	NSLog(@"in initSides sides = %d", sides);
	
	if (sides == 0) {
		sides = polygon.numberOfSides;
		[defaults setInteger:sides forKey:@"initSides"];
	} else {
		NSLog(@"Calling setNumberOfSides from Controller at line %d", __LINE__);
		[polygon setNumberOfSides:sides];

	}
	[self updateInterface];
	[polygon logAttributes];

//	[defaults removeObjectForKey:@"initSides"];
}

- (void)saveStatus {
	NSLog(@"In saveStatus in Controller at %d", __LINE__);
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	
	[defaults setInteger:[polygon numberOfSides] forKey:@"initSides"];
}

- (void)dealloc {

    [super dealloc];
}

@end
