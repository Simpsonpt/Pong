//
//  Block.h
//  Pong
//
//  Created by Renato Rodrigues on 1/19/11.
//  Copyright 2011 Pathon Project. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameCore.Scene.Objects.h"
#import "Retronator.Pong.classes.h"
#import "Level.h"

@interface Block : NSObject <IAARectangleCollider,ICustomCollider> 
{
	Vector2 *position;
	Vector2 *velocity;
	float width;
	float height;
}


@end
