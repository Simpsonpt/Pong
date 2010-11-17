//
//  ParticleParticleCollision.h
//  GameCore
//
//  Created by Renato Rodrigues on 11/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GameCore.Scene.Objects.classes.h"

@interface ParticleParticleCollision : NSObject {
	
}

+ (BOOL) collisionBetween:(id<IParticleCollider>)particle1 and:(id<IParticleCollider>)particle2;

+ (BOOL) detectCollisionBetween:(id<IParticleCollider>)particle1 and:(id<IParticleCollider>)particle2;
+ (void) resolveCollisionBetween:(id<IParticleCollider>)particle1 and:(id<IParticleCollider>)particle2;

@end
