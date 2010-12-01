//
//  Player.h
//  Pong
//
//  Created by Renato Rodrigues on 11/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameCore.Scene.h"
#import "Retronator.Pong.classes.h"

@interface Player : GameComponent {
	Pad *pad;
	id<IScene> scene;
	PlayerPosition position;
}

- (id) initWithPad:(Pad*)thePad scene:(id<IScene>)theScene position:(PlayerPosition)thePosition;

- (void) updateWithGameTime:(GameTime*)gameTime;

@end

