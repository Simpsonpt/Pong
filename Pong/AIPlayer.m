//
//  AIPlayer.m
//  Pong
//
//  Created by Renato Rodrigues on 12/8/10.
//  Copyright 2010 Pathon Project. All rights reserved.
//

#import "AIPlayer.h"

#import "Retronator.Pong.h"

@interface AIPlayer ()

- (void) moveTowards:(Vector2 *)theTarget attack:(BOOL)isAttack;
//- (id) initWithPad:(Pad *)thePad level:theLevel scene:(id <IScene>)theScene position:(PlayerPosition)thePosition game:(Game*)game;

@end


@implementation AIPlayer

- (id) initWithGame:(Game *)theGame scene:(id <IScene>)theScene pad:(Pad *)thePad level:(Level *)theLevel position:(PlayerPosition)thePosition
//- (id) initWithPad:(Pad *)thePad level:theLevel scene:(id <IScene>)theScene position:(PlayerPosition)thePosition game:(Game*)game
{
	//self = [super initWithGame:theGame pad:thePad position:thePosition];
	self = [super initWithPad:thePad scene:theScene position:thePosition];
	if (self != nil) {
		level = theLevel;
		quotes = [[NSMutableArray alloc] init];
	}
	return self;
}

@synthesize level, target;

// Percepts
- (NSArray *) getDefenseDangers {
	NSMutableArray *defenseDangers = [NSMutableArray array];
	
	for (Vector2 *defenseSpot in level.defenseSpots) {
		Vector2 *difference = [Vector2 subtract:defenseSpot by:level.ball.position];
		float distanceDanger = [difference length];
		[difference normalize];
		float velocityDanger = [Vector2 dotProductOf:level.ball.velocity with:difference];
		
		float danger = 500 - distanceDanger + (velocityDanger / distanceDanger) * 1000;     
		if (danger < 0) danger = 0;
		
		[defenseDangers addObject:[NSNumber numberWithFloat:danger]];
	}
	
	return defenseDangers;
}

- (NSArray*) getOffenseWeaknesses {
	NSMutableArray *offenseWeaknesses = [NSMutableArray array];
	
	for (Vector2 *offenseSpot in level.offenseSpots) {
		Vector2 *myDifference = [Vector2 subtract:offenseSpot by:level.topPlayer.position];
		float myDistance = [myDifference length];
		
		Vector2 *opponentDifference = [Vector2 subtract:offenseSpot by:level.bottomPlayer.position];
		float opponentDistance = [opponentDifference length];
		
		float weakness = opponentDistance / myDistance;
		
		[offenseWeaknesses addObject:[NSNumber numberWithFloat:weakness]];		
	}
	
	return offenseWeaknesses;
}

// Actions
- (void) moveTowards:(Vector2 *)theTarget {
	[self moveTowards:theTarget attack:NO];
}

- (void) attackTowards:(Vector2 *)theTarget {
	[self moveTowards:theTarget attack:YES];
}

- (void) moveTowards:(Vector2 *)theTarget attack:(BOOL)isAttack {
	[target release];
	
	// Make sure we don't cross the middle or go into walls.
	if (theTarget.y > 250 || theTarget.x < 0 || theTarget.x > 290) {
		target = nil;
		return;
	}	
	
	target = [theTarget retain];
	attack = isAttack;
	
	// Don't move too close to the edge.
	if (target.y < 60) {
		target.y = 60;
	}
}

// Action execution
- (void) updateWithGameTime:(GameTime *)gameTime {
	
	// Movement action.
	if (target) 
	{
//		by:mallet.position
		Vector2 *difference = [Vector2 subtract:target by:level.topPlayer.position];
		//Ver esta merda CRL
//ª		float distance = [difference length];
//ª		float maxMove = (attack ? attackSpeed : speed) * gameTime.elapsedGameTime;
//printf("Distance: %f MaxMove: %f Speed: %f\n",distance,maxMove,speed);
		/*ªif (distance < maxMove) {
			//mallet.position
			[level.topPlayer.position set:target];
			printf("Cona CRL\n");
			[target release];
			target = nil;
		} else {
			[[difference normalize] multiplyBy:maxMove];
			//mallet.position
			[level.topPlayer.position add:difference];
		}ª*/
//		ª[level.topPlayer.position set:target];
		level.topPlayer.position.x = target.x;
		//printf("Cona CRL\n");
		[target release];
		target = nil;
		
	}
}

- (void) dealloc
{
	[quotes release];
	[super dealloc];
}


@end

