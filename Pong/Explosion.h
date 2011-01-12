//
//  Explosion.h
//  Pong
//
//  Created by Renato Rodrigues on 11/30/10.
//  Copyright 2010 Pathon Project. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Retronator.Pong.classes.h"
#import "GameCore.Scene.Objects.h"

@interface Explosion : NSObject <IPosition, ILifetime, ICustomUpdate, ISceneUser> 
{
	Vector2 *position;
	Lifetime *lifetime;
	int random;
	
	id<IScene> scene;
}

@property (nonatomic, readonly) int random;

@end

