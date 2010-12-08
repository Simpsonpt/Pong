//
//  AIRenderer.m
//  Pong
//
//  Created by Renato Rodrigues on 12/8/10.
//  Copyright 2010 Pathon Project. All rights reserved.
//

#import "AIRenderer.h"

#import "Retronator.Pong.h"

@implementation AIRenderer

- (id) initWithGame:(Game *)theGame aiPlayer:(AIPlayer*)theAIPlayer
{
	self = [super initWithGame:theGame];
	if (self != nil) {
		aiPlayer = theAIPlayer;
	}
	return self;
}

- (void) loadContent {
	primitiveBatch = [[PrimitiveBatch alloc] initWithGraphicsDevice:self.graphicsDevice];
}

- (void) drawWithGameTime:(GameTime *)gameTime {
	[primitiveBatch begin];
	
	// Defense spots.
	NSArray *defenseDangers = [aiPlayer getDefenseDangers];
	for (int i = 0; i < [defenseDangers count]; i++) {
		float danger = [((NSNumber*)[defenseDangers objectAtIndex:i]) floatValue]; 
		Vector2 *position = [aiPlayer.level.defenseSpots objectAtIndex:i];
		[primitiveBatch drawCircleAt:position
							  radius:30 divisions:24 
							   color:[Color colorWithRed:danger green:danger-256 blue:danger-512]];
	}	
	
	// Offense spots
	NSArray *offenseWeaknesses = [aiPlayer getOffenseWeaknesses];
	for (int i = 0; i < [offenseWeaknesses count]; i++) {
		float weakness = [((NSNumber*)[offenseWeaknesses objectAtIndex:i]) floatValue] * 1000; 
		Vector2 *position = [aiPlayer.level.offenseSpots objectAtIndex:i];
		[primitiveBatch drawCircleAt:position
							  radius:30 divisions:24 
							   color:[Color colorWithRed:weakness-512 green:weakness-256 blue:weakness]];
	}	
	
	// Target
	if (aiPlayer.target) {
		[primitiveBatch drawLineFrom:aiPlayer.level.topPlayer.position to:aiPlayer.target color:[Color black]];
	}
	
	[primitiveBatch end];	
}


- (void) unloadContent {
	[primitiveBatch release];
}


@end
