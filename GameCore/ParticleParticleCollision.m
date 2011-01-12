//
//  ParticleParticleCollision.m
//  GameCore
//
//  Created by Renato Rodrigues on 11/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ParticleParticleCollision.h"
#import "GameCore.Scene.Objects.h"
#import "Gamecore.Physics.h"

@implementation ParticleParticleCollision

+ (BOOL) detectCollisionBetween:(id<IParticleCollider>)particle1 and:(id<IParticleCollider>)particle2 {
	float distanceBetweenParticles = [[Vector2 subtract:particle1.position by:particle2.position] length];
	return distanceBetweenParticles < particle1.radius + particle2.radius;
}

+ (void) resolveCollisionBetween:(id<IParticleCollider>)particle1 and:(id<IParticleCollider>)particle2 {
	// RELAXATION STEP
	
	// First we relax the collision, so the two objects don't collide any more.
	// We need to calculate by how much to move them apart. We will move them in the shortest direction
	// possible which is simply the difference between both centers.
	Vector2 *positionDifference = [Vector2 subtract:particle2.position by:particle1.position];
	float collidedDistance = [positionDifference length];
	float minimumDistance = particle1.radius + particle2.radius;
	float relaxDistance = minimumDistance - collidedDistance;
	Vector2 *collisionNormal = collidedDistance ? [[Vector2 vectorWithVector:positionDifference] normalize] : [Vector2 unitX];
	Vector2 *relaxDistanceVector = [Vector2 multiply:collisionNormal by:relaxDistance];
	[Collision relaxCollisionBetween:particle1 and:particle2 by:relaxDistanceVector];
	
	// ENERGY EXCHANGE STEP
	
	// In a collision, energy is exchanged only along the collision normal.
	// For particles this is simply the line between both centers.
	[Collision exchangeEnergyBetween:particle1 and:particle2 along:collisionNormal];
}

@end
