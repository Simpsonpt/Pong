//
//  MainMenu.m
//  Pong
//
//  Created by Renato Rodrigues on 1/4/11.
//  Copyright 2011 Pathon Project. All rights reserved.
//

#import "MainMenu.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Pong.h"

@implementation MainMenu

- (void) initialize 
{
	[super initialize];
	
	// Background
	Texture2D *tableTexture = [[self.game.content load:@"MainMenu"] autorelease];	
	table = [[Image alloc] initWithTexture:tableTexture position:[Vector2 vectorWithX:0 y:0]];	
	[table setScaleUniform: 1];
	[scene addItem:table];
	/*Texture2D *tableTexture = [[self.game.content load:@"TablePlain"] autorelease];	
	table = [[Image alloc] initWithTexture:tableTexture position:[Vector2 vectorWithX:-60 y:0]];	
	[table setScaleUniform: 2];
	[scene addItem:table];
	
	Texture2D *dukeTexture = [[self.game.content load:@"TheDuke"] autorelease];	
	duke = [[Image alloc] initWithTexture:dukeTexture position:[Vector2 vectorWithX:0 y:0]];	
	[duke setScaleUniform: 2];
	[scene addItem:duke];*/
	
	// Text
	/*title = [[Label alloc] initWithFont:retrotype text:@"Pong" position:[Vector2 vectorWithX:160 y:10]];
	title.horizontalAlign = HorizontalAlignCenter;
	[scene addItem:title];
	
	subtitle = [[Label alloc] initWithFont:fivexfive text:@"by Renato Rodrigues" position:[Vector2 vectorWithX:320 y:50]];
	subtitle.horizontalAlign = HorizontalAlignRight;
	[scene addItem:subtitle];
	
	copyright = [[Label alloc] initWithFont:fivexfive text:@""
				 "3D modeling by\n"
				 "Matjaz Lamut\n"
				 "Published by GameTeam, Fri\n"
				 "Copyright 2011 Razum d.o.o.\n"
				 "All Rights Reserved v0.4" position:[Vector2 vectorWithX:4 y:462]];
	copyright.verticalAlign = VerticalAlignBottom;
	[scene addItem:copyright];*/
	
	// Buttons
	singleplayer = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:-150 y:115 width:200 height:32] 
										  background:buttonBackground font:retrotype text:@"Single"];
	[singleplayer.backgroundImage setScaleUniform:1.8];
	singleplayer.label.position.x=5;
	[singleplayer.label setScaleUniform:0.9];
	[scene addItem:singleplayer];
	
	multiplayer = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:250 y:115 width:140 height:32] 
										 background:buttonBackground font:retrotype text:@"Multi"];
	[multiplayer.backgroundImage setScaleUniform:1.8];
	[multiplayer.label setScaleUniform:0.9];
	[scene addItem:multiplayer];
	
	options = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:230 y:250 width:140 height:32]
									 background:buttonBackground font:retrotype text:@"Options"];
	[options.backgroundImage setScaleUniform:1.8];
	[options.label setScaleUniform:0.9];	
	[scene addItem:options];
}

- (void) updateWithGameTime:(GameTime *)gameTime 
{
	[super updateWithGameTime:gameTime];
	
	GameState *newState = nil;
	
	if (singleplayer.wasReleased) 
	{
		Gameplay* temp = [pong loadSinglePlayerLevel];
		[pong pushState:temp];		
	} else if (multiplayer.wasReleased) 
	{	
		Gameplay* temp = [pong loadMultiplayerLevel];
		[pong pushState:temp];		
	} else if (options.wasReleased) {
		newState = [[[Options alloc] initWithGame:self.game] autorelease];
	}
	
	if (newState)
		[pong pushState:newState];
}

- (void) dealloc
{
	[table release];
	[duke release];
	
	[title release];
	[subtitle release];
	[copyright release];
	
	[singleplayer release];
	[multiplayer release];
	[options release];
	
	[super dealloc];
}


@end