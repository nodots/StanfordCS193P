//
//  Controller.h
//
//  Created by Ken Riley on 7/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"
#import "PolygonView.h"
#define LINE_STYLE_SOLID = 0
#define LINE_STYLE_DASHED = 1

@interface Controller : NSObject {

	IBOutlet UIButton *decreaseButton;
	IBOutlet UIButton *increaseButton;
	IBOutlet UILabel  *numberOfSidesLabel;
	IBOutlet UILabel  *nameLabel;
	IBOutlet UISlider *slider;
	IBOutlet UISegmentedControl *styleControl;
	IBOutlet PolygonShape *polygon;
	IBOutlet PolygonView *view;
	
}

- (IBAction)increase;
- (IBAction)decrease;
- (IBAction)initSides;
- (IBAction)setWithSlider;
- (IBAction)updateInterface;
- (void)saveStatus;

@end
