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
	
	Pad *topPlayer;
	Pad *bottomPlayer;
	
	Ball *ball;
	Bonus *bonus;
	int p1_points,p2_points,lastPlayer,type,bonusType,contTouches,Lnum;
	BOOL bonusStatus,save;
}

@property (nonatomic, readonly) id<IScene> scene;
@property (nonatomic, readonly) Pad *topPlayer;
@property (nonatomic, readonly) Pad *bottomPlayer;
@property (nonatomic, readonly) Ball *ball;
@property (nonatomic, readonly) Bonus *bonus;
@property (nonatomic) int p1_points,p2_points,lastPlayer,type,bonusType,contTouches,Lnum;
@property (nonatomic) BOOL bonusStatus,save;

- (void)reset;
- (void)updatePlayerPoints:(NSInteger)point;
- (void) resetBallWithSpeed:(float)speed;
- (void) resetLevelWithBallSpeed:(float)speed;
- (void) GO;
@end
