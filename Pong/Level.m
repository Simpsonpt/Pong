//
//  Level.m
//  Pong
//
//  Created by Renato Rodrigues on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Level.h"
#import "Retronator.Pong.h"
#import "GameCore.Scene.Objects.h"


@implementation Level

- (id) initWithGame:(Game *)theGame
{
	self = [super initWithGame:theGame];
	if (self != nil) {

		scene = [[Scene alloc] init];
		//Background
		background = [[Bg alloc] init];
		//Middle Bar
		md = [[Middle alloc] init];		
		//Players Bar
		topPlayer = [[Pad alloc] init];
		bottomPlayer = [[Pad alloc] init];
		//Game Ball
		ball = [[Ball alloc] init];
		//Random Objects
		bonus = [[Bonus alloc] init];
			
		//Physic for Game Table
		//AALimit *floor = [[[AALimit alloc] initWithLimit:[AxisAlignedHalfPlane axisAlignedHalfPlaneWithDirection:AxisDirectionNegativeY distance:-470]] autorelease];
		AALimit *leftWall = [[[AALimit alloc] initWithLimit:[AxisAlignedHalfPlane axisAlignedHalfPlaneWithDirection:AxisDirectionPositiveX distance:-5]] autorelease];
		AALimit *rightWall = [[[AALimit alloc] initWithLimit:[AxisAlignedHalfPlane axisAlignedHalfPlaneWithDirection:AxisDirectionNegativeX distance:-320]] autorelease];
		//AALimit *ceiling = [[[AALimit alloc] initWithLimit:[AxisAlignedHalfPlane axisAlignedHalfPlaneWithDirection:AxisDirectionPositiveY distance:75]] autorelease];		
				
		[scene addItem:background];
		[scene addItem:md];
		[scene addItem:topPlayer];
		[scene addItem:bottomPlayer];
		[scene addItem:ball];
		[scene addItem:bonus];
		
		//[scene addItem:floor];
		[scene addItem:leftWall];
		[scene addItem:rightWall];
		//[scene addItem:ceiling];
	}
	return self;
}

@synthesize scene, topPlayer, bottomPlayer, ball, bonus, p1_points, p2_points, lastPlayer, type, bonusStatus,bonusType,contTouches,save,Lnum;

- (void) initialize {
	lastPlayer=1;
	bonusStatus=NO;
	save=NO;
	contTouches=0;
	bonusType=2;
	Lnum=0;
	[self reset];
	[super initialize];
}

- (void) GO
{
	[scene clear];
	bonusStatus=YES;
	[scene addItem:background];
	bonusType=6;
	bonus.position.x=110;
	bonus.position.y=250;
	ball.velocity.x=0;
	ball.velocity.y=0;
	[scene addItem:bonus];
}

- (void) reset {}

- (void) resetLevelWithBallSpeed:(float)speed {
	
	//printf("Cona Crlssssss");
	
	// Remove everything from the scene.
	[scene clear];
	
	// Add ball and paddle.
	[scene addItem:background];
	[scene addItem:md];
	[scene addItem:topPlayer];
	[scene addItem:bottomPlayer];
	[scene addItem:ball];
	[scene addItem:bonus];

	AALimit *leftWall = [[[AALimit alloc] initWithLimit:[AxisAlignedHalfPlane axisAlignedHalfPlaneWithDirection:AxisDirectionPositiveX distance:-5]] autorelease];
	AALimit *rightWall = [[[AALimit alloc] initWithLimit:[AxisAlignedHalfPlane axisAlignedHalfPlaneWithDirection:AxisDirectionNegativeX distance:-320]] autorelease];

	[scene addItem:leftWall];
	[scene addItem:rightWall];

	// Reset ball
	//printf("Speed RLWBWS: %f\n",speed);
	[self resetBallWithSpeed:speed];
}

- (void) resetBallWithSpeed:(float)speed 
{
	/*Grab New Ball Positions*/
	if(lastPlayer == 1)
	{
		ball.position.x = topPlayer.position.x + 10;
		ball.position.y = topPlayer.position.y + 10 ;
	} else if (lastPlayer == 2)
	{
		ball.position.x = bottomPlayer.position.x + 20;
		ball.position.y = bottomPlayer.position.y + -30;
		speed *= -1;
	}
	//printf("Speed RBWS: %f\n",speed);
	/*Velocity and Directions of the Ball*/
	ball.velocity.x = ([Random float] - 0.5f) * 10;
	ball.velocity.y = speed;
}

- (void)updatePlayerPoints:(NSInteger)point
{
	if(lastPlayer==1)
		p1_points+=point;
	else if(lastPlayer==2)
		p2_points+=point;
	
	printf("Player 1 Points: %d\n", p1_points);
	printf("Player 2 Points: %d\n", p2_points);
}

- (void) dealloc
{
	[background release];
	[topPlayer release];
	[bottomPlayer release];
	[ball release];
	[bonus release];
	[scene release];
	[super dealloc];
}

@end