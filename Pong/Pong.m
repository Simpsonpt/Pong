//
//  Pong.m
//  Pong
//
//  Created by Renato Rodrigues on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Pong.h"
#import "Retronator.Pong.h"

@implementation Pong

- (id) init {
    if (self = [super init]) {
        graphics = [[GraphicsDeviceManager alloc] initWithGame:self];
    }
    return self;
}

- (void) initialize {
	// Create all levels.
	//levels = [[NSMutableArray alloc] init];
	//[levels addObject:[[[PongLevel alloc] init] autorelease]];
	levelClasses = [[NSMutableArray alloc] init];
	[levelClasses addObject:[PongLevel class]];

	
	// Start in first level.
	//[self loadLevel:[levels objectAtIndex:0]];
	[self loadMultiplayerLevel:[levelClasses objectAtIndex:0]];
	
	// Initialize all components.
	[super initialize];
}

- (void) loadLevel:(Level *)level {
	
	// Remove the current renderer if it exists.
	if (renderer) {
		[self.components removeComponent:renderer];
		[renderer release];
	}
	
	// Create a new renderer for the new scene.
	renderer = [[Renderer alloc] initWithGame:self level:level];
	[self.components addComponent:renderer];
}

- (void) loadMultiplayerLevel:(Class)levelClass {	
	// Unload the current gameplay.
	if (currentGameplay) {
		[self.components removeComponent:currentGameplay];
		[currentGameplay release];
	}
	
	// Allocate and initialize new gameplay object and add it to components.
	currentGameplay = [[Gameplay alloc] initMultiplayerWithGame:self levelClass:levelClass];
	[self.components addComponent:currentGameplay];
}

- (void) dealloc
{
	//[levels release];
	[levelClasses release];
    [graphics release];
    [super dealloc];
}

@end