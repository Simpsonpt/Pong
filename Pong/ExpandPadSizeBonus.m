//
//  ExpandPadSizeBonus.m
//  Pong
//
//  Created by Renato Rodrigues on 11/29/10.
//  Copyright 2010 Pathon Project. All rights reserved.
//

#import "ExpandPadSizeBonus.h"
#import "Retronator.Pong.h"

@implementation ExpandPadSizeBonus

- (id) init
{
	self = [super initWithType:_ExpandPadSizeBonus duration:5];
	if (self != nil) {
		
	}
	return self;
}

- (void) activateWithParent:(Ball *)theParent 
{
	[super activateWithParent:theParent];
	printf("Expand Player\n");
	for (id item in scene) 
	{
		if ([item isKindOfClass:[Pad class]]) 
		{
			Pad *dass = (Pad*)item;
			if(dass.bonus)
			{
				dass.type=2;
			
				dass.width = 125;
				dass.height = 20;
				//break;
			}
		}
	}
	savedscene = scene;
}
	
- (void) deactivate
{
	[super deactivate];
	for (id item in savedscene) {
		if ([item isKindOfClass:[Pad class]]) 
		{
			Pad *dass = (Pad*)item;
			dass.type=0;
		
			dass.width = 84;
			dass.height = 21;
		}
	}
}

@end