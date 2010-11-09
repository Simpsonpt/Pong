//
//  Level.m
//  Pong
//
//  Created by Renato Rodrigues on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Level.h"
#import "Retronator.Pong.h"

@implementation Level

- (id) initWithGame:(Game *)theGame
{
	self = [super initWithGame:theGame];
	if (self != nil) {

		scene = [[Scene alloc] init];
		
		//Background
		background = [[Bg alloc] init];
		
		//Middle Bar
		md = [[Middle alloc] init];		
		
		//Players Bar
		topPlayer = [[Pad alloc] init];
		bottomPlayer = [[Pad alloc] init];
		//Game Ball
		ball = [[Ball alloc] init];
		//Random Objects
		bonus = [[Bonus alloc] init];
			
		[scene addItem:background];
		[scene addItem:md];
		[scene addItem:topPlayer];
		[scene addItem:bottomPlayer];
		[scene addItem:ball];
		[scene addItem:bonus];
		
	}
	return self;
}

@synthesize scene, topPlayer, bottomPlayer, ball;

- (void) initialize {
	[self reset];
	[super initialize];
}

- (void) reset {}

- (void) dealloc
{
	[background release];
	[topPlayer release];
	[bottomPlayer release];
	[ball release];
	[bonus release];
	[scene release];
	[super dealloc];
}

@end