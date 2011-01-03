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
		[SoundEngine initializeWithGame:self];
	}
    return self;
}

- (void) initialize 
{
	/*Create All Levels*/
	levels = [[NSMutableArray alloc] init];
	[levels addObject:[PongLevel class]];
	
	/*Start in First Level - MultiPlayer Type*/
	//[self loadMultiplayerLevel:[levels objectAtIndex:0]];
	
	// Add all opponent classes.
	opponentClasses = [[NSMutableArray alloc] init];
	[opponentClasses addObject:[Bot class]];
	
	// Start in first level.
	[self loadSinglePlayerLevel:[levels objectAtIndex:0] opponentClass:[opponentClasses objectAtIndex:0]];
	
	//sfx = [self.content load:@"loop"];
	
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

- (void) loadSinglePlayerLevel:(Class) levelClass opponentClass:(Class)opponentClass {
	// Unload the current gameplay.
	if (currentGameplay) {
		[self.components removeComponent:currentGameplay];
		[currentGameplay release];
	}
	
	// Allocate and initialize new gameplay object and add it to components.
	currentGameplay = [[Gameplay alloc] initSinglePlayerWithGame:self levelClass:levelClass aiClass:opponentClass];
	[self.components addComponent:currentGameplay];	
}

/*- (void) updateWithGameTime:(GameTime *)gameTime
{
	[sfx play];
	SoundEffectInstance *sfxInstance = [sfx createInstance];
	sfxInstance.isLooped = YES;
	[sfxInstance play];	
}*/

- (void) dealloc
{
	[self.components removeComponent:currentGameplay];
	[opponentClasses release];	
    [graphics release];
	[levels release];
	[currentGameplay release];
	
    [super dealloc];
}

@end