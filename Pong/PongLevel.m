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
		md.position.y = 180;
		
		topPlayer.position.x = 155;
		topPlayer.position.y = 70;

		bottomPlayer.position.x = 155;
		bottomPlayer.position.y = 430;
		
		ball.position.x = 160;
		ball.position.y = 115;
		
		bonus.position.x = 0;
		bonus.position.y = 0;
}

@end
