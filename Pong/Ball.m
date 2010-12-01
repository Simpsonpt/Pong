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
		radius = 11;
		
		BonusArray = [[NSMutableArray alloc] init];
		
		bumm = NO;
	}
	return self;
}

@synthesize position, velocity, mass, radius,scene, bumm;

- (void) addBonus:(Bonus*)bonus 
{
	[BonusArray addObject:bonus];
	[bonus activateWithParent:self];
}

- (void) removeAllBonus 
{
	for (Bonus *extra in BonusArray) 
	{
		[extra deactivate];
	}
	[BonusArray removeAllObjects];
}

/*Pick up Bonus*/
- (BOOL) collidingWithItem:(id)item 
{
	if([item isKindOfClass:[Bonus class]]) 
	{
		[self addBonus:item];
		[scene removeItem:item];
		bumm=YES;
		return NO;
	}
	/*Bounce off the rest.*/
	return YES;
}

- (void) collidedWithItem:(id)item 
{
	// Make sure the vertical velocity is big enough after collision,
	// so we don't have to endlesly wait for the ball to come down.
	float minY = [Constants getInstance].minimumBallVerticalVelocity;
	if (fabsf(velocity.y) < minY) 
	{
		float speed = [velocity length];
		float x = sqrtf(speed * speed - minY * minY);
		velocity.y = velocity.y < 0 ? -minY : minY;
		velocity.x = velocity.x < 0 ? -x : x;
	}
}


- (void) updateWithGameTime:(GameTime *)gameTime {
	for (Bonus *extra in BonusArray) 
	{
		[extra updateWithGameTime:gameTime];
		if(bumm)
		{
			Explosion *explosion = [[[Explosion alloc] initWithGameTime:gameTime] autorelease];
			explosion.position = [[Vector2 vectorWithVector:extra.position] add:[Vector2 vectorWithX:[Random float] * 40 - 20 y:[Random float] * 80 - 40]];
			[scene addItem:explosion];
			bumm=NO;
		}
	}
}

- (void) dealloc
{
	[velocity release];
	[position release];
	[super dealloc];
}

@end
