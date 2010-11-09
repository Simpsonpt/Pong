//
//  Bg.m
//  Pong
//
//  Created by Renato Rodrigues on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Bg.h"
#import "Retronator.Pong.h"

@implementation Bg

- (id) init
{
	self = [super init];
	if (self != nil) {
		position = [[Vector2 alloc] init];
	}
	return self;
}

@synthesize position, velocity, mass, radius;

- (void) dealloc
{
	[position release];
	[super dealloc];
}

@end
