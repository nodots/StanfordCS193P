//
//  PolygonView.h
//
//  Created by Ken Riley on 7/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"

@interface PolygonView : UIView  {
	float linePattern[2];
}

@property int numberOfSides;
@property int lineStyle;

// class methods
+ (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides;

// instance methods
- (void)drawRect:(CGRect)rect;
- (void)showAdvancedOptions;

@end
