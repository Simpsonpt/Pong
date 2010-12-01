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

- (void) initialize 
{
	/*Create All Levels*/
	levels = [[NSMutableArray alloc] init];
	[levels addObject:[PongLevel class]];
	
	/*Start in First Level*/
	[self loadMultiplayerLevel:[levels objectAtIndex:0]];
	
	/*Initialize All Components*/
	[super initialize];
}

- (void) loadMultiplayerLevel:(Class)levelClass 
{	
	/*Unload The Current Gameplay.*/
	if (currentGameplay) 
	{
		[self.components removeComponent:currentGameplay];
		[currentGameplay release];
	}
	/*Allocate and Initialize New Gameplay object and add it to components.*/
	currentGameplay = [[Gameplay alloc] initMultiplayerWithGame:self levelClass:levelClass];
	[self.components addComponent:currentGameplay];
}


- (void) dealloc
{
	[self.components removeComponent:currentGameplay];
		
    [graphics release];
	[levels release];
	[currentGameplay release];
	
    [super dealloc];
}

@end