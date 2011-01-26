//
//  Scene.h
//  Pong
//
//  Created by Renato Rodrigues on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IScene.h"

/**
 A simple scene implementation that just uses an array as its backing.
 */
@interface Scene : GameComponent <IScene> {
	// A list of items currently on the scene.
	NSMutableArray *items;
	
	// A list of adds and removes to be executed on the scene.
	NSMutableArray *actions;
	
	Event *itemAdded;
	Event *itemRemoved;
}

@property (nonatomic,retain) NSMutableArray *items;

@end