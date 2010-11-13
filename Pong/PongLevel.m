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

- (void) reset {
		background.position.x = 0;
		background.position.y = 0;
		
		md.position.x = 0;
		md.position.y = 190;
		
		topPlayer.position.x = 190;
		topPlayer.position.y = 70;

		bottomPlayer.position.x = 0;
		//455
		bottomPlayer.position.y = 430;
		
		ball.position.x = 160;
		ball.position.y = 230;
		
		bonus.position.x = 120;
		bonus.position.y = 100;
}

@end
