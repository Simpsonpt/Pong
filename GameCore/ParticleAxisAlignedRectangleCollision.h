//
//  ParticleAxisAlignedRectangleCollision.h
//  GameCore
//
//  Created by FRI Multimedija on 11/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameCore.Scene.Objects.classes.h"

@interface ParticleAxisAlignedRectangleCollision : NSObject {
	
}

+ (BOOL) collisionBetween:(id<IParticleCollider>)particle and:(id<IAxisAlignedRectangleCollider>)axisAlignedRectangle;
+ (BOOL) detectCollisionBetween:(id<IParticleCollider>)particle and:(id<IAxisAlignedRectangleCollider>)axisAlignedRectangle;
+ (void) resolveCollisionBetween:(id<IParticleCollider>)particle and:(id<IAxisAlignedRectangleCollider>)axisAlignedRectangle;


@end
