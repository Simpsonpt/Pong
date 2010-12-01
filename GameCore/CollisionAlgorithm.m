//
//  CollisionAlgorithm.m
//  GameCore
//
//  Created by Renato Rodrigues on 11/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CollisionAlgorithm.h"
#import "GameCore.Physics.h"

@implementation CollisionAlgorithm

+ (void) collisionBetween:(id)item1 and:(id)item2 {
	[Collision collisionBetween:item1 and:item2 usingAlgorithm:self];
}

+ (BOOL) detectCollisionBetween:(id)item1 and:(id)item2 {return NO;}
+ (void) resolveCollisionBetween:(id)item1 and:(id)item2 {}

@end

