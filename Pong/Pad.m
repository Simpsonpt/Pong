//
//  Pad.m
//  Pong
//
//  Created by Renato Rodrigues on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Pad.h"
#import "Retronator.Pong.h"

@implementation Pad

- (id) init
{
	self = [super init];
	if (self != nil) {
		position = [[Vector2 alloc] init];
		width = 110;
		height = 30;
	}
	return self;
}

@synthesize position, width, height;

- (BOOL) collidingWithItem:(id)item {
	return YES;
}

- (void) collidedWithItem:(id)item {
	
	/*// Calculate horizontal velocity depending on where the paddle was hit.
	Ball *ball = [item isKindOfClass:[Ball class]] ? item : nil;
	if(ball) 
	{
		float speed = [ball.velocity length];
		
		// Calculate where on the paddle we were hit, from -1 to 1.
		float hitPosition = (ball.position.x - position.x) / width * 2;
		
		// Calculate angle.
		float angle = hitPosition * [Constants getInstance].maximumBallAngle;
		
		// Rebound ball in desired direction.
		ball.velocity.x = sinf(angle);
		ball.velocity.y = -cosf(angle);
		[ball.velocity multiplyBy:speed];
		
		// Make sure the vertical velocity is big enough after collision.
		float minY = [Constants getInstance].minimumBallVerticalVelocity;
		if (fabsf(ball.velocity.y) < minY)
			ball.velocity.y = ball.velocity.y < 0 ? -minY : minY;
	}*/
	
}

- (void) dealloc
{
	[position release];
	[super dealloc];
}

@end