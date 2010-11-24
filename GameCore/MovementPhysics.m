//
//  MovementPhysics.m
//  GameCore
//
//  Created by Renato Rodrigues on 11/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GameCore.Scene.h"
#import "GameCore.Scene.Objects.h"
#import "MovementPhysics.h"

@implementation MovementPhysics

+ (void) simulateMovementOn:(id<NSObject>)item withElapsed:(NSTimeInterval)elapsed {
	id<IMovable> movable = [item conformsToProtocol:@protocol(IMovable)] ? (id<IMovable>)item : nil;
	
	if (movable) {
		[movable.position add:[Vector2 multiply:movable.velocity by:elapsed]];
	}	
}

@end

