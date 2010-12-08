//
//  ReflexAgent.m
//  Pong
//
//  Created by Renato Rodrigues on 12/8/10.
//  Copyright 2010 Pathon Project. All rights reserved.
//

#import "ReflexAgent.h"

#import "Retronator.Pong.h"

@implementation ReflexAgent

- (void) updateWithGameTime:(GameTime *)gameTime 
{
	[super updateWithGameTime:gameTime];
	
	// Read percepts.
	NSArray *defenseDangers = [self getDefenseDangers];
	
	// Find the largest danger.
	int defenseSpotIndex = 0;
	float defenseSpotDanger = 0;
	for (int i = 0; i < [defenseDangers count]; i++) {
		float danger = [((NSNumber*)[defenseDangers objectAtIndex:i]) floatValue];
		if (danger > defenseSpotDanger) {
			defenseSpotIndex = i;
			defenseSpotDanger = danger;
		}
	}
	
	// Calculate offense opportunity.

	
	// The faster the pack, the less offensive you should be.
	float offense = 800 - [level.ball.velocity length];
	
	// Fade out offense from 150 to 250 y coordinate.
	float side = (250 - level.ball.position.y) / 100;
	if (side>1) side = 1;
	if (side<0) side = 0;
	offense *= side;    
	
	// Fade out offense from 0 to 100 vertical puck velocity
	float sideDirection = 1 - level.ball.velocity.y / 100;
	if (sideDirection>1) sideDirection = 1;
	if (sideDirection<0) sideDirection = 0;
	offense *= sideDirection;
	
	// Don't go into offense if puck is moving away faster than you.
	if (attackSpeed < level.ball.velocity.y) offense = 0;
	
	// If we have no offense or if the most dangerous spot is bigger then offense, weighted with opponent's aggressivness. 
	if (offense <= 0 || defenseSpotDanger > offense * attackFactor) {
		Vector2 *defenseSpot = [level.defenseSpots objectAtIndex:defenseSpotIndex];
		//mallet.radius
		Vector2 *offset = [[[Vector2 subtract:level.ball.position by:defenseSpot] normalize] multiplyBy:level.topPlayer.width * 2];
		Vector2 *defenseTarget = [Vector2 add:offset to:defenseSpot];
		// Perform move action.
		//printf("X: %f Y:%f\n",defenseTarget.x,defenseTarget.y);
		[self moveTowards:defenseTarget];		
	} else {
		// Find the best offense spot.
		NSArray *offenseWeaknesses = [self getOffenseWeaknesses];
		int offenseSpotIndex = 0;
		float offenseSpotWeakness = 0;
		for (int i = 0; i < [offenseWeaknesses count]; i++) {
			float weakness = [((NSNumber*)[offenseWeaknesses objectAtIndex:i]) floatValue];
			if (weakness > offenseSpotWeakness * 1.05) {
				offenseSpotIndex = i;
				offenseSpotWeakness = weakness;
			}
		}
		Vector2 *offenseSpot = [level.offenseSpots objectAtIndex:offenseSpotIndex];
		
		// calculate where the puck should go after collision
		Vector2 *desiredPuckDirection = [[Vector2 subtract:offenseSpot by:level.ball.position] normalize];
		Vector2 *puckDifference = [Vector2 subtract:level.ball.position by:level.topPlayer.position];
		
		float distance = [puckDifference length];
		
		// Try to get behind the puck from the desired direction;
		Vector2 *offset = [Vector2 multiply:desiredPuckDirection by:-distance * 0.9];
		Vector2 *offenseTarget = [Vector2 add:offset to:level.ball.position];
		
		// Perform attack action.
		//printf("X: %f Y:%f\n",offenseTarget.x,offenseTarget.y);
		[self attackTowards:offenseTarget];		
	}
	
}

@end

