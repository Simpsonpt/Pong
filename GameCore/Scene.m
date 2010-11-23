//
//  Scene.m
//  Pong
//
//  Created by Renato Rodrigues on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Scene.h"

@implementation Scene

- (id) init
{
	self = [super init];
	if (self != nil) {
		items = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void) addItem:(id)item {
	[items addObject:item];
}

<<<<<<< HEAD
- (void) removeItem:(id)item {
	[items removeObject:item];
}

- (void) clear{
	[items removeAllObjects];
}

=======
>>>>>>> 81162655290a32b13e3cb5e94a1543c95a717c57
- (void) removeObjectsAtIndex:(NSMutableIndexSet*)set{
	[items removeObjectsAtIndexes:set];
}

- (NSUInteger) countByEnumeratingWithState:(NSFastEnumerationState *)state 
								   objects:(id *)stackbuf 
									 count:(NSUInteger)len {
    return [items countByEnumeratingWithState:state objects:stackbuf count:len];
}

- (void) dealloc
{
	[items release];
	[super dealloc];
}

@end
