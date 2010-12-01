//
//  Ball.h
//  Pong
//
//  Created by Renato Rodrigues on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameCore.Scene.Objects.h"
#import "Retronator.Pong.classes.h"

@interface Ball : NSObject <IParticle,ISceneUser,ICustomUpdate,ICustomCollider> {
	Vector2 *position;
	Vector2 *velocity;
	float radius;
	float mass;
	
	id<IScene> scene;
	BOOL bumm;
	
	NSMutableArray *BonusArray;
}

@property (nonatomic) BOOL bumm;

- (void) addBonus:(Bonus*)bonus;
- (void) removeAllBonus;
@end

