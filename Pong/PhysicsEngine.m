//
//  PhysicsEngine.m
//  Pong
//
//  Created by Renato Rodrigues on 11/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Retronator.Pong.h"
#import "PhysicsEngine.h"
#import "GameCore.Graphics.h"
#import "GameCore.Physics.h"

@implementation PhysicsEngine

- (id) initWithGame:(Game *)theGame level:(Level *)theLevel {
	if (self = [super initWithGame:theGame]) {
		level = theLevel;
	}
	return self;
}

- (void) updateWithGameTime:(GameTime *)gameTime 
{
	[MovementPhysics simulateMovementOn:level.ball withElapsed:gameTime.elapsedGameTime];
	
	NSMutableIndexSet *bonusArray = [NSMutableIndexSet indexSet];
	BOOL update=NO;
	NSInteger point=0;
	//printf("Num Toques: %d\n",level.contTouches);
	for (id item in level.scene) {
		if (item != level.ball) {
			if([Collision collisionBetween:level.ball and:item] && [item isKindOfClass:[Bonus class]])	
			{
				[bonusArray addIndex:5];
				update=YES;
				point=5;
				level.bonusStatus=NO;
				level.save=NO;
			}
			if([Collision collisionBetween:level.ball and:level.topPlayer])
			{
				level.lastPlayer=1;
				if(!level.bonusStatus)
					level.contTouches++;
				if(level.contTouches==3 && !level.bonusStatus)
				{
					//printf("Entrei no TopPlayer\n");
					level.bonusStatus=YES;
					level.contTouches=0;
				}
			}
			if([Collision collisionBetween:level.ball and:level.bottomPlayer])
			{
				level.lastPlayer=2;
				if(!level.bonusStatus)
					level.contTouches++;
				if(level.contTouches==3 && !level.bonusStatus)
				{
					//printf("Entrei no BottomPlayer\n");
					level.bonusStatus=YES;
					level.contTouches=0;
				}
			}
			[Collision collisionBetween:level.ball and:item];				
		}
	}
	
	if(update)
	{
		[level updatePlayerPoints:point];
		//[level.scene removeObjectsAtIndex:bonusArray];
		level.bonus.position.x = 500;
		level.bonus.position.x = 500;
	}
}
	
@end
