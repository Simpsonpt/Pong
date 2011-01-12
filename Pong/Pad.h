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

@interface Pad : NSObject <IAARectangleCollider, ICustomCollider, ISceneUser, ICustomUpdate> 
{
	Vector2 *position;
	Vector2 *velocity;
	
	float width;
	float height;
	
	/*Top or Bottom*/
	BOOL top, stopBonus;
	int type;
	
	// We store previous position for velocity calculation.
	Vector2 *previousPosition;

	id<IScene> scene;
}

//magnetPower
@property (nonatomic) int type;
@property (nonatomic) float width,height;
@property (nonatomic) BOOL top,stopBonus;

@property (nonatomic, retain) Vector2 *previousPosition;

- (void) resetVelocity;

@end
