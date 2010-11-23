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

+ (BOOL) collisionBetween:(id)item1 and:(id)item2;

+ (void) relaxCollisionBetween:(id)item1 and:(id)item2 by:(Vector2*)relaxDistance;

+ (void) exchangeEnergyBetween:(id)item1 and:(id)item2 along:(Vector2*)collisionNormal;

+ (BOOL) shouldResolveCollisionBetween:(id)item1 and:(id)item2;

+ (void) reportCollisionBetween:(id)item1 and:(id)item2;

@end

