//
//  ShrinkPadSizeBonus.m
//  Pong
//
//  Created by Renato Rodrigues on 11/29/10.
//  Copyright 2010 Pathon Project. All rights reserved.
//

#import "ShrinkPadSizeBonus.h"
#import "Retronator.Pong.h"

@implementation ShrinkPadSizeBonus

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
	printf("Shrink Player\n");
	for (id item in scene) {
		if ([item isKindOfClass:[Pad class]]) 
		{
			Pad *dass = (Pad*)item;
			dass.type=1;
			
			dass.width = 53;
			dass.height = 22;
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
