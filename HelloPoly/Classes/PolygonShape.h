//
//  PolygonShape.h
//  WhatATool
//
//  Created by Ken Riley on 7/9/10.
//  Copyright 2010 Nodots Development, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PolygonShape : NSObject {
	// instance variables
	int numberOfSides;
	int minimumNumberOfSides;
	int maximumNumberOfSides;
	
	// no ivars for these because they are set as readonly in the property declarations
	//	float angleInDegrees;
	//	float angleInRadians;
	//	NSString *name;

}

// property declarations
@property int numberOfSides;
@property int minimumNumberOfSides;
@property int maximumNumberOfSides;
@property (readonly) NSString *name;
@property (readonly) float angleInDegrees;
@property (readonly) float angleInRadians;


// method declarations
- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max;

- (int)numberOfSides;
- (void)setNumberOfSides:(int)value;

- (int)minimumNumberOfSides;
- (void)setMinimumNumberOfSides:(int)value;

- (int)maximumNumberOfSides;
- (void)setMaximumNumberOfSides:(int)value;

- (float)angleInDegrees;

- (float)angleInRadians;

- (NSString *)name;
- (void)setName;

- (void)logAttributes;

@end
