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

<<<<<<< HEAD
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
					printf("Entrei no TopPlayer\n");
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
					printf("Entrei no BottomPlayer\n");
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
=======
- (void) updateWithGameTime:(GameTime *)gameTime {

	// Physics
	//Vector2 *gravity = [Vector2 vectorWithX:0 y:50 * gameTime.elapsedGameTime];
	//[MovementPhysics simulateMovementOn:level.ball withElapsed:gameTime.elapsedGameTime];
	
	for(id item in level.scene)
	{
		id <IVelocity> itemWithVelocity = [item conformsToProtocol:@protocol(IVelocity)] ? level.ball : nil;
		if(itemWithVelocity && [item isKindOfClass:[Ball class]])
			[MovementPhysics simulateMovementOn:item withElapsed:gameTime.elapsedGameTime];
	}
	
	//id <IVelocity> itemWithVelocity = [level.ball conformsToProtocol:@protocol(IVelocity)] ? level.ball : nil;
	
	//if (itemWithVelocity)
	//{
		// Simulate gravity.
		//[itemWithVelocity.velocity add:gravity];
	//}
	
	for (id item1 in level.scene) 
	{
		for (id item2 in level.scene) 
		{
			//No coliisions with BG
			if([item1 isKindOfClass:[Bg class]] || [item2 isKindOfClass:[Bg class]])
				continue;
//			//if([item1 isKindOfClass:[Bg class]] && [item2 isKindOfClass:[Pad class]] || [item1 isKindOfClass:[Pad class]] || [item2 isKindOfClass:[Bg class]])
//				//continue;
			if (item1 != item2)
				[Collision collisionBetween:item1 and:item2];
		}
	}


//Collisions	
//	NSMutableIndexSet *bonusArray = [NSMutableIndexSet indexSet];
//	NSUInteger contA,contB = 0;
//
//	for(id item1 in level.scene)
//	{
//		contB = 0;
//		//printf("ContA: %d\n", contA);
//		for(id item2 in level.scene)
//		{
//			//No coliisions with BG
//			if([item1 isKindOfClass:[Bg class]] || [item2 isKindOfClass:[Bg class]])
//				continue;			
//			if (item1 != item2) 
//			{
//				//If Exists
//				if([Collision collisionBetween:item1 and:item2]){
//					if ([item1 isKindOfClass:[Bonus class]] && [item2 isKindOfClass:[Ball class]]) {
//						[bonusArray addIndex:contA];
//					} else if ([item2 isKindOfClass:[Bonus class]] && [item1 isKindOfClass:[Ball class]]) {
//						[bonusArray addIndex:contB];
//					}
//				}	
//			}
//			//printf("ContB: %d\n", contB);
//			contB++;
//		}
//		contA++;
//	}
//	
//	[level.scene removeObjectsAtIndex:bonusArray];
	
	[super updateWithGameTime:gameTime];
>>>>>>> 81162655290a32b13e3cb5e94a1543c95a717c57
}
	
@end
