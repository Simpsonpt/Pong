//
//  MultiBallBonus.m
//  Pong
//
//  Created by Renato Rodrigues on 11/29/10.
//  Copyright 2010 Pathon Project. All rights reserved.
//

#import "MultiBallBonus.h"
#import "GameCore.Scene.h"
#import "Retronator.Pong.h"

@implementation MultiBallBonus

- (id) init
{
	self = [super initWithType:_MultiBallBonus duration:4];
	if (self != nil) {
		
	}
	return self;
}

- (void) activateWithParent:(Ball *)theParent {
	[super activateWithParent:theParent];
	printf("Multiball Bonus\n");
	savedscene = scene;
	for (id item in scene) 
	{
		if ([item isKindOfClass:[Ball class]]) 
		{
			printf("I Found a ball\n");
			Ball *ball = (Ball*)item;
			ball.type=2;
			ball.velocity.x= ([Random float] - 0.5f) * 100;
			ball.velocity.y+=200;
			/*Create Two Copies with Flipped Speed
			ball = [[[Ball alloc] init] autorelease];
			[ball.position set:ball.position];
			ball.velocity.x = -ball.position.x;
			ball.velocity.y = ball.position.y;
			ball.type=1;
			[scene addItem:ball];
			
			
			ball = [[[Ball alloc] init] autorelease];
			[ball.position set:ball.position];
			ball.velocity.x = ball.position.x;
			ball.velocity.y = -ball.position.y;
			ball.type=1;
			[scene addItem:ball];*/
			
		}
	}	

}

- (void) deactivate
{
	[super deactivate];
	scene=savedscene;
	for (id item in scene) 
	{
		if ([item isKindOfClass:[Ball class]]) 
		{
			printf("cona\n");
			Ball *ball = (Ball*)item;
			ball.type=0;
			//ball.velocity.y=old_vel;
		}
	}
}

@end
