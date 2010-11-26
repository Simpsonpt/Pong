//
//  Collision.m
//  GameCore
//
//  Created by Renato Rodrigues on 11/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GameCore.Scene.Objects.h"
#import "GameCore.Physics.h"
#import "Collision.h"

@implementation Collision

+ (BOOL) collisionBetween:(id)item1 and:(id)item2 {
	id<IParticleCollider> item1Particle = [item1 conformsToProtocol:@protocol(IParticleCollider)] ? item1 : nil;
	id<IParticleCollider> item2Particle = [item2 conformsToProtocol:@protocol(IParticleCollider)] ? item2 : nil;
	
	//id<IAxisAlignedHalfPlaneCollider> item1AAHalfPlaneCollider = [item1 conformsToProtocol:@protocol(IAxisAlignedHalfPlaneCollider)] ? item1 : nil;
	id<IAxisAlignedHalfPlaneCollider> item2AAHalfPlaneCollider = [item2 conformsToProtocol:@protocol(IAxisAlignedHalfPlaneCollider)] ? item2 : nil;
	
	//id<IAxisAlignedRectangleCollider> item1AARectangleCollider = [item1 conformsToProtocol:@protocol(IAxisAlignedRectangleCollider)] ? item1 : nil;
	id<IAxisAlignedRectangleCollider> item2AARectangleCollider = [item2 conformsToProtocol:@protocol(IAxisAlignedRectangleCollider)] ? item2 : nil;

	
	if (item1Particle && item2Particle) {
		return [ParticleParticleCollision collisionBetween:item1Particle and:item2Particle];
	} else if (item1Particle && item2AAHalfPlaneCollider) {
		return [ParticleAxisAlignedHalfPlaneCollision collisionBetween:item1Particle and:item2AAHalfPlaneCollider];
	} else if (item2Particle && item2AAHalfPlaneCollider) {
		return [ParticleAxisAlignedHalfPlaneCollision collisionBetween:item2Particle and:item2AAHalfPlaneCollider];
	} else if (item1Particle && item2AARectangleCollider) {
		return [ParticleAxisAlignedRectangleCollision collisionBetween:item1Particle and:item2AARectangleCollider];
	}
	return NO;
}

+ (void) relaxCollisionBetween:(id)item1 and:(id)item2 by:(Vector2*)relaxDistance {
	// We have to ask, how far we move each item. The default is each half way, but we try to take
	// the mass of the colliders into account, if items have mass.
	float relaxPercentage1 = 0.5f;
	float relaxPercentage2 = 0.5f;
	
	// Determine mass of the colliders. If an item has no mass it is considered static,
	// so we should move only the other one. If both have mass, we move them reciprocal to their mass.
	// So a heavier item will move a little and a lighter item more.
	id<IMass> itemWithMass1 = [item1 conformsToProtocol:@protocol(IMass)] ? item1 : nil;
	id<IMass> itemWithMass2 = [item2 conformsToProtocol:@protocol(IMass)] ? item2 : nil;
	
	if (itemWithMass1 && itemWithMass2) {
		float mass1 = itemWithMass1.mass;
		float mass2 = itemWithMass2.mass;
		relaxPercentage1 = mass2 / (mass1 + mass2);
		relaxPercentage1 = mass1 / (mass1 + mass2);
	} else if (itemWithMass1) {
		relaxPercentage1 = 1;
		relaxPercentage2 = 0;
	} else {
		relaxPercentage1 = 0;
		relaxPercentage2 = 1;
	}
	
	// Now we need to turn the percentages into real distances.	
	id<IPosition> itemWithPosition1 = [item1 conformsToProtocol:@protocol(IPosition)] ? ((id<IPosition>)item1) : nil;
	id<IPosition> itemWithPosition2 = [item2 conformsToProtocol:@protocol(IPosition)] ? ((id<IPosition>)item2) : nil;
	
	if (itemWithPosition1) {
		[itemWithPosition1.position subtract:[Vector2 multiply:relaxDistance by:relaxPercentage1]];
	}
	if (itemWithPosition2) {
		[itemWithPosition2.position add:[Vector2 multiply:relaxDistance by:relaxPercentage2]];		
	}
}

