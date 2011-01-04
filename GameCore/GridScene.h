//
//  GridScene.h
//  GameCore
//
//  Created by Renato Rodrigues on 1/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Scene.h"

@interface GridScene : Scene {
	NSMutableDictionary *grid;
}

- (NSArray*) getItemsAt:(XniPoint*)gridCoordinate;
- (NSArray*) getItemsAround:(XniPoint*)gridCoordinate neighbourDistance:(int)distance;

// Override this if you calculate grid coordinates form something other than IPosition or Vector2.
- (XniPoint*) calculateGridCoordinateForItem:(id)item;

@end
