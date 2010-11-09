//
//  Gameplay.m
//  Pong
//
//  Created by Renato Rodrigues on 11/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Gameplay.h"
#import "Retronator.Pong.h"
//#import "HumanPlayer.h"

@interface Gameplay ()

- (void) initWithGame:(Game *)theGame LevelClass:(Class)levelClass;

@end


@implementation Gameplay

- (id) initMultiplayerWithGame:(Game *)theGame levelClass:(Class)levelClass
{
	self = [super initWithGame:theGame];
	if (self != nil) {
		[self initWithGame:theGame LevelClass:levelClass];
		self.updateOrder = 10;
		
		// Create players
		topPlayer = [[HumanPlayer alloc] initWithPad:level.topPlayer scene:level.scene position:PlayerPositionTop game:self.game];
		bottomPlayer = [[HumanPlayer alloc] initWithPad:level.bottomPlayer scene:level.scene position:PlayerPositionBottom game:self.game];
		
	}
	return self;
}

- (id) initSinglePlayerWithGame:(Game *)theGame levelClass:(Class)levelClass aiClass:(Class)aiClass
{
	self = [super initWithGame:theGame];
	if (self != nil) {
		[self initWithGame:theGame LevelClass:levelClass];	
		
		// Create players
		topPlayer = [[aiClass alloc] initWithPad:level.topPlayer scene:level.scene position:PlayerPositionTop];
		bottomPlayer = [[HumanPlayer alloc] initWithPad:level.bottomPlayer scene:level.scene position:PlayerPositionBottom game:self.game];		
		
	}
	return self;
}

- (void) initWithGame:(Game *)theGame LevelClass:(Class)levelClass
{
	// Allocate and initialize a new level and add it to components.
	level = [[levelClass alloc] initWithGame:self.game];
	[self.game.components addComponent:level];
	
	// Create a new renderer for the new scene and add it to components.
	renderer = [[Renderer alloc] initWithGame:self.game level:level];
	[self.game.components addComponent:renderer];
	
	physics = [[PhysicsEngine alloc] initWithGame:self.game level:level];
	physics.updateOrder = 20;
	[self.game.components addComponent:physics];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
	[topPlayer updateWithGameTime:gameTime];
	[bottomPlayer updateWithGameTime:gameTime];
}

- (void) dealloc
{
	[self.game.components removeComponent:level];
	[self.game.components removeComponent:renderer];
	[self.game.components removeComponent:physics];
	[level release];
	[renderer release];
	[physics release];
	[topPlayer release];
	[bottomPlayer release];
	[super dealloc];
}

@end
