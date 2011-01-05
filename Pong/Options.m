//
//  Options.m
//  Pong
//
//  Created by Renato Rodrigues on 1/4/11.
//  Copyright 2011 Pathon Project. All rights reserved.
//

#import "Options.h"

@implementation Options

- (void) initialize {
	[super initialize];	
	
	// Text
	title = [[Label alloc] initWithFont:retrotype text:@"Options" position:[Vector2 vectorWithX:160 y:10]];
	title.horizontalAlign = HorizontalAlignCenter;
	[scene addItem:title];
	
	[scene addItem:back];
}

- (void) dealloc
{
	[title release];
	[super dealloc];
}

@end

