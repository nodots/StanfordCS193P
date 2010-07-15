//
//  PolygonView.m
//
//  Created by Ken Riley on 7/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PolygonView.h"

@implementation PolygonView

+ (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides {
	CGPoint center = CGPointMake(rect.size.width / 2.0, rect.size.height / 2.0);
	float radius = 0.9 * center.x;
	NSMutableArray *result = [NSMutableArray array];
	float angle = (2.0 * M_PI) / numberOfSides;
	float exteriorAngle = M_PI - angle;
	float rotationDelta = angle - (0.5 * exteriorAngle);
	
	for (int currentAngle = 0; currentAngle < numberOfSides; currentAngle++) {
		float newAngle = (angle * currentAngle) - rotationDelta;
		float curX = cos(newAngle) * radius;
		float curY = sin(newAngle) * radius;
		[result addObject:[NSValue valueWithCGPoint:CGPointMake(center.x + curX,center.y + curY)]];
	}
	
	return result;
	
	// How to retrieve a CGPoint
	// NSValue *theValue = ;.....// retrieve an object from the array
	// CGPoint thePoint = [theValue CGPointValue];
}


- (void)drawRect:(CGRect)rect {
//	NSLog(@"In drawRect override");

	CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGRect bounds = [self bounds];
	
	[[UIColor lightGrayColor] set];
	UIRectFill(bounds);
	
	[[UIColor blackColor] set];
	UIRectFrame(bounds);
	
//	CGContextBeginPath(context);

//	NSArray *polygonPoints = [[NSArray self] pointsForPolygonInRect:bounds numberOfSides:5];
	
	NSValue *point = [NSValue objectAtIndex:0];
	
	for (i = 1; i < polygonPoints.count; i++) {
		NSValue *point = [NSValue objectAtIndex:i]
	}
	//CGContextMoveToPoint(context, 75, 10);
//	CGContextAddLineToPoint(context, 10, 150);
//	CGContextAddLineToPoint(context,160,150);
//	CGContextClosePath(context);
	
//	[[UIColor redColor] setFill];
//	[[UIColor blackColor] setStroke];
//	CGContextDrawPath(context, kCGPathFillStroke);
}

- (void)setNameLabel {
	NSLog(@"setNameLabel called");
}

- (void)showAdvancedOptions {}

@end
