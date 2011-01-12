//
//  Bonus.h
//  Pong
//
//  Created by Renato Rodrigues on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameCore.Scene.Objects.h"
#import "Retronator.Pong.classes.h"

@interface Bonus : NSObject <IParticle,ICustomUpdate, ILifetime, ISceneUser> 
{
	Vector2 *position;
	/*Just For The Interface*/
	Vector2 *velocity;
	float radius;
	float mass;
	
	BonusType type;
	NSTimeInterval duration;
	BOOL active;
	Pad *parent;
	Lifetime *lifetime;
	id<IScene> scene;
}

- (id) initWithType:(BonusType)theType;
- (id) initWithType:(BonusType)theType duration:(NSTimeInterval)theDuration;

@property (nonatomic, readonly) BonusType type;

- (void) activateWithParent:(Ball*)theParent;
- (void) deactivate;

@end
