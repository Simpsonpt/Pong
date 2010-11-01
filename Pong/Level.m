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

- (id) init
{
	self = [super init];
	if(self != nil) {
		
		//Background
		background = [[Bg alloc] init];
		
		//Middle Bar
		md = [[Middle alloc] init];
		
		//Players Bar
		player1pad = [[Pad alloc] init];
		player2pad = [[Pad alloc] init];
		//Game Ball
		ball = [[Ball alloc] init];
		//Random Objects
		bonus = [[Bonus alloc] init];
		
		
		scene = [[Scene alloc] init];
		[scene addItem:background];
		[scene addItem:md];
		[scene addItem:player1pad];
		[scene addItem:player2pad];
		[scene addItem:ball];
		[scene addItem:bonus];
		
	}
	return self;
}

@synthesize scene;

- (void) dealloc
{
	[background release];
	[player1pad release];
	[player2pad release];
	[ball release];
	[bonus release];
	[scene release];
	[super dealloc];
}

@end