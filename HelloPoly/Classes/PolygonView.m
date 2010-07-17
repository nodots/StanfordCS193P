//
//  PolygonView.m
//
//  Created by Ken Riley on 7/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PolygonView.h"

@implementation PolygonView

@synthesize numberOfSides;
@synthesize lineStyle;


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

- (void)setLineStyle:(int)style {
	NSLog(@"In setLineStyle with style %d",style);
	lineStyle = style;	
}

- (void)setLinePattern {
	linePattern[0] = 4;
	linePattern[1] = 2;
}

- (void)drawRect:(CGRect)rect {
//	NSLog(@"In drawRect override");

	CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGRect bounds = [self bounds];
	
	[[UIColor lightGrayColor] set];
	UIRectFill(bounds);
	
	[[UIColor blackColor] set];
	UIRectFrame(bounds);
	
	CGContextBeginPath(context);

	NSArray *polygonPoints = [PolygonView pointsForPolygonInRect:bounds numberOfSides:numberOfSides];
	NSValue *val;
	CGPoint point;
	
	// get the first point to start our path
	val = [polygonPoints objectAtIndex:0];
	point = [val CGPointValue]; 
	CGContextMoveToPoint(context, point.x, point.y);
	
	// loop over remaining points and draw lines between points
	for (int i = 1; i < polygonPoints.count; i++) {
		val = [polygonPoints objectAtIndex:i];
		point = [val CGPointValue]; 
//		NSLog(@"%d, %d", point.x, point.y);
		CGContextAddLineToPoint(context, point.x, point.y);
	}
	
	// finish path
	CGContextClosePath(context);
	
	NSLog(@"lineStyle = %d", lineStyle);
	if (lineStyle == 1) {
		[self setLinePattern];
		CGContextSetLineDash(context,0,linePattern,2);
	}
	
	// set up colors and draw
	[[UIColor redColor] setFill];
	[[UIColor blackColor] setStroke];
	
	
	
	CGContextDrawPath(context, kCGPathFillStroke);
}

- (void)showAdvancedOptions {}

@end
