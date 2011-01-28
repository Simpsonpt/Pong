//
//  Renderer.m
//  Pong
//
//  Created by Renato Rodrigues on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Renderer.h"
#import "GameCore.Scene.h"
#import "GameCore.Scene.Objects.h"
#import "Retronator.Pong.h"

@implementation Renderer

- (id) initWithGame:(Game *)theGame gameplay:(Gameplay*)theGameplay {
	if (self = [super initWithGame:theGame]) {
		gameplay = theGameplay;
	}
	return self;
}


- (void) initialize {
	[super initialize];
}

- (void) loadContent {
	spriteBatch = [[SpriteBatch alloc] initWithGraphicsDevice:self.graphicsDevice];
	primitiveBatch = [[PrimitiveBatch alloc] initWithGraphicsDevice:self.graphicsDevice];

	//Background
	backgroundSprite = [[Sprite alloc] init];
	backgroundSprite.texture = [self.game.content load:@"PongU8"];
	backgroundSprite.sourceRectangle = [Rectangle rectangleWithX:25 y:25 width:320 height:460];
	backgroundSprite.origin = [Vector2 vectorWithX:0 y:0];
	
	//Middle
	middleSprite = [[Sprite alloc] init];
	middleSprite.texture = [self.game.content load:@"PongU8"];
	middleSprite.sourceRectangle = [Rectangle rectangleWithX:404 y:155 width:361 height:6];
	middleSprite.origin = [Vector2 vectorWithX:0 y:0];

	//Player Image
	playerSprite = [[Sprite alloc] init];
	playerSprite.texture = [self.game.content load:@"PongU8"];
	playerSprite.sourceRectangle = [Rectangle rectangleWithX:670 y:317 width:60 height:42];
	playerSprite.origin = [Vector2 vectorWithX:30 y:20];
	
	//Wall
	wall = [[Sprite alloc] init];
	wall.texture = [self.game.content load:@"wall"];
	wall.sourceRectangle = [Rectangle rectangleWithX:35 y:2 width:60 height:35];
	wall.origin = [Vector2 vectorWithX:30 y:17];	
	
	/*Players Pad*/
	
	//Normal
	padSprite[0] = [[Sprite alloc] init];
	padSprite[0].texture = [self.game.content load:@"PongU8"];
	padSprite[0].sourceRectangle = [Rectangle rectangleWithX:404 y:70 width:84 height:21];
	padSprite[0].origin = [Vector2 vectorWithX:41 y:9.5];
	//Small
	padSprite[1] = [[Sprite alloc] init];
	padSprite[1].texture = [self.game.content load:@"PongU8"];
	padSprite[1].sourceRectangle = [Rectangle rectangleWithX:534 y:70 width:53 height:22];
	padSprite[1].origin = [Vector2 vectorWithX:25 y:10];
	//Big
	padSprite[2] = [[Sprite alloc] init];
	padSprite[2].texture = [self.game.content load:@"PongU8"];
	padSprite[2].sourceRectangle = [Rectangle rectangleWithX:634 y:70 width:125 height:21];
	padSprite[2].origin = [Vector2 vectorWithX:61.5 y:9.5];

	/*Balls*/
	
	//Normal
	ballSprite[0] = [[Sprite alloc] init];
	ballSprite[0].texture = [self.game.content load:@"PongU8"];
	ballSprite[0].sourceRectangle = [Rectangle rectangleWithX:585.5 y:241.5 width:23 height:20];
	ballSprite[0].origin = [Vector2 vectorWithX:11 y:9.5];
	
	//Green
	ballSprite[1] = [[Sprite alloc] init];
	ballSprite[1].texture = [self.game.content load:@"PongU8"];
	ballSprite[1].sourceRectangle = [Rectangle rectangleWithX:443.5 y:241.5 width:23 height:20];
	ballSprite[1].origin = [Vector2 vectorWithX:11 y:9.5];
	
	//Blue
	ballSprite[2] = [[Sprite alloc] init];
	ballSprite[2].texture = [self.game.content load:@"PongU8"];
	ballSprite[2].sourceRectangle = [Rectangle rectangleWithX:396 y:241.5 width:23 height:20];
	ballSprite[2].origin = [Vector2 vectorWithX:11 y:9.5];
	
	//Red
	ballSprite[3] = [[Sprite alloc] init];
	ballSprite[3].texture = [self.game.content load:@"PongU8"];
	ballSprite[3].sourceRectangle = [Rectangle rectangleWithX:540 y:241.5 width:23 height:20];
	ballSprite[3].origin = [Vector2 vectorWithX:11 y:9.5];
	
	/*Bonus Types*/
	
	//Star
	bonusSprite[0] = [[Sprite alloc] init];
	bonusSprite[0].texture = [self.game.content load:@"PongU8"];
	bonusSprite[0].sourceRectangle = [Rectangle rectangleWithX:500 y:241 width:34 height:22];
	bonusSprite[0].origin = [Vector2 vectorWithX:17 y:11];
	
	//Cherry
	bonusSprite[1] = [[Sprite alloc] init];
	bonusSprite[1].texture = [self.game.content load:@"bonus"];
	bonusSprite[1].sourceRectangle = [Rectangle rectangleWithX:160 y:160 width:35 height:25];
	bonusSprite[1].origin = [Vector2 vectorWithX:18 y:12];
	
	//Morango
	bonusSprite[2] = [[Sprite alloc] init];
	bonusSprite[2].texture = [self.game.content load:@"bonus"];
	bonusSprite[2].sourceRectangle = [Rectangle rectangleWithX:160 y:177 width:35 height:25];
	bonusSprite[2].origin = [Vector2 vectorWithX:18 y:12];
	
	//Peachs
	bonusSprite[3] = [[Sprite alloc] init];
	bonusSprite[3].texture = [self.game.content load:@"bonus"];
	bonusSprite[3].sourceRectangle = [Rectangle rectangleWithX:160 y:199 width:35 height:25];
	bonusSprite[3].origin = [Vector2 vectorWithX:18 y:12];
	
	/*//Apple
	bonusSprite[4] = [[Sprite alloc] init];
	bonusSprite[4].texture = [self.game.content load:@"bonus"];
	bonusSprite[4].sourceRectangle = [Rectangle rectangleWithX:160 y:216 width:30 height:20];
	bonusSprite[4].origin = [Vector2 vectorWithX:0 y:0];*/
	
	/*GameOver*/
	gameoverSprite = [[Sprite alloc] init];
	gameoverSprite.texture = [self.game.content load:@"bonus"];
	gameoverSprite.sourceRectangle = [Rectangle rectangleWithX:0 y:190 width:120 height:10];
	gameoverSprite.origin = [Vector2 vectorWithX:0 y:0];
	
	/*Load Explosion*/
	Texture2D *explosionTexture = [[self.game.content load:@"exp"] autorelease];
	explosionSprite = [[AnimatedSprite alloc] initWithDuration:1];
	for (int i = 0; i < 16; i++) 
	{
		int row = i % 4;
		int column = i / 4;
		Sprite *sprite = [[[Sprite alloc] init] autorelease];
		sprite.texture = explosionTexture;
		sprite.sourceRectangle = [Rectangle rectangleWithX:column * 128 y:row * 128 width:128 height:128];
		sprite.origin = [Vector2 vectorWithX:64 y:64];
		AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:sprite start:explosionSprite.duration * (float)i / 16];
		[explosionSprite addFrame:frame];
	}
}

