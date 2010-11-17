//
//  Ball.m
//  Pong
//
//  Created by Renato Rodrigues on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Ball.h"
#import "Retronator.Pong.h"

@implementation Ball

- (id) init
{
	self = [super init];
	if (self != nil) {
		position = [[Vector2 alloc] init];
		velocity = [[Vector2 alloc] init];
		mass = 1;
		radius = 20;
		velocity.x = 100;
		velocity.y = 1000;
		coefficientOfRestitution = 1;
	}
	return self;
}

@synthesize position, velocity, mass, radius, coefficientOfRestitution;

- (void) dealloc
{
	[velocity release];
	[position release];
	[super dealloc];
}

