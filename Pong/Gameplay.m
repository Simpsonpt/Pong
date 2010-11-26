//
//  Gameplay.m
//  Pong
//
//  Created by Renato Rodrigues on 11/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Gameplay.h"
#import "Retronator.Pong.h"


@interface Gameplay ()

- (void) initWithGame:(Game *)theGame LevelClass:(Class)levelClass;

@end


@implementation Gameplay

- (id) initMultiplayerWithGame:(Game *)theGame levelClass:(Class)levelClass
{
	self = [super initWithGame:theGame];
	if (self != nil) {
		[self initWithGame:theGame LevelClass:levelClass];
		self.updateOrder = 4;
		
		// Create players
		topPlayer = [[HumanPlayer alloc] initWithPad:level.topPlayer scene:level.scene position:PlayerPositionTop game:self.game];
		bottomPlayer = [[HumanPlayer alloc] initWithPad:level.bottomPlayer scene:level.scene position:PlayerPositionBottom game:self.game];
		
	}
	return self;
}

@synthesize level;

- (id) initSinglePlayerWithGame:(Game *)theGame levelClass:(Class)levelClass aiClass:(Class)aiClass
{
	self = [super initWithGame:theGame];
	if (self != nil) {
		[self initWithGame:theGame LevelClass:levelClass];	
		self.updateOrder = 4;
		
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
	level.updateOrder=3;
	[self.game.components addComponent:level];
	
	// Create a new renderer for the new scene and add it to components.
	renderer = [[Renderer alloc] initWithGame:self.game level:level];
	renderer.updateOrder = 2;
	[self.game.components addComponent:renderer];
	
	physics = [[PhysicsEngine alloc] initWithGame:self.game level:level];
	physics.updateOrder = 1;
	[self.game.components addComponent:physics];
	
	level.p1_points,level.p2_points = [Constants getInstance].startPoints;
	level.type=0;
	[level resetLevelWithBallSpeed:200];
}

- (void) resetL
{
	level.p1_points = [Constants getInstance].startPoints;
	level.p2_points = [Constants getInstance].startPoints;
	//printf("P1: %d P2: %d",level.p1_points,level.p2_points);
	level.Lnum++;
	//Just for the Pads
	level.type++;
	
	level.save=NO;
	level.bonusStatus=NO;
	level.contTouches=0;
	level.lastPlayer=1;
	
	level.topPlayer.position.x = 155;
	level.topPlayer.position.y = 70;
	
	level.bottomPlayer.position.x = 155;
	level.bottomPlayer.position.y = 430;
	
}

- (void) updateWithGameTime:(GameTime *)gameTime 
{
	if (level.Lnum==3) 
	{
		[self.game.components removeComponent:physics];
		[level GO];
	}
	else 
	{
		[topPlayer updateWithGameTime:gameTime];
		[bottomPlayer updateWithGameTime:gameTime];

		/*Check Lose Condition.*/
		if (level.ball.position.y > 530 || level.ball.position.y < 65) 
		{
			[level updatePlayerPoints:1];
			[level resetBallWithSpeed:[self calculateCurrentBallSpeed]];
		}
	
		// Check Game Reset Condition.
		if (level.p1_points >= 4 || level.p2_points >= 4)
		{
			[self resetL];
			[level resetLevelWithBallSpeed:[self calculateCurrentBallSpeed]];
		}
	
		/*Condition for Random Bonus, Init Always NO*/
		if(level.bonusStatus && !level.save)
		{
			//320 420
			level.bonus.position.x = [Random intLessThan:250];
			level.bonus.position.y = [Random intLessThan:300];
			if(level.bonus.position.y < 70)
				level.bonus.position.y += 90;
			level.bonusType=[Random intLessThan:5];
			level.save=YES;
		} else if(!level.save) {
			//printf("Uiii!");
			level.bonus.position.x = 0;
			level.bonus.position.y = 0;
		}
		//printf("Calculei as Coord do Bonus! X: %f Y: %f \n", level.bonus.position.x,level.bonus.position.y);	
		//printf("Pos: %f\n",level.ball.position.y);
	}
}

- (float) calculateCurrentBallSpeed {
	return [Constants getInstance].initialBallSpeed + level.Lnum * [Constants getInstance].levelUpBallSpeedIncrease;
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
