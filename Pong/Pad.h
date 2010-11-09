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

@interface Pad : NSObject <IParticle> {
	Vector2 *position;
	Vector2 *velocity;
	float radius;
	float mass;
}

@end