- (void) drawWithGameTime:(GameTime *)gameTime {
	[self.graphicsDevice clearWithColor:[Color green]];
	//[spriteBatch beginWithSortMode:SpriteSortModeDeffered BlendState:nil SamplerState:nil 
				 //DepthStencilState:nil RasterizerState:nil Effect:nil TransformMatrix:nil];

	[spriteBatch begin];
	//[spriteBatch beginWithSortMode:SpriteSortModeBackToFront BlendState:nil];
	[primitiveBatch begin];
	
	for (id item in gameplay.level.scene) 
	{
		id<IPosition> itemWithPosition;
		if ([item conformsToProtocol:@protocol(IPosition)]) {
			itemWithPosition = (id<IPosition>)item;
		}
		
		Sprite *sprite = nil;
		if ([item isKindOfClass:[Pad class]]) 
		{
			/*Just for Debug*/
			Pad *pad = (Pad*)item;
			[primitiveBatch drawRectangleAt:pad.position width:pad.width height:pad.height color:[Color white]];
			sprite = padSprite[pad.type];
		} else if ([item isKindOfClass:[Block class]]) 
		{
			Block *block=(Block*)item;
			[primitiveBatch drawRectangleAt:block.position width:block.width height:block.height color:[Color blue]];
			sprite=wall;
		} else if ([item isKindOfClass:[Ball class]]) 
		{
			/*Just for Debug*/
			Ball *ball = (Ball*)item;
			[primitiveBatch drawCircleAt:ball.position radius:ball.radius divisions:32 color:[Color green]];
			[primitiveBatch drawLineFrom:ball.position to:[Vector2 add:ball.position to:ball.velocity] color:[Color red]];
			sprite = ballSprite[ball.type];
		} else if ([item isKindOfClass:[Bonus class]]) 
		{
			Bonus *bonus = (Bonus*)item;
			[primitiveBatch drawCircleAt:bonus.position radius:bonus.radius divisions:32 color:[Color green]];
			sprite = bonusSprite[bonus.type];
			//printf("Bonus Type: %d\n",bonus.type);
		}else if ([item isKindOfClass:[Bg class]]) {
			sprite = backgroundSprite;
		} else if ([item isKindOfClass:[Middle class]]) {
			sprite = middleSprite;
		} else if ([item isKindOfClass:[PlayerImg class]]) {
			sprite = playerSprite;
		} else if ([item isKindOfClass:[Label class]])
		{
			Label *label = item;
			[spriteBatch drawStringWithSpriteFont:label.font text:label.text to:label.position tintWithColor:label.color
											 rotation:label.rotation origin:label.origin scale:label.scale effects:SpriteEffectsNone layerDepth:label.layerDepth];
		} else if ([item isKindOfClass:[Image class]])
		{
			Image *image = item;
			[spriteBatch draw:image.texture to:image.position fromRectangle:image.sourceRectangle tintWithColor:image.color
					 rotation:image.rotation origin:image.origin scale:image.scale effects:SpriteEffectsNone layerDepth:image.layerDepth];
		}
		if (itemWithPosition && sprite) {
			[spriteBatch draw:sprite.texture 
						   to:itemWithPosition.position
				fromRectangle:sprite.sourceRectangle
				tintWithColor:[Color white]
					 rotation:0 
					   origin:sprite.origin
				 scaleUniform:1
					  effects:SpriteEffectsNone 
				   layerDepth:0];
		}
	}
	
	[spriteBatch end];
	[primitiveBatch end];
	
	// Draw effects in additive mode.
	//[spriteBatch beginWithSortMode:SpriteSortModeDeffered BlendState:[BlendState additive]];
	[spriteBatch begin];
	for (id item in gameplay.level.scene) 
	{
		id<IPosition> itemWithPosition;
		if ([item conformsToProtocol:@protocol(IPosition)]) {
			itemWithPosition = (id<IPosition>)item;
		}

		if ([item isKindOfClass:[Explosion class]]) 
		{
			Explosion *explosion = (Explosion*)item;
			Sprite *sprite = [explosionSprite spriteAtTime:explosion.lifetime.progress];
			SpriteEffects effects = explosion.random & (SpriteEffectsFlipHorizontally | SpriteEffectsFlipVertically);
			if (sprite) 
			{
				[spriteBatch draw:sprite.texture to:explosion.position fromRectangle:sprite.sourceRectangle tintWithColor:[Color white]
						 rotation:0 origin:sprite.origin scaleUniform:0.75 effects:effects layerDepth:0];
			}
		}
	}
	
	[spriteBatch end];
	
}

- (void) unloadContent {
	[spriteBatch release];
	[primitiveBatch release];
	for (int i = 0; i < BonusTypes; i++) {
		[bonusSprite[i] release];
	}
	for (int i = 0; i < 3; i++) {
		[padSprite[i] release];
	}
}

- (void) dealloc
{
	[super dealloc];
}


@end
