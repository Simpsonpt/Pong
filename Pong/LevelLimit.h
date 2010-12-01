//
//  LevelLimit.h
//  Pong
//
//  Created by Renato Rodrigues on 11/29/10.
//  Copyright 2010 Pathon Project. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameCore.Scene.h"
#import "GameCore.Scene.Objects.h"
#import "GameCore.Math.h"
#import "Retronator.Pong.classes.h"

//, ICustomCollider
@interface LevelLimit : NSObject <IAAHalfPlaneCollider,ISceneUser> {
	AAHalfPlane *limit;
	BOOL deadly;
	id<IScene> scene;
}

- (id) initWithLimit:(AAHalfPlane*)theLimit isDeadly:(BOOL)isDeadly;

@end
