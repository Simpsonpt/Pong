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
	self = [super initWithType:_MultiBallBonus duration:2];
	if (self != nil) {
		
	}
	return self;
}

- (void) activateWithParent:(Ball *)theParent {
	[super activateWithParent:theParent];
	printf("Multiball Bonus\n");
		savedscene = scene;
	for (id item in scene) {
		if ([item isKindOfClass:[Ball class]]) 
		{
			printf("I Found a ball\n");
			Ball *ball = (Ball*)item;
			
			/*Create Two Copies with Flipped Speed*/
			one = [[[Ball alloc] init] autorelease];
			[one.position set:ball.position];
			one.velocity.x = -ball.position.x;
			one.velocity.y = ball.position.y;
			[scene addItem:one];
			
			
			two = [[[Ball alloc] init] autorelease];
			[two.position set:ball.position];
			two.velocity.x = ball.position.x;
			two.velocity.y = -ball.position.y;
			[scene addItem:two];
			
		}
	}	

}

- (void) deactivate
{
	[super deactivate];
	scene=savedscene;
}

@end
