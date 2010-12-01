//
//  Pad.h
//  Pong
//
//  Created by Renato Rodrigues on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameCore.Scene.Objects.h"
#import "Retronator.Pong.classes.h"
#import "Level.h"

@interface Pad : NSObject <IAARectangleCollider, ICustomCollider, ISceneUser, ICustomUpdate> {
	Vector2 *position;
	float width;
	float height;
	int magnetPower;
	
	/*Top or Bottom*/
	BOOL top, stopBonus;
	int type;
	
	NSMutableArray *caughtBalls;
	id<IScene> scene;
}

@property (nonatomic) int magnetPower,type;
@property (nonatomic) float width,height;
@property (nonatomic) BOOL top,stopBonus;

- (void) releaseBalls;

@end
