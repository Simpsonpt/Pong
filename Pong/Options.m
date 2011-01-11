//
//  Options.m
//  Pong
//
//  Created by Renato Rodrigues on 1/4/11.
//  Copyright 2011 Pathon Project. All rights reserved.
//

#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Pong.h"
#import "Options.h"

@implementation Options

- (void) initialize {
	[super initialize];	
	
	// Background
	Texture2D *tableTexture = [[self.game.content load:@"MainMenu"] autorelease];	
	background = [[Image alloc] initWithTexture:tableTexture position:[Vector2 vectorWithX:0 y:0]];	
	[background setScaleUniform: 1];
	[scene addItem:background];
	
	// Text
	title = [[Label alloc] initWithFont:retrotype text:@"Options" position:[Vector2 vectorWithX:160 y:30]];
	title.horizontalAlign = HorizontalAlignCenter;
	[scene addItem:title];
	
	[scene addItem:back];
}

- (void) dealloc
{
	[title release];
	[background release];
	[super dealloc];
}

@end

