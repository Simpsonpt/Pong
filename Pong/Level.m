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

#import "Menu.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"

@implementation Level

- (id) initWithGame:(Game *)theGame
{
	self = [super initWithGame:theGame];
	if (self != nil) {
		scene = [[Scene alloc] initWithGame:theGame];
		scene.updateOrder = 3;
		[self.game.components addComponent:scene];
		[scene.itemAdded subscribeDelegate:[Delegate delegateWithTarget:self Method:@selector(itemAddedToScene:eventArgs:)]];
		[scene.itemRemoved subscribeDelegate:[Delegate delegateWithTarget:self Method:@selector(itemRemovedFromScene:eventArgs:)]];
		
		/*Init Scene Items*/
		background = [[Bg alloc] init];
		md = [[Middle alloc] init];	
		pimg1 = [[PlayerImg alloc] init];
		pimg2 = [[PlayerImg alloc] init];
		topPlayer = [[Pad alloc] init];
		topPlayer.top = YES;
		bottomPlayer = [[Pad alloc] init];
		bottomPlayer.top = NO;
		ball = [[Ball alloc] init];
	
		defenseSpots = [[NSMutableArray alloc] init];
		offenseSpots = [[NSMutableArray alloc] init];
		
		/*Add Level Limits	
		[scene addItem:[[[LevelLimit alloc] initWithLimit:
						 [AAHalfPlane aaHalfPlaneWithDirection:AxisDirectionPositiveX distance:0] isDeadly:NO] autorelease]];
		[scene addItem:[[[LevelLimit alloc] initWithLimit:
						 [AAHalfPlane aaHalfPlaneWithDirection:AxisDirectionNegativeX distance:-320] isDeadly:NO] autorelease]];
		
		/*Add Items to the Scene
		[scene addItem:background];
		[scene addItem:md];
		[scene addItem:pimg1];
		[scene addItem:pimg2];	
		[scene addItem:topPlayer];
		[scene addItem:bottomPlayer];
		[scene addItem:ball];*/
		
		
		/*Score*/
		FontTextureProcessor *fontProcessor = [[[FontTextureProcessor alloc] init] autorelease];
		retrotype = [self.game.content load:@"Retrotype" processor:fontProcessor];
		fivexfive = [self.game.content load:@"5x5" processor:fontProcessor];
		fivexfive.lineSpacing = 14;
		
		p1P = [[Label alloc] initWithFont:retrotype text:@"0" position:[Vector2 vectorWithX:50 y:10]];
		p1P.horizontalAlign = HorizontalAlignCenter;
		
		p2P = [[Label alloc] initWithFont:retrotype text:@"0" position:[Vector2 vectorWithX:270 y:10]];
		p2P.horizontalAlign = HorizontalAlignCenter;
		
		/*Restart*/
		buttonBackground = [self.game.content load:@"Button"];
		reset = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:210 y:240 width:55 height:32] 
											  background:buttonBackground font:retrotype text:@"Restart"];
		[reset.backgroundImage setScaleUniform:2];
		
		/*Image*/
		Texture2D *dukeTexture = [[self.game.content load:@"Darth"] autorelease];	
		duke = [[Image alloc] initWithTexture:dukeTexture position:[Vector2 vectorWithX:120 y:0]];	
		[duke setScaleUniform: 0.2];
		resetDuke=FALSE;
		
	}
	return self;
}

//Falta Bonus
@synthesize scene, topPlayer, bottomPlayer, ball, p1_points, p2_points, lastPlayer,PadType, bonusStatus,bonusType,contTouches,save,Lnum,numBalls, defenseSpots, offenseSpots;

- (void) initialize 
{
	/*Pad Are Magnetic*/
	//topPlayer.magnetPower = 1;
	
	/*LastPlayer Counter*/
	lastPlayer=1;
	
	/*There is no Bonus in the Game*/
	bonusStatus=NO;
	//Bonus Coords Not Calculated 
	save=NO;
	//Counter for Number of Ball Touches in Pad
	contTouches=0;
	//Type of Bonus
	bonusType=0;
	
	/*Level Number*/
	Lnum=0;
	
	[self reset];
	[super initialize];
}

/*GameOver Method*/
- (void) GameOver
{
	[scene clear];
	bonusStatus=YES;
	[scene addItem:background];
	bonusType=6;
	//bonus.position.x=110;
	//bonus.position.y=250;
	ball.velocity.x=0;
	ball.velocity.y=0;
	//[scene addItem:bonus];
}

- (void) reset {}

- (void) resetLevelWithBallSpeed:(float)speed 
{
	/*Remove Everything from the Scene.*/
	[scene clear];

	/*Add Items to the Scene*/
	[scene addItem:background];
	[scene addItem:md];
	[scene addItem:pimg1];
	[scene addItem:pimg2];
	[scene addItem:topPlayer];
	topPlayer.top=YES;
	[scene addItem:bottomPlayer];
	topPlayer.top=NO;
	[scene addItem:ball];

	/*Add Level Limits*/
	[scene addItem:[[[LevelLimit alloc] initWithLimit:
					 [AAHalfPlane aaHalfPlaneWithDirection:AxisDirectionPositiveX distance:0] isDeadly:NO] autorelease]];
	[scene addItem:[[[LevelLimit alloc] initWithLimit:
					 [AAHalfPlane aaHalfPlaneWithDirection:AxisDirectionNegativeX distance:-320] isDeadly:NO] autorelease]];

	// Reset ball
	//printf("Speed RLWBWS: %f\n",speed);
	
	[scene addItem:p1P];
	[scene addItem:p2P];
	//[scene addItem:reset];
	if(resetDuke)
		[scene addItem:duke];	
	
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
	//ball.velocity.x = ([Random float] - 0.5f) * 10;
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

- (void) itemAddedToScene:(id)sender eventArgs:(SceneEventArgs*)e {
	if ([e.item isKindOfClass:[Ball class]]) {
		numBalls++;
	}
}

- (void) itemRemovedFromScene:(id)sender eventArgs:(SceneEventArgs*)e {
	if ([e.item isKindOfClass:[Ball class]]) {
		numBalls--;
	}
}

/*For all Items with Custom Update*/
- (void) updateWithGameTime:(GameTime *)gameTime 
{
	for (id item in scene) {
		id<ICustomUpdate> updatable = [item conformsToProtocol:@protocol(ICustomUpdate)] ? item : nil;
		
		if (updatable)
			[updatable updateWithGameTime:gameTime];	
	}
	p1P.text = [NSString stringWithFormat:@"%i", p1_points];
	p2P.text = [NSString stringWithFormat:@"%i", p2_points];
	
	for (id item in scene) {
		Button *button = [item isKindOfClass:[Button class]] ? item : nil;
		
		if (button) {
			[button update];
		}
	}
	if (reset.wasReleased) 
	{
		p1_points=0;
		p2_points=0;
		resetDuke=TRUE;
		[self resetLevelWithBallSpeed:400];
	}
}


- (void) dealloc
{
	[defenseSpots release];
	[offenseSpots release];
	[background release];
	[pimg1 release];
	[pimg2 release];	
	[topPlayer release];
	[bottomPlayer release];
	[ball release];
	[scene release];
	[super dealloc];
}

@end