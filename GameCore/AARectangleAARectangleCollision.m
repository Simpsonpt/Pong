//
//  AARectangleAARectangleCollision.m
//  GameCore
//
//  Created by Renato Rodrigues on 11/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AARectangleAARectangleCollision.h"
#import "GameCore.Scene.Objects.h"
#import "GameCore.Physics.h"

@implementation AARectangleAARectangleCollision

+ (BOOL) detectCollisionBetween:(id<IAARectangleCollider>)aaRectangle1 and:(id<IAARectangleCollider>)aaRectangle2 {
	float horizontalDistancle = fabsf(aaRectangle1.position.x-aaRectangle2.position.x);
	float verticalDistancle = fabsf(aaRectangle1.position.y-aaRectangle2.position.y);
	
	return horizontalDistancle < aaRectangle1.width/2 + aaRectangle2.width/2 && verticalDistancle < aaRectangle1.height/2 + aaRectangle2.height/2;
}

+ (void) resolveCollisionBetween:(id<IAARectangleCollider>)aaRectangle1 and:(id<IAARectangleCollider>)aaRectangle2 {
	// RELAXATION STEP
	
	// First we relax the collision, so the two objects don't collide any more.
	// We need to calculate by how much to move them apart. We will move them in the shortest direction
	// possible which could be either horizontal or vertical.
	float horizontalDifference = aaRectangle1.position.x-aaRectangle2.position.x;
	float horizontalCollidedDistance = fabsf(horizontalDifference);
	float horizontalMinimumDistance = aaRectangle1.width/2 + aaRectangle2.width/2;
	float horizontalRelaxDistance = horizontalMinimumDistance - horizontalCollidedDistance;
	
	float verticalDifference = aaRectangle1.position.y-aaRectangle2.position.y;
	float verticalCollidedDistance = fabsf(verticalDifference);
	float verticalMinimumDistance = aaRectangle1.height/2 + aaRectangle2.height/2;
	float verticalRelaxDistance = verticalMinimumDistance - verticalCollidedDistance;
	
	Vector2 *collisionNormal;
	float relaxDistance;
	
	if (horizontalRelaxDistance < verticalRelaxDistance) {
		relaxDistance = horizontalRelaxDistance;
		collisionNormal = [Vector2 vectorWithX:horizontalDifference < 0 ? 1 : -1 y:0];
	} else {
		relaxDistance = verticalRelaxDistance;
		collisionNormal = [Vector2 vectorWithX:0 y:verticalDifference < 0 ? 1 : -1];		
	}
	
	Vector2 *relaxDistanceVector = [Vector2 multiply:collisionNormal by:relaxDistance];
	
	[Collision relaxCollisionBetween:aaRectangle1 and:aaRectangle2 by:relaxDistanceVector];
	
	// ENERGY EXCHANGE STEP
	
	// In a collision, energy is exchanged only along the collision normal.
	// For particles this is simply the line between both centers.
	[Collision exchangeEnergyBetween:aaRectangle1 and:aaRectangle2 along:collisionNormal];
}

@end
