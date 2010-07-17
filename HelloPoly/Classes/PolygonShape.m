//
//  PolygonShape.m
//  WhatATool
//
//  Created by Ken Riley on 7/9/10.
//  Copyright 2010 Nodots Development, Inc. All rights reserved.
//

#import "PolygonShape.h"
#define MAX_SIDES 12
#define MIN_SIDES 3

@implementation PolygonShape

// @synthesize automatically generates getters and setters at compile time. These can be overriden.
@synthesize name;
@synthesize numberOfSides;
@synthesize minimumNumberOfSides;
@synthesize maximumNumberOfSides;

- (id)init {
	return [self initWithNumberOfSides:5 minimumNumberOfSides:3 maximumNumberOfSides:10];
}

- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max {
	[self setMinimumNumberOfSides:min];
	[self setMaximumNumberOfSides:max];
	[self setNumberOfSides:sides];
	[self setName];
	return self;
}

- (void)setNumberOfSides:(int)newNumberOfSides {
	NSLog(@"In setNumber of sides with %d sides.", newNumberOfSides);
	if (newNumberOfSides <= [self maximumNumberOfSides] && newNumberOfSides >= [self minimumNumberOfSides]) {
		numberOfSides = newNumberOfSides;
		[self setName];
	} else {
		NSLog(@"The number of sides must be between %d and %d.", [self minimumNumberOfSides], [self maximumNumberOfSides]);
	}

	
}

- (void)setMinimumNumberOfSides:(int)newMin {
	if ( newMin < MIN_SIDES ) {
		NSLog(@"You can't make a polygon with fewer than %d sides. Think about it.", MIN_SIDES);
		return;
	} else {
		minimumNumberOfSides = newMin;
	}
}

- (void)setMaximumNumberOfSides:(int)newMax {
	if ( newMax > MAX_SIDES ) {
		NSLog(@"%d is greater than the maximum of %d sides allowed.", newMax, MAX_SIDES);
		return;
	} else {
		maximumNumberOfSides = newMax;
	}
}


- (void)setName {
	NSArray *polygonName = [NSArray arrayWithObjects: 
							@"Triangle",
							@"Square",
							@"Pentagon",
							@"Hexagon",
							@"Heptagon",
							@"Octagon",
							@"Nonagon",
							@"Decagon",
							@"Hendecagon",
							@"Dodecagon",
							nil];
	int nameIndex = [self numberOfSides] - 3;
	name = [polygonName objectAtIndex:nameIndex];
}

- (float)angleInDegrees {
	return (180 * (numberOfSides - 2)/numberOfSides); 
}

- (float)angleInRadians {
	return ([self angleInDegrees]/(360/(2 * M_PI)));
}

-(void)logAttributes {
	NSLog(@"Polygon has %d sides (it's a %@) and has %f degrees (%f radians) in each interior angle", [self numberOfSides], [self name],[self angleInDegrees], [self angleInRadians]);

}

- (void)dealloc {
	// custom cleanup code
	NSLog(@"In dealloc override");
	[name release];
	
	// call super to finish clean up
	[super dealloc];
}

@end
