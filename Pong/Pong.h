//
//  Pong.h
//  Pong
//
//  Created by Renato Rodrigues on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Retronator.Xni.Framework.Graphics.h"
#import "Retronator.Xni.Framework.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Input.Touch.h"
#import "Retronator.Pong.classes.h"
#import "Retronator.Xni.Framework.Audio.h"

@interface Pong : Game 
{
	GraphicsDeviceManager *graphics;
	
	// Progress
	GameProgress *progress;
	// Game state
	NSMutableArray *stateStack;
	
	/*Gameplay*/
	Gameplay *currentGameplay;
	/*Diferent Levels*/
	NSMutableArray *levels;
	// Opponents
	NSMutableArray *opponentClasses;
	
	//SoundEffect *sfx;
}

@property (nonatomic, readonly) GameProgress *progress;

- (void) pushState:(GameState*)gameState;
- (void) popState;

//- (Class) getLevelClass:(LevelType)type;
//- (Class) getOpponentClass:(OpponentType)type;

- (void) loadMultiplayerLevel:(Class) levelClass;
- (void) loadSinglePlayerLevel:(Class) levelClass opponentClass:(Class)opponentClass;

@end