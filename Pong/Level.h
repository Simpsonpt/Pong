//
//  Level.h
//  Pong
//
//  Created by Renato Rodrigues on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameCore.Scene.h"
#import "Retronator.Pong.classes.h"

#import "GameCore.Mirage.h"

@interface Level : GameComponent {
	
	Scene *scene;
	
	Bg *background;
	Middle *md;
	PlayerImg *pimg1;
	PlayerImg *pimg2;
	
	Pad *topPlayer;
	Pad *bottomPlayer;
	Block *block;
	Ball *ball;
	int p1_points,p2_points,lastPlayer,PadType,contTouches,Lnum,numBalls;
	int HSsingle,HSmulti;
	BOOL bonusStatus,save;
	
	NSMutableArray *defenseSpots;
	NSMutableArray *offenseSpots;
	
	/*Score*/
	SpriteFont *retrotype, *fivexfive;
	Label *p1P,*p2P,*str;
	
	Texture2D *buttonBackground;
	Button *reset;
	
	Image *logoIcon;
	Button *backMenu;
}


@property (nonatomic, readonly) id<IScene> scene;
@property (nonatomic, readonly) Pad *topPlayer;
@property (nonatomic, readonly) Pad *bottomPlayer;
@property (nonatomic, readonly) Ball *ball;
@property (nonatomic) int p1_points,p2_points,lastPlayer,PadType,contTouches,Lnum,numBalls,HSsingle,HSmulti;
@property (nonatomic) BOOL bonusStatus,save;

@property (nonatomic, readonly) NSMutableArray *defenseSpots;
@property (nonatomic, readonly) NSMutableArray *offenseSpots;

- (void) reset;
- (void) updatePlayerPoints:(NSInteger)point;
- (void) resetBallWithSpeed:(float)speed;
- (void) resetLevelWithBallSpeed:(float)speed;
- (void) GameOver;

@end
