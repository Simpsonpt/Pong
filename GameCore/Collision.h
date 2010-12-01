//
//  Collision.h
//  GameCore
//
//  Created by Renato Rodrigues on 11/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Collision : NSObject {
	
}

+ (void) collisionBetween:(id)item1 and:(id)item2;

+ (BOOL) shouldResolveCollisionBetween:(id)item1 and:(id)item2;
+ (void) reportCollisionBetween:(id)item1 and:(id)item2;

+ (void) collisionBetween:(id)item1 and:(id)item2 usingAlgorithm:(Class)collisionAlgorithm;

+ (void) relaxCollisionBetween:(id)item1 and:(id)item2 by:(Vector2*)relaxDistance;

+ (void) exchangeEnergyBetween:(id)item1 and:(id)item2 along:(Vector2*)collisionNormal;

@end

