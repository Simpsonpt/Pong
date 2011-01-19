//
//  HighScores.m
//  Pong
//
//  Created by Renato Rodrigues on 1/4/11.
//  Copyright 2011 Pathon Project. All rights reserved.
//

#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Pong.h"
#import "HighScores.h"

@implementation HighScores

- (void) initialize {
	[super initialize];
	
	// Background
	Texture2D *tableTexture = [[self.game.content load:@"menu2"] autorelease];	
	background = [[Image alloc] initWithTexture:tableTexture position:[Vector2 vectorWithX:0 y:0]];	
	[background setScaleUniform: 1];
	[scene addItem:background];	
	
	//HighScore
	Texture2D *imgScore = [[self.game.content load:@"medal"] autorelease];	
	hsImg = [[Image alloc] initWithTexture:imgScore position:[Vector2 vectorWithX:139 y:5]];	
	[hsImg setScaleUniform: 1];
	[scene addItem:hsImg];
	
	// Text
	title = [[Label alloc] initWithFont:retrotype text:@"HighScores" position:[Vector2 vectorWithX:160 y:40]];
	title.horizontalAlign = HorizontalAlignCenter;
	title.color = [Color black];
	[scene addItem:title];
	
	//SinglePlayer
	single = [[Label alloc] initWithFont:retrotype text:@"Single Player" position:[Vector2 vectorWithX:160 y:100]];
	single.horizontalAlign = HorizontalAlignCenter;
	single.color = [Color gold];
	[scene addItem:single];
	
	//Multiplayer
	multi = [[Label alloc] initWithFont:retrotype text:@"Multiplayer" position:[Vector2 vectorWithX:160 y:220]];
	multi.horizontalAlign = HorizontalAlignCenter;
	multi.color = [Color gold];
	[scene addItem:multi];
	
	//Reset Button
	reset = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:65 y:345 width:180 height:32]
								background:buttonBackground font:retrotype text:@"Reset Scores"];
	[reset.backgroundImage setScaleUniform:1.5];
	reset.label.position.x=102;
	reset.label.position.y=358;
	[reset.label setScaleUniform:0.9];	
	[scene addItem:reset];
	
	/*HighScores*/
	maxSingle = [[Label alloc] initWithFont:retrotype text:@"0" position:[Vector2 vectorWithX:145 y:150]];
	//highS.horizontalAlign = HorizontalAlignCenter;
	[maxSingle setScaleUniform:0.9];
	maxSingle.color = [Color blue];
	maxSingle.text = [NSString stringWithFormat:@"%i", pong.sSingle];
	[scene addItem:maxSingle];
	
	maxMulti = [[Label alloc] initWithFont:retrotype text:@"0" position:[Vector2 vectorWithX:145 y:270]];
	//highS.horizontalAlign = HorizontalAlignCenter;
	[maxMulti setScaleUniform:0.9];
	maxMulti.color = [Color blue];
	maxMulti.text = [NSString stringWithFormat:@"%i", pong.sMulti];
	[scene addItem:maxMulti];
	
	[scene addItem:back];
}

- (void) updateWithGameTime:(GameTime *)gameTime 
{
	[super updateWithGameTime:gameTime];
	maxSingle.text = [NSString stringWithFormat:@"%i", pong.sSingle];
	maxMulti.text = [NSString stringWithFormat:@"%i", pong.sMulti];

	if (reset.wasReleased) 
	{
		pong.sSingle=0;
		pong.sMulti=0;
		[SoundEngine play:SoundEffectTypeClick];
		[GameProgress deleteProgress:1];
		[GameProgress deleteProgress:2];
	}
}


- (void) dealloc
{
	[single release];
	[multi release];
	[title release];
	[super dealloc];
}

@end
