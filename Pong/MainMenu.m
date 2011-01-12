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
	Texture2D *bgTexture = [[self.game.content load:@"MainMenu"] autorelease];	
	background = [[Image alloc] initWithTexture:bgTexture position:[Vector2 vectorWithX:-3 y:0]];	
	[background setScaleUniform: 1];
	[scene addItem:background];
	
	// Buttons
	singleplayer = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:-138 y:115 width:220 height:32] 
										  background:buttonBackground font:retrotype text:@"Single"];
	[singleplayer.backgroundImage setScaleUniform:1.8];
	singleplayer.label.position.x=9;
	[singleplayer.label setScaleUniform:0.9];
	[scene addItem:singleplayer];
	
	multiplayer = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:223 y:115 width:140 height:32] 
										 background:buttonBackground font:retrotype text:@"Multi"];
	[multiplayer.backgroundImage setScaleUniform:1.8];
	multiplayer.label.position.x=249;
	[multiplayer.label setScaleUniform:0.9];
	[scene addItem:multiplayer];
	
	options = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:230 y:250 width:140 height:32]
									 background:buttonBackground font:retrotype text:@"Options"];
	[options.backgroundImage setScaleUniform:1.8];
	[options.label setScaleUniform:0.9];	
	[scene addItem:options];
	
	//Text
	highS = [[Label alloc] initWithFont:retrotype text:@"High Score" position:[Vector2 vectorWithX:10 y:320]];
	//highS.horizontalAlign = HorizontalAlignCenter;
	//[highS setScaleUniform:0.8];
	highS.color = [Color black];
	[scene addItem:highS];
	
	max = [[Label alloc] initWithFont:retrotype text:@"" position:[Vector2 vectorWithX:137 y:323]];
	//highS.horizontalAlign = HorizontalAlignCenter;
	[max setScaleUniform:0.9];
	max.color = [Color blue];
	NSNumber *temp=[GameProgress loadProgress];
	int cona =[temp integerValue];
	max.text = @"%d",cona;
	[scene addItem:max];
	
	
}

- (void) updateWithGameTime:(GameTime *)gameTime 
{
	[super updateWithGameTime:gameTime];
	
	GameState *newState = nil;
	
	if (singleplayer.wasReleased) 
	{
		[SoundEngine play:SoundEffectTypeClick];
		Gameplay* temp = [pong loadSinglePlayerLevel];
		[pong pushState:temp];		
	} else if (multiplayer.wasReleased) 
	{	
		[SoundEngine play:SoundEffectTypeClick];
		Gameplay* temp = [pong loadMultiplayerLevel];
		[pong pushState:temp];		
	} else if (options.wasReleased) {
		[SoundEngine play:SoundEffectTypeClick];
		newState = [[[Options alloc] initWithGame:self.game] autorelease];
	}
	
	if (newState)
		[pong pushState:newState];
}

- (void) dealloc
{
	[background release];
	
	[singleplayer release];
	[multiplayer release];
	[options release];
	
	[super dealloc];
}


@end