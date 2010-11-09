//
//  PhysicsEngine.m
//  Pong
//
//  Created by Renato Rodrigues on 11/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GameCore.Physics.h"
#import "Retronator.Pong.h"
#import "PhysicsEngine.h"

@implementation PhysicsEngine

- (id) initWithGame:(Game *)theGame level:(Level *)theLevel {
	if (self = [super initWithGame:theGame]) {
		level = theLevel;
	}
	return self;
}

- (void) updateWithGameTime:(GameTime *)gameTime {
	
	// First we move the puck.
	[MovementPhysics simulateMovementOn:level.ball withElapsed:gameTime.elapsedGameTime];
	
	// Now we do collision detection. We compare all pairs of items.
	for (id item1 in level.scene) {
		for (id item2 in level.scene) {
			if (item1 != item2) {
				id <IParticle> particleCollider1 = [item1 conformsToProtocol:@protocol(IParticleCollider)] ? item1 : nil;
				id <IParticle> particleCollider2 = [item2 conformsToProtocol:@protocol(IParticleCollider)] ? item2 : nil;
				
				if (particleCollider1 && particleCollider2) {
					[ParticleParticleCollision collisionBetween:particleCollider1 and:particleCollider2];
				}
			}
		}
	}
}

@end
