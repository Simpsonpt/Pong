//
//  PhysicsEngine.m
//  Pong
//
//  Created by Renato Rodrigues on 11/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Retronator.Pong.h"
#import "PhysicsEngine.h"
#import "GameCore.Graphics.h"
#import "GameCore.Physics.h"

@implementation PhysicsEngine

- (id) initWithGame:(Game *)theGame level:(Level *)theLevel 
{
	if (self = [super initWithGame:theGame]) 
		level = theLevel;
	return self;
}

- (void) updateWithGameTime:(GameTime *)gameTime 
{	
	/*Movement*/
	for (id item in level.scene) {
		[MovementPhysics simulateMovementOn:item withElapsed:gameTime.elapsedGameTime];
		
		/*Detect if Any Bonus is On*/
		if([item isKindOfClass:[Bonus class]])
			level.bonusStatus=YES;
		else
			level.bonusStatus=NO;
	}
	// Now we do collision detection. We compare puck and mallets with all other items.
	for (id item1 in level.scene) {
		if ([item1 isKindOfClass:[Pad class]] || [item1 isKindOfClass:[Ball class]]) {
			for (id item2 in level.scene) {
				if (item1 != item2)
					[Collision collisionBetween:item1 and:item2];
			}
		}
	}	
}
	
@end
