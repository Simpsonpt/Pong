//
//  Player.m
//  Pong
//
//  Created by Renato Rodrigues on 11/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Player.h"

@implementation Player

- (id) initWithPad:(Pad *)thePad scene:(id <IScene>)theScene position:(PlayerPosition)thePosition
{
	self = [super init];
	if (self != nil) {
		pad = thePad;
		scene = theScene;
		position = thePosition;
	}
	return self;
}

- (void) updateWithGameTime:(GameTime *)gameTime {}

- (BOOL) getbonusCheck {}

@end