+ (void) exchangeEnergyBetween:(id<NSObject>)item1 and:(id<NSObject>)item2 along:(Vector2*)collisionNormal {
	// We calculate exchange of energy in a collision with respect to items' momentum. Momentum is mass times
	// velocity so the items need to conform both to IMass and IVelocity. If one of the items does not, it's
	// considered as though there is a collision with a static object.
	id <IVelocity> itemWithVelocity1 = [item1 conformsToProtocol:@protocol(IVelocity)] ? (id<IVelocity>)item1 : nil;
	id <IVelocity> itemWithVelocity2 = [item2 conformsToProtocol:@protocol(IVelocity)] ? (id<IVelocity>)item2 : nil;
	
	Vector2 *velocity1 = itemWithVelocity1 ? itemWithVelocity1.velocity : nil;
	Vector2 *velocity2 = itemWithVelocity2 ? itemWithVelocity2.velocity : nil;
	
	// In a collision, energy is exchanged only along the collision normal, so we take into account only
	// the speed in the direction of the normal.
	float speed1 = velocity1 ? [Vector2 dotProductOf:velocity1 with:collisionNormal] : 0;
	float speed2 = velocity2 ? [Vector2 dotProductOf:velocity2 with:collisionNormal] : 0;
	float speedDifference = speed1 - speed2;
	
	// Make sure the objects are coming towards each other. If they are coming together the collision has already been delt with.
	if (speedDifference < 0) {
		//NSLog(@"Second");
		return;
	}
	
	// We can now calculate the impact impulse (the change of momentum). We take into account the cooeficient
	// of restitution which controls how elastic the collision is. We use a simplified model in which the total
	// COR is just the multiplication of coeficients of both items.
	float cor1 = [item1 conformsToProtocol:@protocol(ICoefficientOfRestitution)] ? ((id<ICoefficientOfRestitution>)item1).coefficientOfRestitution : 1;
	float cor2 = [item2 conformsToProtocol:@protocol(ICoefficientOfRestitution)] ? ((id<ICoefficientOfRestitution>)item2).coefficientOfRestitution : 1;	
	float cor = cor1 * cor2;
	
	// We prepare mass inverses. If the object has no mass we consider it is static, which is the same as having
	// infinite mass. The inverse will then be zero.
	float mass1inverse = [item1 conformsToProtocol:@protocol(IMass)] ? 1.0f / ((id<IMass>)item1).mass : 0;
	float mass2inverse = [item2 conformsToProtocol:@protocol(IMass)] ? 1.0f / ((id<IMass>)item2).mass : 0;	
	
	// We derive the formula for the impact as the change of momentum.
	float impact = -(cor + 1) * speedDifference / (mass1inverse + mass2inverse);
	
	// If we divide the impact with item's mass we get the change in speed. We apply it
	// along the collisions normal. We only do this for non-static items.
	if (mass1inverse > 0 && itemWithVelocity1) {
		[itemWithVelocity1.velocity add:[Vector2 multiply:collisionNormal by:impact * mass1inverse]];
	}
	
	if (mass1inverse > 0 && itemWithVelocity2) {
		[itemWithVelocity2.velocity subtract:[Vector2 multiply:collisionNormal by:impact * mass2inverse]];
	}	
}

+ (BOOL) shouldResolveCollisionBetween:(id)item1 and:(id)item2 {
	id<ICustomCollider> customCollider1 = [item1 conformsToProtocol:@protocol(ICustomCollider)] ? item1 : nil;
	id<ICustomCollider> customCollider2 = [item2 conformsToProtocol:@protocol(ICustomCollider)] ? item2 : nil;
	
	BOOL result = YES;
	
	if (customCollider1) {
		result &= [customCollider1 collidingWithItem:item2];
	}
	
	if (customCollider2) {
		result &= [customCollider2 collidingWithItem:item1];
	}
	
	return result;
}

+ (void) reportCollisionBetween:(id)item1 and:(id)item2 {
	id<ICustomCollider> customCollider1 = [item1 conformsToProtocol:@protocol(ICustomCollider)] ? item1 : nil;
	id<ICustomCollider> customCollider2 = [item2 conformsToProtocol:@protocol(ICustomCollider)] ? item2 : nil;
	
	if (customCollider1) {
		[customCollider1 collidedWithItem:item2];
	}
	
	if (customCollider2) {
		[customCollider2 collidedWithItem:item1];
	}
}



@end

