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

- (IBAction)setWithSlider {
	int intVal = (int)slider.value;
	NSLog(@"In setWithSlider with value %d", intVal);
	polygon.numberOfSides = intVal;
	[self updateInterface];
}

- (IBAction)updateInterface {
	[view setNumberOfSides:polygon.numberOfSides];
	NSLog(@"updateInterface");
	if ([polygon numberOfSides] == [polygon maximumNumberOfSides]) {
		increaseButton.enabled = NO;
	} else if ([polygon numberOfSides] == [polygon minimumNumberOfSides]) {
		decreaseButton.enabled = NO;
	} else {
		increaseButton.enabled = YES;
		decreaseButton.enabled = YES;
	}
	
	NSLog(@"styleControl.selectedSegmentIndex = %d", styleControl.selectedSegmentIndex);
	
	[view setLineStyle:styleControl.selectedSegmentIndex];
	
	slider.value = polygon.numberOfSides;
	numberOfSidesLabel.text = [NSString stringWithFormat:@"%d",polygon.numberOfSides];
	nameLabel.text = [NSString stringWithFormat:@"%@",polygon.name];
	[view setNeedsDisplay];
}

- (IBAction)initSides {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[polygon setMinimumNumberOfSides:3];
	[polygon setMaximumNumberOfSides:12];
	
	[slider setMinimumValue:3];
	[slider setMaximumValue:12];
	
	int sides = [defaults integerForKey:@"initSides"];
	[view setLineStyle:[defaults integerForKey:@"lineStyle"]];
	
	styleControl.selectedSegmentIndex = view.lineStyle;
		
	if (sides == 0) {
		sides = polygon.numberOfSides;
		[defaults setInteger:sides forKey:@"initSides"];
	} else {
		[polygon setNumberOfSides:sides];

	}
	[self updateInterface];
//	[polygon logAttributes];

}

- (void)saveStatus {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	
	[defaults setInteger:[view lineStyle] forKey:@"lineStyle"];
	[defaults setInteger:[polygon numberOfSides] forKey:@"initSides"];
}

- (void)dealloc {

    [super dealloc];
}

@end
