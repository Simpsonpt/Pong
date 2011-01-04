//
//  GameHud.m
//  Pong
//
//  Created by Renato Rodrigues on 1/4/11.
//  Copyright 2011 Pathon Project. All rights reserved.
//

#import "GameHud.h"
#import "Retronator.Xni.Framework.Graphics.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"

@implementation GameHud

- (id) initWithGame:(Game *)theGame
{
	self = [super initWithGame:theGame];
	if (self != nil) {
		scene = [[Scene alloc] initWithGame:self.game];
		[self.game.components addComponent:scene];		
	}
	return self;
}

@synthesize scene;

- (void) initialize {
	FontTextureProcessor *fontProcessor = [[[FontTextureProcessor alloc] init] autorelease];
	SpriteFont *font = [[self.game.content load:@"Retrotype" processor:fontProcessor] autorelease];
	
	playerScore[PlayerPositionTop] = [[Label alloc] initWithFont:font text:@"0" position:[Vector2 vectorWithX:50 y:80]];
	playerScore[PlayerPositionBottom] = [[Label alloc] initWithFont:font text:@"0" position:[Vector2 vectorWithX:50 y:380]];
	
	for (int i = 0; i < 2; i++) {
		playerColor[i] = [[Color transparent] retain];
		playerScore[i].color = playerColor[i];
		playerScore[i].horizontalAlign = HorizontalAlignCenter;
		playerScore[i].verticalAlign = VerticalAlignMiddle;
		[scene addItem:playerScore[i]];
	}	
}

- (void) updateWithGameTime:(GameTime *)gameTime {
	float change = gameTime.elapsedGameTime / 5;
	float sizeChange = gameTime.elapsedGameTime * 2;
	
	for (int i = 0; i < 2; i++) {
		if (playerOpacity[i] > 0) {
			playerOpacity[i] -= change;
			[playerScore[i].color set:[Color multiply:playerColor[i] withScalar:playerOpacity[i]]];
		}
	}
	
	if (playerScore[lastScore].scale.x > 0) {
		playerScore[lastScore].scale.x -= sizeChange;
		playerScore[lastScore].scale.y -= sizeChange;
	}
	
}

- (void) changePlayerScoreFor:(PlayerPosition)position to:(int)value {
	PlayerPosition other = (position + 1) % 2;
	
	playerScore[position].text = [NSString stringWithFormat:@"%i", value];
	playerOpacity[position] = 1;
	[playerColor[position] set:[Color green]];
	[playerScore[position] setScaleUniform:4];
	
	playerOpacity[other] = 1;
	[playerColor[other] set:[Color red]];
	[playerScore[other] setScaleUniform:2];
	
	lastScore = position;
}

- (void) dealloc
{
	for (int i = 0; i < 2; i++) {
		[playerScore[i] release];
	}
	[super dealloc];
}


@end
