//
//  Bonus.m
//  Pong
//
//  Created by Renato Rodrigues on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Bonus.h"
#import "Retronator.Pong.h"

@implementation Bonus

- (id) init
{
	self = [super init];
	if (self != nil) {
		position = [[Vector2 alloc] init];
		velocity = [[Vector2 alloc] init];
		mass = 10;
		radius = 20;
	}
	return self;
}

@synthesize position, velocity, mass, radius;

- (void) dealloc
{
	[velocity release];
	[position release];
	[super dealloc];
}

@end

