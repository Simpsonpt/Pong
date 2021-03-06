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
	Texture2D *tableTexture = [[self.game.content load:@"menu2"] autorelease];	
	background = [[Image alloc] initWithTexture:tableTexture position:[Vector2 vectorWithX:0 y:0]];	
	[background setScaleUniform: 1];
	[scene addItem:background];
	
	// Text
	title = [[Label alloc] initWithFont:retrotype text:@"Options" position:[Vector2 vectorWithX:160 y:30]];
	title.horizontalAlign = HorizontalAlignCenter;
	[scene addItem:title];
	
	type = [[Label alloc] initWithFont:retrotype text:@"Gameplay Type" position:[Vector2 vectorWithX:160 y:220]];
	type.horizontalAlign = HorizontalAlignCenter;
	[scene addItem:type];
	
	
	/*Sounds Options*/
	sfx = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:47 y:90 width:235 height:32]
									background:buttonBackground font:retrotype text:@""];
	[sfx.backgroundImage setScaleUniform:1.8];
	[sfx.label setScaleUniform:0.9];
	sfx.label.position.x=95;
	
	if(pong.sfxSounds)	
		sfx.label.text=@"SFX Sounds ON";
	else
		sfx.label.text=@"SFX Sounds OFF";
	
	[scene addItem:sfx];
	
	sounds = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:47 y:150 width:235 height:32]
									 background:buttonBackground font:retrotype text:@""];
	[sounds.backgroundImage setScaleUniform:1.8];
	[sounds.label setScaleUniform:0.9];
	sounds.label.position.x=92;
	
	if(pong.gameSounds)
		sounds.label.text=@"Game Sounds ON";
	else
		sounds.label.text=@"Game Sounds OFF";
	
	[scene addItem:sounds];
	
	infiniteGPB = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:47 y:270 width:235 height:32]
									background:buttonBackground font:retrotype text:@""];
	[infiniteGPB.backgroundImage setScaleUniform:1.8];
	[infiniteGPB.label setScaleUniform:0.9];
	infiniteGPB.label.position.x=105;
	if(pong.infiniteGP)
		infiniteGPB.label.text=@"Classic Mode";
	else
		infiniteGPB.label.text=@"Level Mode";
	[scene addItem:infiniteGPB];
	
	[scene addItem:back];
}

- (void) updateWithGameTime:(GameTime *)gameTime 
{
	for(id item in scene){
		Button *button = [item isKindOfClass:[Button class]] ? item : nil;
		if (button) {
			[button update];
		}
	}
	
	if (back.wasReleased) 
	{
		[SoundEngine play:SoundEffectTypeClick];
		[pong popState];
	}
	
	if (sfx.wasReleased) 
	{
		[SoundEngine play:SoundEffectTypeClick];
		if(pong.sfxSounds)
		{
			//[SoundEngine playWith:SoundEffectTypeClick vol:0];
			[SoundEffect setMasterVolume:0];
			sfx.label.text=@"SFX Sounds OFF";
			pong.sfxSounds=FALSE;
			[GameProgress saveOptions:0 option:1];
		}
		else
		{
			[SoundEffect setMasterVolume:1];
			sfx.label.text=@"SFX Sounds ON";
			pong.sfxSounds=TRUE;
			[GameProgress saveOptions:1 option:1];
		}
	}
	
	if (sounds.wasReleased) 
	{
		[SoundEngine play:SoundEffectTypeClick];
		if(pong.gameSounds)
		{

			sounds.label.text=@"Game Sounds OFF";
			pong.gameSounds=FALSE;
			[GameProgress saveOptions:0 option:2];
		}
		else
		{

			sounds.label.text=@"Game Sounds ON";
			pong.gameSounds=TRUE;
			[GameProgress saveOptions:1 option:2];
		}
	}
	
	if(infiniteGPB.wasReleased)
	{
		[SoundEngine play:SoundEffectTypeClick];
		if(pong.infiniteGP)
		{
			
			infiniteGPB.label.text=@"Level Mode";
			pong.infiniteGP=FALSE;
			[GameProgress saveGP:0];
		}
		else
		{
			infiniteGPB.label.text=@"Classic Mode";

			pong.infiniteGP=TRUE;
			[GameProgress saveGP:1];
		}
		
	}
}


- (void) dealloc
{
	[title release];
	[background release];
	[super dealloc];
}

@end

