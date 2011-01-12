//
//  PointsBonus.m
//  Pong
//
//  Created by Renato Rodrigues on 11/29/10.
//  Copyright 2010 Pathon Project. All rights reserved.
//

#import "PointsBonus.h"


@implementation PointsBonus

- (id) init
{
	self = [super initWithType:_PointsBonus];
	if (self != nil) {
		catched=FALSE;
	}
	return self;
}

- (void) activateWithParent:(Ball *)theParent 
{
		[super activateWithParent:theParent];
		printf("Points Bonus\n");
		catched=TRUE;
}


@end
