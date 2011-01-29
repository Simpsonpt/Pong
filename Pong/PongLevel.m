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

/*Items Positions*/
- (void) reset 
{
		background.position.x = 0;
		background.position.y = 0;
		
		md.position.x = 0;
		md.position.y = 250;
	
		pimg1.position.x=30;
		pimg1.position.y=22;
	
		pimg2.position.x=307;
		pimg2.position.y=22;
		
		topPlayer.position.x = 155;
		topPlayer.position.y = 63;

		bottomPlayer.position.x = 155;
		bottomPlayer.position.y = 445;
		
		ball.position.x = 160;
		ball.position.y = 115;
	
		//80
		block.position.x=40;
		block.position.y=250;
	
		block2.position.x=270;
		block2.position.y=445;
	
		// AI helpers
		//X:160 y:0 (Ver melhor os Spots)
		[defenseSpots addObject:[[Vector2 alloc] initWithX:0 y:70]]; 
		[defenseSpots addObject:[[Vector2 alloc] initWithX:75 y:70]]; 
		[defenseSpots addObject:[[Vector2 alloc] initWithX:150 y:70]];
		[defenseSpots addObject:[[Vector2 alloc] initWithX:225 y:70]]; 
		[defenseSpots addObject:[[Vector2 alloc] initWithX:300 y:70]]; 
	
		[offenseSpots addObject:[[Vector2 alloc] initWithX:160 y:460]]; 
		[offenseSpots addObject:[[Vector2 alloc] initWithX:130 y:460]]; 
		[offenseSpots addObject:[[Vector2 alloc] initWithX:190 y:460]]; 
	
}

@end
