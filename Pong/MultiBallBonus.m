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
	self = [super initWithType:_MultiBallBonus duration:5];
	if (self != nil) {
		
	}
	return self;
}

- (void) activateWithParent:(Ball *)theParent {
	[super activateWithParent:theParent];
	printf("Multiball Bonus\n");
	for (id item in scene) {
		if ([item isKindOfClass:[Ball class]]) 
		{
			printf("I Found a ball\n");
			Ball *ball = (Ball*)item;
			
			/*Create Two Copies with Flipped Speed*/
			Ball *copy = [[[Ball alloc] init] autorelease];
			[copy.position set:ball.position];
			copy.velocity.x = -ball.position.x;
			copy.velocity.y = ball.position.y;
			[scene addItem:copy];
			
			
			copy = [[[Ball alloc] init] autorelease];
			[copy.position set:ball.position];
			copy.velocity.x = ball.position.x;
			copy.velocity.y = -ball.position.y;
			[scene addItem:copy];
			
		}
	}	
}
@end
