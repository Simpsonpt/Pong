//
//  ParticleAARectangleCollision.m
//  GameCore
//
//  Created by FRI Multimedija on 11/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ParticleAARectangleCollision.h"
#import "GameCore.Physics.h"
#import "GameCore.Scene.Objects.h"

@interface ParticleAARectangleCollision ()

+ (Vector2*) calculateRelaxDistanceBetween:(id<IParticleCollider>)particle and:(id<IAARectangleCollider>)aaRectangle;

@end


@implementation ParticleAARectangleCollision

+ (BOOL) detectCollisionBetween:(id<IParticleCollider>)particle and:(id<IAARectangleCollider>)aaRectangle {
	Vector2 *relaxDistance = [ParticleAARectangleCollision calculateRelaxDistanceBetween:particle and:aaRectangle];
	return [relaxDistance lengthSquared] > 0;
}

+ (void) resolveCollisionBetween:(id<IParticleCollider>)particle and:(id<IAARectangleCollider>)aaRectangle {
	Vector2 *relaxDistance = [ParticleAARectangleCollision calculateRelaxDistanceBetween:particle and:aaRectangle];
	[Collision relaxCollisionBetween:particle and:aaRectangle by:relaxDistance];
	
	Vector2 *collisionNormal = [[Vector2 vectorWithVector:relaxDistance] normalize];
	[Collision exchangeEnergyBetween:particle and:aaRectangle along:collisionNormal];
	
}

+ (Vector2*) calculateRelaxDistanceBetween:(id <IParticleCollider>)particle and:(id <IAARectangleCollider>)aaRectangle {
	Vector2 *relaxDistance = [Vector2 zero];
	Vector2 *nearestVertex = [Vector2 vectorWithVector:aaRectangle.position];
	
	float halfWidth = aaRectangle.width / 2;
	float halfHeight = aaRectangle.height / 2;
	
	// Calculate overlap with all sides.
	float leftDifference = (aaRectangle.position.x - halfWidth) - (particle.position.x + particle.radius);
	if (leftDifference > 0) return relaxDistance;
	
	float rightDifference = (particle.position.x - particle.radius) - (aaRectangle.position.x + halfWidth);
	if (rightDifference > 0) return relaxDistance;
	
	float topDifference = (aaRectangle.position.y - halfHeight) - (particle.position.y + particle.radius);
	if (topDifference > 0) return relaxDistance;
	
	float bottomDifference = (particle.position.y - particle.radius) - (aaRectangle.position.y + halfHeight);
	if (bottomDifference > 0) return relaxDistance;
	
	// Particle is under all sides.
	// Find the voronoi region's nearest vertex.
	BOOL horizontalyInside = NO;
	BOOL verticalyInside = NO;
	
	if (particle.position.x < aaRectangle.position.x - halfWidth) {
		nearestVertex.x -= halfWidth;
	} else if (particle.position.x > aaRectangle.position.x + halfWidth) {
		nearestVertex.x += halfWidth;
	} else {
		horizontalyInside = YES;
	}
	
	if (particle.position.y < aaRectangle.position.y - halfHeight) {
		nearestVertex.y -= halfHeight;
	} else if (particle.position.y > aaRectangle.position.y + halfHeight) {
		nearestVertex.y += halfHeight;
	} else {
		verticalyInside = YES;
	}
	
	if (!horizontalyInside && !verticalyInside) {
		// We have a possible collision with an edge vertex.
		Vector2 *particleVertex = [Vector2 subtract:nearestVertex by:particle.position];
		float vertexDistance = [particleVertex length];
		if (vertexDistance > particle.radius) {
			return relaxDistance;
		} else {
			return [[particleVertex normalize] multiplyBy:particle.radius - vertexDistance];
		}
	}
	
	// Find the smallest difference per axis.
	if (leftDifference > rightDifference) {
		relaxDistance.x = -leftDifference;
	} else {
		relaxDistance.x = rightDifference;
	}
	
	if (topDifference > bottomDifference) {
		relaxDistance.y = -topDifference;
	} else {
		relaxDistance.y = bottomDifference;
	}
	
	// Find the smallest difference between axises;
	if (fabsf(relaxDistance.x) < fabsf(relaxDistance.y)) {
		relaxDistance.y = 0;
	} else {
		relaxDistance.x = 0;
	}
	
	
	return relaxDistance;
}

@end
