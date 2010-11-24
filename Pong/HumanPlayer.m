//
//  HumanPlayer.m
//  friHockey
//
//  Created by Renato Rodrigues on 11/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Retronator.Xni.Framework.Input.Touch.h"
#import "Retronator.Pong.h"
#import "HumanPlayer.h"
#import "GameCore.Physics.h"

@implementation HumanPlayer

- (id) initWithPad:(Pad *)thePad scene:(id <IScene>)theScene position:(PlayerPosition)thePosition game:(Game*)game
{
	self = [super initWithPad:thePad scene:theScene position:thePosition];
	if (self != nil) 
	{
		inputArea = [[Rectangle alloc] initWithRectangle:game.window.clientBounds];
		//170
		inputArea.height = 170;
		//printf("PB Position: %d\n",PlayerPositionBottom);
		if (position == PlayerPositionBottom) 
		{
			inputArea.y = game.window.clientBounds.height - inputArea.height;
		}
		touchOffset = [[Vector2 alloc] initWithX:0 y:position == PlayerPositionTop ? 0 : -10];
	}
	return self;
}

- (void) updateWithGameTime:(GameTime *)gameTime 
{
	TouchCollection *touches = [TouchPanel getState];
		
	BOOL touchesInInputArea = NO;
	for (TouchLocation *touch in touches) 
	{
		if ([inputArea containsVector:touch.position]) 
		{
			touchesInInputArea = YES;
			if (!grabbed) 
			{
				float distanceToPad = [[[Vector2 subtract:touch.position by:pad.position] add:touchOffset] length];
				//printf("Distance to Pad: %f\n",distanceToPad);
				if (distanceToPad < 50) 
					grabbed = YES;
			}
			if (grabbed) 
				//No need to change y, Pong just moves in X
				pad.position.x = touch.position.x;
			
		}
		if (!touchesInInputArea)
			grabbed = NO;
	}
}

- (void) dealloc
{
	[inputArea release];
	[super dealloc];
}


@end

