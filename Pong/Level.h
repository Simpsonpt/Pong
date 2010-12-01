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

@interface Level : GameComponent {
	
	Scene *scene;
	
	Bg *background;
	Middle *md;
	PlayerImg *pimg1;
	PlayerImg *pimg2;
	
	Pad *topPlayer;
	Pad *bottomPlayer;
	
	Ball *ball;
	int p1_points,p2_points,lastPlayer,PadType,bonusType,contTouches,Lnum,numBalls;
	BOOL bonusStatus,save;
}

@property (nonatomic, readonly) id<IScene> scene;
@property (nonatomic, readonly) Pad *topPlayer;
@property (nonatomic, readonly) Pad *bottomPlayer;
@property (nonatomic, readonly) Ball *ball;
@property (nonatomic) int p1_points,p2_points,lastPlayer,PadType,bonusType,contTouches,Lnum,numBalls;
@property (nonatomic) BOOL bonusStatus,save;

- (void)reset;
- (void)updatePlayerPoints:(NSInteger)point;
- (void) resetBallWithSpeed:(float)speed;
- (void) resetLevelWithBallSpeed:(float)speed;
- (void) GameOver;

@end
