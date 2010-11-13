//
//  ParticleAxisAlignedHalfPlaneCollision.h
//  GameCore
//
//  Created by Renato Rodrigues on 11/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ParticleAxisAlignedHalfPlaneCollision : NSObject {
	
}

+ (void) collisionBetween:(id<IParticleCollider>)particle and:(id<IAxisAlignedHalfPlaneCollider>)axisAlignedHalfPlane;

+ (BOOL) detectCollisionBetween:(id<IParticleCollider>)particle and:(id<IAxisAlignedHalfPlaneCollider>)axisAlignedHalfPlane;
+ (void) resolveCollisionBetween:(id<IParticleCollider>)particle and:(id<IAxisAlignedHalfPlaneCollider>)axisAlignedHalfPlane;

@end

