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
		
	hs = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:-90 y:345 width:420 height:32]
								background:buttonBackground font:retrotype text:@"High Score"];
	[hs.backgroundImage setScaleUniform:1.8];
	hs.label.position.x=15;
	[hs.label setScaleUniform:0.9];	
	[scene addItem:hs];
	
	//HighScore
	Texture2D *imgScore = [[self.game.content load:@"medal"] autorelease];	
	highscore = [[Image alloc] initWithTexture:imgScore position:[Vector2 vectorWithX:50 y:305]];	
	[highscore setScaleUniform: 1];
	[scene addItem:highscore];

	//Text
	/*highS = [[Label alloc] initWithFont:retrotype text:@"High Score" position:[Vector2 vectorWithX:40 y:325]];
	//highS.horizontalAlign = HorizontalAlignCenter;
	[highS setScaleUniform:0.8];
	highS.color = [Color blue];
	[scene addItem:highS];*/
	
	/*max = [[Label alloc] initWithFont:retrotype text:@"0" position:[Vector2 vectorWithX:137 y:323]];
	//highS.horizontalAlign = HorizontalAlignCenter;
	[max setScaleUniform:0.9];
	max.color = [Color blue];
	//[GameProgress deleteProgress];
	NSNumber *temp=[GameProgress loadProgress];
	int hs=[temp integerValue];
	printf("High Score %i\n",hs);
	//int hs=0;
	max.text = [NSString stringWithFormat:@"%i", hs];
	[scene addItem:max];*/
	
	
}

- (void) updateWithGameTime:(GameTime *)gameTime 
{
	[super updateWithGameTime:gameTime];
	
	GameState *newState = nil;
	
	if (singleplayer.wasReleased) 
	{
		[SoundEngine play:SoundEffectTypeClick];
		pong.sp=TRUE;
		pong.mp=FALSE;
		Gameplay* temp = [pong loadSinglePlayerLevel];
		[pong pushState:temp];		
	} else if (multiplayer.wasReleased) 
	{	
		[SoundEngine play:SoundEffectTypeClick];
		pong.mp=TRUE;
		pong.sp=FALSE;
		Gameplay* temp = [pong loadMultiplayerLevel];
		[pong pushState:temp];		
	} else if (options.wasReleased) {
		[SoundEngine play:SoundEffectTypeClick];
		newState = [[[Options alloc] initWithGame:self.game] autorelease];
	} else if (hs.wasReleased) {
		[SoundEngine play:SoundEffectTypeClick];
		newState = [[[HighScores alloc] initWithGame:self.game] autorelease];
	}	
	
	if (newState)
		[pong pushState:newState];
}

- (void) dealloc
{
	[background release];
	[hs release];
	[singleplayer release];
	[multiplayer release];
	[options release];
	
	[super dealloc];
}


@end