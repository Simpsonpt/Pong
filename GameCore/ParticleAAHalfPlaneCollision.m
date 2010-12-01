//
//  ParticleAAHalfPlaneCollision.m
//  GameCore
//
//  Created by Renato Rodrigues on 11/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GameCore.Scene.Objects.h"
#import "GameCore.Physics.h"
#import "GameCore.Math.h"
#import "ParticleAAHalfPlaneCollision.h"

@implementation ParticleAAHalfPlaneCollision

+ (BOOL) detectCollisionBetween:(id<IParticleCollider>)particle and:(id<IAAHalfPlaneCollider>)aaHalfPlane {
	switch (aaHalfPlane.aaHalfPlane.direction) {
		default:
		case AxisDirectionPositiveX:
			return particle.position.x - particle.radius < aaHalfPlane.aaHalfPlane.distance;
		case AxisDirectionNegativeX:
			return particle.position.x + particle.radius > -aaHalfPlane.aaHalfPlane.distance;
		case AxisDirectionPositiveY:
			return particle.position.y - particle.radius < aaHalfPlane.aaHalfPlane.distance;
		case AxisDirectionNegativeY:
			return particle.position.y + particle.radius > -aaHalfPlane.aaHalfPlane.distance;
	}	
}

+ (void) resolveCollisionBetween:(id<IParticleCollider>)particle and:(id<IAAHalfPlaneCollider>)aaHalfPlane {
	// RELAXATION STEP
	
	// First we relax the collision, so the two objects don't collide any more.
	Vector2 *relaxDistance = nil;
	switch (aaHalfPlane.aaHalfPlane.direction) {
		case AxisDirectionPositiveX:
			relaxDistance = [Vector2 vectorWithX:particle.position.x - particle.radius - aaHalfPlane.aaHalfPlane.distance y:0];
			break;
		case AxisDirectionNegativeX:
			relaxDistance = [Vector2 vectorWithX:particle.position.x + particle.radius + aaHalfPlane.aaHalfPlane.distance y:0];
			break;
		case AxisDirectionPositiveY:
			relaxDistance = [Vector2 vectorWithX:0 y:particle.position.y - particle.radius - aaHalfPlane.aaHalfPlane.distance];
			break;
		case AxisDirectionNegativeY:
			relaxDistance = [Vector2 vectorWithX:0 y:particle.position.y + particle.radius + aaHalfPlane.aaHalfPlane.distance];
			break;
	}
	[Collision relaxCollisionBetween:particle and:aaHalfPlane by:relaxDistance];
	
	// ENERGY EXCHANGE STEP
	
	// In a collision, energy is exchanged only along the collision normal.
	// For particles this is simply the line between both centers.
	Vector2 *collisionNormal = [[Vector2 vectorWithVector:relaxDistance] normalize];
	[Collision exchangeEnergyBetween:particle and:aaHalfPlane along:collisionNormal];
	
}

@end