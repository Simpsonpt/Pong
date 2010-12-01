//
//  AALimit.m
//  GameCore
//
//  Created by Renato Rodrigues on 11/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AALimit.h"


@implementation AALimit

- (id) initWithLimit:(AAHalfPlane *)theLimit
{
	self = [super init];
	if (self != nil) {
		limit = [theLimit retain];
	}
	return self;
}

- (AAHalfPlane *) axisAlignedHalfPlane {
	return limit;
}

- (HalfPlane *) halfPlane {
	return limit;
}

- (void) dealloc
{
	[limit release];
	[super dealloc];
}

@synthesize aaHalfPlane;

@end

