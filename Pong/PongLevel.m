//
//  PongLevel.m
//  Pong
//
//  Created by Renato Rodrigues on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Level.h"
#import "Retronator.Pong.h"

@implementation PongLevel

- (id) init {	
	self = [super init];
	if(self != nil) {
		background.position.x = 0;
		background.position.y = 0;
		
		md.position.x = 0;
		md.position.y = 190;
		
		player1pad.position.x = 200;
		player1pad.position.y = 105;
		
		player2pad.position.x = 20;
		player2pad.position.y = 455;
		
		ball.position.x = 160;
		ball.position.y = 230;
		
		bonus.position.x = 120;
		bonus.position.y = 100;
	}
	return self;
}

@end
