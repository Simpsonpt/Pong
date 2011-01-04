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
		width = 84;
		height = 20;
		type=0;
		stopBonus=NO;
		//caughtBalls = [[NSMutableArray alloc] init];		
		velocity = [[Vector2 alloc] init];
		previousPosition = [[Vector2 alloc] init];
		
	}
	return self;
}
// magnetPower,
@synthesize position, width, height, scene, type, top,stopBonus,previousPosition;

- (BOOL) collidingWithItem:(id)item {
	return YES;
}

- (void) resetVelocity {
	[previousPosition set:position];
	[velocity set:[Vector2 zero]];
}

/*- (void) releaseBalls {
	if (magnetPower) {
		magnetPower--;
		[caughtBalls removeAllObjects];
	}
}*/

- (void) collidedWithItem:(id)item {
	Ball *ball = [item isKindOfClass:[Ball class]] ? item : nil;
	if(ball) 
	{
		//[SoundEngine play:SoundEffectTypePad];
		// Calculate horizontal velocity depending on where the paddle was hit.
		
		// First save the current speed and add speedup.
		float sign=ball.velocity.y >0 ? 1 : -1 ;
		
		float speed = [ball.velocity length] * [Constants getInstance].ballSpeedUp;
		
		// Calculate where on the paddle we were hit, from -1 to 1.
		float offset = ball.position.x - position.x;
		float hitPosition = (offset) / width * 2;
		
		// Calculate angle.
		float angle = hitPosition * [Constants getInstance].maximumBallAngle;
		
		// Rebound ball in desired direction.
		ball.velocity.x = sinf(angle);
		ball.velocity.y = cosf(angle)*sign;
		[ball.velocity multiplyBy:speed];
		
		//if (magnetPower)
		//	[caughtBalls addObject:[CaughtBall caughtBallWithBall:ball offset:offset]];
		
		if(!stopBonus)
		{
			//Condition for Random Bonus
			if([Random float] < [Constants getInstance].bonusChance) 
			{
				//printf("Entrei no Random Bonus!\n");
				Bonus *extra = [BonusFactory createRandomBonus];
				//Bonus *extra = [BonusFactory createBonus:_MultiBallBonus];
				extra.position.x = [Random intLessThan:250];
				extra.position.y = [Random intGreaterThanOrEqual:75 lessThan:300];
				//[extra.position set:position];
				//printf("Add with X: %f Y: %f\n",extra.position.x,extra.position.y);
				[scene addItem:extra];
			}
		}
		
	}
	
	/* // Calculate horizontal velocity depending on where the paddle was hit.
	 Ball *ball = [item isKindOfClass:[Ball class]] ? item : nil;
	 if (ball) {
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
	 if (fabsf(ball.velocity.y) < minY) {
	 ball.velocity.y = ball.velocity.y < 0 ? -minY : minY;
	 }
	 }*/
	 	
}

- (void) updateWithGameTime:(GameTime *)gameTime 
{
	/*for (CaughtBall *caughtBall in caughtBalls) 
	{
		caughtBall.ball.position.x = position.x + caughtBall.offset;
		caughtBall.ball.position.y = position.y - height/2 - caughtBall.ball.radius;
	}*/
	// Avoid division by zero.
	if (gameTime.elapsedGameTime == 0) {
		return;
	}
	
	// Calculate mallet velocity in reverse.
	Vector2 *distance = [Vector2 subtract:position by:previousPosition];
	
	// Velocity is distance over time
	Vector2 *newVelocity = [Vector2 multiply:distance by:1.0f/gameTime.elapsedGameTime];
	
	// Use smoothing to make up for jerky pixel unit movement.
	// v = vOld * s + vNew * (1-s)
	float s = [Constants velocitySmoothing];
	[[velocity multiplyBy:s] add:[Vector2 multiply:newVelocity by:1-s]];	
	
	// Store position for next frame.
	[previousPosition set:position];
	
}

- (void) dealloc
{
	[position release];
	[velocity release];
	[super dealloc];
}

@end