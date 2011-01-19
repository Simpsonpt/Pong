//
//  Pong.m
//  Pong
//
//  Created by Renato Rodrigues on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Pong.h"
#import "Retronator.Pong.h"
#import "GameCore.Control.h"

@implementation Pong

- (id) init {
    if (self = [super init]) {
        graphics = [[GraphicsDeviceManager alloc] initWithGame:self];
		
		[SoundEngine initializeWithGame:self];
		
		[self.components addComponent:[[[TouchPanelHelper alloc] initWithGame:self] autorelease]];
		
		stateStack = [[NSMutableArray alloc] init];
		
		/*Get High Scores*/
		NSNumber *temp;
		temp=[GameProgress loadProgress:1];
		sSingle=[temp integerValue];
		
		temp=[GameProgress loadProgress:2];
		sMulti=[temp integerValue];
		
		printf("Li do File: %i,%i",sSingle,sMulti);
		
		/*Game Type*/
		sp=FALSE;
		mp=FALSE;
		
		/*Sounds Globals*/
		sfxSounds=TRUE;
		gameSounds=TRUE;
	}
    return self;
}



- (void) initialize 
{
	/*All evels*/	
	levelClasses[LevelTypePong] = [PongLevel class];
	//levelClasses[LevelTypeBullfrog] = [BullfrogLevel class];
	 
	/*All Opponents*/
	opponentClasses[OpponentTypeBot] = [Bot class];
	//opponentClasses[OpponentTypeShaman] = [Shaman class]
	 
	MainMenu *mainMenu = [[[MainMenu alloc] initWithGame:self] autorelease];
	[self pushState:mainMenu];
	
	/*Initialize All Components*/
	[super initialize];
}

@synthesize sfxSounds,gameSounds,currentGameplay,sSingle,sMulti,sp,mp;

- (void) pushState:(GameState *)gameState {
	GameState *currentActiveState = [stateStack lastObject];
	[currentActiveState deactivate];
	[self.components removeComponent:currentActiveState];
	
	[stateStack addObject:gameState];
	[self.components addComponent:gameState];
	[gameState activate];
}

- (void) popState {
	GameState *currentActiveState = [stateStack lastObject];
	[stateStack removeLastObject];
	[currentActiveState deactivate];
	[self.components removeComponent:currentActiveState];
	
	currentActiveState = [stateStack lastObject];
	[self.components addComponent:currentActiveState];	
	[currentActiveState activate];
}

- (Gameplay*) loadMultiplayerLevel
{	
	/*Unload The Current Gameplay.*/
	if (currentGameplay) 
	{
		[self.components removeComponent:currentGameplay];
		[currentGameplay release];
	}
	/*Allocate and Initialize New Gameplay object and add it to components.*/
	currentGameplay = [[Gameplay alloc] initMultiplayerWithGame:self levelClass:levelClasses[LevelTypePong]];
	//[self.components addComponent:currentGameplay];
	return currentGameplay;
}

- (Gameplay*) loadSinglePlayerLevel {
	// Unload the current gameplay.
	if (currentGameplay) {
		[self.components removeComponent:currentGameplay];
		[currentGameplay release];
	}
	
	// Allocate and initialize new gameplay object and add it to components.
	currentGameplay = [[Gameplay alloc] initSinglePlayerWithGame:self levelClass:levelClasses[LevelTypePong] aiClass:opponentClasses[OpponentTypeBot]];
	//[self.components addComponent:currentGameplay];	
	return currentGameplay;
}


- (void) updateWithGameTime:(GameTime *)gameTime {
	[super updateWithGameTime:gameTime];
}

- (void) drawWithGameTime:(GameTime *)gameTime {
	[self.graphicsDevice clearWithColor:[Color black]];
	[super drawWithGameTime:gameTime];
}

- (void) dealloc
{
	[self.components removeComponent:currentGameplay];	
	[stateStack release];
    [graphics release];
	[currentGameplay release];
	
    [super dealloc];
}

@end