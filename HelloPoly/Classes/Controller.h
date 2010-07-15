//
//  Controller.h
//
//  Created by Ken Riley on 7/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"

@interface Controller : NSObject {

	IBOutlet UIButton *decreaseButton;
	IBOutlet UIButton *increaseButton;
	IBOutlet UILabel  *numberOfSidesLabel;
	IBOutlet PolygonShape *polygon;
	
}

- (IBAction)increase;
- (IBAction)decrease;
- (IBAction)initSides;
- (IBAction)updateInterface;
- (void)saveStatus;
@end
