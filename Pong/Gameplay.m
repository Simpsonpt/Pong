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
//- (void) startInitWithLevelClass:(Class)levelClass;
//- (void) finishInit;

@end

@implementation Gameplay

- (id) initMultiplayerWithGame:(Game *)theGame levelClass:(Class)levelClass
{
	self = [super initWithGame:theGame];
	if (self != nil) {
		[self initWithGame:theGame LevelClass:levelClass];
		
		/*Create Players*/
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
		//[self initWithGame:theGame];	
		//self.updateOrder = 4;
		[self initWithGame:theGame LevelClass:levelClass];

		// Create players
		//topPlayer = [[aiClass alloc] initWithPad:level.topPlayer scene:level.scene position:PlayerPositionTop];
//		topPlayer = [[aiClass alloc] initWithGame:self.game pad:level.topPlayer level:level position:PlayerPositionTop];
		topPlayer = [[aiClass alloc] initWithGame:self.game scene:level.scene 
											  pad:level.topPlayer level:level position:PlayerPositionTop];

		bottomPlayer = [[HumanPlayer alloc] initWithPad:level.bottomPlayer scene:level.scene position:PlayerPositionBottom game:self.game];		
		
	}
	return self;
}

/*- (id) initSinglePlayerWithGame:(Game *)theGame levelClass:(Class)levelClass aiClass:(Class)aiClass
{
	self = [super initWithGame:theGame];
	if (self != nil) {		
		[self startInitWithLevelClass:levelClass];
		
		// Create an ai and a human player.
		topPlayer = [[aiClass alloc] initWithPad:level.topPlayer scene:level.scene position:PlayerPositionTop];
		bottomPlayer = [[HumanPlayer alloc] initWithPad:level.bottomPlayer scene:level.scene position:PlayerPositionBottom game:self.game];
		
		// Add AI renderer for debugging.
		AIRenderer *aiRenderer = [[[AIRenderer alloc] initWithGame:self.game aiPlayer:(AIPlayer*)topPlayer] autorelease];
		aiRenderer.drawOrder = 1;
		[self.game.components addComponent:aiRenderer];
		
		[self finishInit];
	}
	return self;
}*/

- (void) initWithGame:(Game *)theGame LevelClass:(Class)levelClass
{
	self = [super initWithGame:theGame];
	if (self != nil) 
	{
		level = [[levelClass alloc] initWithGame:self.game];
		physics = [[PhysicsEngine alloc] initWithGame:self.game level:level];
		renderer = [[Renderer alloc] initWithGame:self.game gameplay:self];
	
		/*Update Orders*/
		topPlayer.updateOrder = 0;	
		bottomPlayer.updateOrder = 0;
		physics.updateOrder = 1;
		level.updateOrder = 2;
		self.updateOrder = 4;
		
		[self.game.components addComponent:level];
		[self.game.components addComponent:physics];
		[self.game.components addComponent:renderer];	
	}
}

- (void) initialize 
{
	//[player setCamera:renderer.camera];
	[self reset];
	[super initialize];
}

- (void) reset 
{
	/*Initial Pad (Normal)*/
	level.PadType=0;
	
	[level resetLevelWithBallSpeed:200];
	
	printf("#*# Level %d #*#\n", level.Lnum);
}

- (void) resetLevel
{
	level.p1_points = [Constants getInstance].startPoints;
	level.p2_points = [Constants getInstance].startPoints;
	//printf("P1: %d P2: %d",level.p1_points,level.p2_points);
	
	printf("#*# Level %d #*#\n", level.Lnum+1);
	level.Lnum++;
	
	//Just for the Pads
	level.PadType++;
	
	if (level.Lnum == 1) 
	{
		level.topPlayer.width = 53;
		level.topPlayer.height = 22;
		
		level.bottomPlayer.width = 53;
		level.bottomPlayer.height = 22;
	} else if (level.Lnum == 2)
	{
		level.topPlayer.width = 125;
		level.topPlayer.height = 20;
		
		level.bottomPlayer.width = 125;
		level.bottomPlayer.height = 20;
	}
	
	level.save=NO;
	level.bonusStatus=NO;
	level.contTouches=0;
	level.lastPlayer=1;
	
	level.topPlayer.position.x = 155;
	level.topPlayer.position.y = 63;
	
	level.bottomPlayer.position.x = 155;
	level.bottomPlayer.position.y = 430;
	
}

- (void) updateWithGameTime:(GameTime *)gameTime 
{
	if (level.Lnum==3) 
	{
		[self.game.components removeComponent:physics];
		[level GameOver];
	}
	else 
	{
		/*Move Pads In The Game*/
		[topPlayer updateWithGameTime:gameTime];
		[bottomPlayer updateWithGameTime:gameTime];

		/*Check Lose Condition.*/
		for (id item in level.scene)
		{
			if ([item isKindOfClass:[Ball class]]) 
			{
				Ball *temp = (Ball*)item;
				if (temp.position.y > 530)
				{
					level.lastPlayer=1;
					[level updatePlayerPoints:1];
					[level resetBallWithSpeed:[self calculateCurrentBallSpeed]];
				} else if(temp.position.y < 65) 
				{
					level.lastPlayer=2;
					[level updatePlayerPoints:1];
					[level resetBallWithSpeed:[self calculateCurrentBallSpeed]];			
				}				
			}
		}
		/*if (level.ball.position.y > 530)
		{
			level.lastPlayer=1;
			[level updatePlayerPoints:1];
			[level resetBallWithSpeed:[self calculateCurrentBallSpeed]];
		} else if(level.ball.position.y < 65) 
		{
			level.lastPlayer=2;
			[level updatePlayerPoints:1];
			[level resetBallWithSpeed:[self calculateCurrentBallSpeed]];			
		}*/
	
		/*Check Game Reset Condition.*/
		if (level.p1_points >= 26 || level.p2_points >= 26)
		{
			[self resetLevel];
			[level resetLevelWithBallSpeed:[self calculateCurrentBallSpeed]];
		}
		/*One Bonus in the Game*/
		if(level.bonusStatus)
		{
			for (id item in level.scene)
			{
				if ([item isKindOfClass:[Pad class]]) 
				{
					//printf("Stop Bonus YES\n");
					Pad *temp = (Pad*)item;
					temp.stopBonus=YES;
				}
			}
		}
		else
		{
			for (id item in level.scene)
			{
				if ([item isKindOfClass:[Pad class]]) 
				{
					//printf("Stop Bonus NO\n");
					Pad *temp = (Pad*)item;
					temp.stopBonus=NO;
				}
			}
		}
		
		/*Kind of Bonus Try
		if(level.ball.bumm)
		{
			for (id item in level.scene)
			{
				if ([item isKindOfClass:[ExpandPadSizeBonus class]]) 
				{
					printf("Expanding\n");
					for (id item in level.scene)
					{
						if ([item isKindOfClass:[Pad class]]) 
						{
							Pad *temp = (Pad*)item;
							if(temp.top)
								level.topPlayer.type=2;
							else {
								level.bottomPlayer.type=2;
							}

						}
					}
				}
			}
		}*/
		
		
		
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
