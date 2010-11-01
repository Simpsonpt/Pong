//
//  Pong.m
//  Pong
//
//  Created by Renato Rodrigues on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

//#import "Pong.h"
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
	levels = [[NSMutableArray alloc] init];
	[levels addObject:[[[PongLevel alloc] init] autorelease]];
	
	// Start in first level.
	[self loadLevel:[levels objectAtIndex:0]];
	
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

- (void) dealloc
{
	[levels release];
    [graphics release];
    [super dealloc];
}

@end