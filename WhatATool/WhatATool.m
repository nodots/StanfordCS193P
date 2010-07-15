#import <Foundation/Foundation.h>
#import "PolygonShape.h";

void PrintPathInfo() {
	NSLog(@"---> In PrintPathInfo");	
	NSString *path = @"~";
	NSString *msgPrefix = @"My home directory is";
	NSLog(@"%@: '%@'", msgPrefix, [path stringByStandardizingPath]);
	
}

void PrintProcessInfo() {
	NSLog(@"---> In PrintProcessInfo");
	
	NSProcessInfo *processInfo = [NSProcessInfo processInfo];
	NSString *processName = [processInfo processName];
	int processID = [processInfo processIdentifier];
	NSLog(@"Process Name: '%@' Process ID: '%d'", processName, processID);
}

void PrintBookmarkInfo() {
	NSLog(@"---> In PrintBookmarkInfo");
	
	NSMutableDictionary *bookmarks = [NSMutableDictionary dictionaryWithObjectsAndKeys:
									  [NSURL URLWithString:@"http://www.stanford.edu"],
									  @"Stanford University",
									  [NSURL URLWithString:@"http://www.apple.com"],
									  @"Apple",
									  [NSURL URLWithString:@"http://cs193p.stanford.edu"],
									  @"CS193P",
									  [NSURL URLWithString:@"http://itunes.stanford.edu"],
									  @"Stanford on iTunes U",
									  [NSURL URLWithString:@"http://stanfordshop.com"],
									  @"Stanford Mall",
									  nil];
	
	for (NSString *key in bookmarks) {
		if ( [key hasPrefix:@"Stanford"] ) {
			NSLog(@"Key: '%@' URL: '%@'",key, [bookmarks objectForKey:key]);
		}
	}
	
}

void PrintIntrospectionInfo() {
	NSLog(@"---> In PrintIntrospectionInfo");
	
	NSMutableArray *arrayOfStuff = [NSMutableArray arrayWithObjects:
									@"A NSString item",
									@"Another NSString item",
									[NSURL URLWithString:@"http://www.nodots.com"],
									nil
									];
	
	SEL sel = @selector(lowercaseString);
	
	for ( id o in arrayOfStuff ) {
		NSLog(@"Class name: %@", [o className]);
		NSLog(@"Is Member of NSString: %@", ([o isMemberOfClass:[NSString class]] ? @"YES" : @"NO"));
		NSLog(@"Is Kind of NSString: %@", ([o isKindOfClass:[NSString class]] ? @"YES" : @"NO"));
		NSLog(@"Responds to lowercaseString: %@", ([o respondsToSelector:sel] ? @"YES" : @"NO")); 
		if ([o respondsToSelector:sel]) {
			NSLog(@"lowercaseString is: %@", [o performSelector:sel]);
		}
		NSLog(@"----------------------------------");
		
	}
}

void PrintPolygonInfo()
{
	NSLog(@"--->In PrintPolygonInfo");
//	PolygonShape *poly = [[PolygonShape alloc] initWithNumberOfSides:12 minimumNumberOfSides:12 maximumNumberOfSides:12];
//	NSLog(@"Polygon has %d sides (it's a %@) and has %f degrees (%f radians) in each interior angle", [poly numberOfSides], [poly name],[poly angleInDegrees], [poly angleInRadians]);
//	NSLog(@"Polygon retainCount = %d", [poly retainCount]);
//	[poly release];
//	NSLog(@"Polygon retainCount = %d", [poly retainCount]);

	
	NSMutableArray *polygons = [[NSMutableArray alloc] init];
	
	PolygonShape *square = [[PolygonShape alloc] initWithNumberOfSides:4 minimumNumberOfSides:3 maximumNumberOfSides:7];
	[polygons  addObject:square];
	[square release];
	[square logAttributes];
	
	PolygonShape *hexagon = [[PolygonShape alloc] init];
	[hexagon setNumberOfSides:6];
	[hexagon setMinimumNumberOfSides:5];
	[hexagon setMaximumNumberOfSides:9];
	[polygons addObject:hexagon];
	[hexagon release];
	[hexagon logAttributes];
	
	PolygonShape *dodecagon = [[PolygonShape alloc] initWithNumberOfSides:12 minimumNumberOfSides:9 maximumNumberOfSides:12];
	[polygons addObject:dodecagon];
	[dodecagon logAttributes];
	[dodecagon release];
	
	for (PolygonShape *shape in polygons) {
		NSLog(@"Shape is a %@.", [shape name]);
		[shape setNumberOfSides:10];
	}
	
	[polygons release];
	
}

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	PrintPathInfo();
	PrintProcessInfo();
	PrintBookmarkInfo();
	PrintIntrospectionInfo();
	PrintPolygonInfo();
	
	[pool drain];
    return 0;

}


