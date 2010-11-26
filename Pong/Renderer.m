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

- (id) initWithGame:(Game *)theGame level:(Level *)theLevel {
	if (self = [super initWithGame:theGame]) {
		level = theLevel;
		content = [[ContentManager alloc] initWithServiceProvider:self.game.services];
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
	backgroundSprite.texture = [self.game.content load:@"MyPong"];
	backgroundSprite.sourceRectangle = [Rectangle rectangleWithX:25 y:25 width:320 height:460];
	backgroundSprite.origin = [Vector2 vectorWithX:0 y:0];
	
	//Middle
	middleSprite = [[Sprite alloc] init];
	middleSprite.texture = [self.game.content load:@"MyPong"];
	middleSprite.sourceRectangle = [Rectangle rectangleWithX:500 y:120 width:320 height:160];
	middleSprite.origin = [Vector2 vectorWithX:0 y:0];
	
	/*Players Pad*/
	
	padSprite = [[Sprite alloc] init];
	padSprite.texture = [self.game.content load:@"MyPong"];
	//padSprite.sourceRectangle = [Rectangle rectangleWithX:100 y:20 width:60 height:60];
	padSprite.sourceRectangle = [Rectangle rectangleWithX:516 y:90 width:107 height:26];
	//padSprite.origin = [Vector2 vectorWithX:90 y:30];
	padSprite.origin = [Vector2 vectorWithX:54 y:13];
	
	SpadSprite = [[Sprite alloc] init];
	SpadSprite.texture = [self.game.content load:@"MyPong"];
	SpadSprite.sourceRectangle = [Rectangle rectangleWithX:673 y:88 width:91 height:30];
	SpadSprite.origin = [Vector2 vectorWithX:46 y:15];
	
	BpadSprite = [[Sprite alloc] init];
	BpadSprite.texture = [self.game.content load:@"MyPong"];
	BpadSprite.sourceRectangle = [Rectangle rectangleWithX:800 y:90 width:180 height:50];
	BpadSprite.origin = [Vector2 vectorWithX:60 y:0];
	
	//Ball
	ballSprite = [[Sprite alloc] init];
	ballSprite.texture = [self.game.content load:@"MyPong"];
	ballSprite.sourceRectangle = [Rectangle rectangleWithX:740 y:305 width:40 height:40];
	ballSprite.origin = [Vector2 vectorWithX:20 y:20];
	
	/*Bonus Types*/
	
	bonusSprite1 = [[Sprite alloc] init];
	bonusSprite1.texture = [self.game.content load:@"MyPong"];
	bonusSprite1.sourceRectangle = [Rectangle rectangleWithX:640 y:305 width:40 height:40];
	bonusSprite1.origin = [Vector2 vectorWithX:20 y:10];
	
	//Cherry
	bonusSprite2 = [[Sprite alloc] init];
	bonusSprite2.texture = [self.game.content load:@"bonus"];
	bonusSprite2.sourceRectangle = [Rectangle rectangleWithX:160 y:160 width:30 height:20];
	bonusSprite2.origin = [Vector2 vectorWithX:0 y:0];
	
	//Morango
	bonusSprite3 = [[Sprite alloc] init];
	bonusSprite3.texture = [self.game.content load:@"bonus"];
	bonusSprite3.sourceRectangle = [Rectangle rectangleWithX:160 y:177 width:30 height:20];
	bonusSprite3.origin = [Vector2 vectorWithX:0 y:0];
	
	//Peachs
	bonusSprite4 = [[Sprite alloc] init];
	bonusSprite4.texture = [self.game.content load:@"bonus"];
	bonusSprite4.sourceRectangle = [Rectangle rectangleWithX:160 y:199 width:30 height:20];
	bonusSprite4.origin = [Vector2 vectorWithX:0 y:0];
	
	//Apple
	bonusSprite5 = [[Sprite alloc] init];
	bonusSprite5.texture = [self.game.content load:@"bonus"];
	bonusSprite5.sourceRectangle = [Rectangle rectangleWithX:160 y:216 width:30 height:20];
	bonusSprite5.origin = [Vector2 vectorWithX:0 y:0];
	
	//GameOver
	bonusSprite6 = [[Sprite alloc] init];
	bonusSprite6.texture = [self.game.content load:@"bonus"];
	bonusSprite6.sourceRectangle = [Rectangle rectangleWithX:0 y:190 width:120 height:10];
	bonusSprite6.origin = [Vector2 vectorWithX:0 y:0];
	
}

- (void) drawWithGameTime:(GameTime *)gameTime {
	[self.graphicsDevice clearWithColor:[Color green]];
	
	//[spriteBatch begin];
	[spriteBatch beginWithSortMode:SpriteSortModeBackToFront BlendState:nil];
	[primitiveBatch begin];
	
	for (id item in level.scene) {
		
		id<IPosition> itemWithPosition;
		if ([item conformsToProtocol:@protocol(IPosition)]) {
			itemWithPosition = (id<IPosition>)item;
		}
		
		Sprite *sprite = nil;
		if ([item isKindOfClass:[Pad class]]) {
			Pad *pad = (Pad*)item;
			[primitiveBatch drawRectangleAt:pad.position width:pad.width height:pad.height color:[Color white]];
			if(level.type==0)
				sprite = padSprite;
			if(level.type==1)
				sprite = SpadSprite;
			if(level.type==2)
				sprite = BpadSprite;
		} else if ([item isKindOfClass:[Ball class]]) {
			sprite = ballSprite;
		} else if ([item isKindOfClass:[Bonus class]]) {
			if(level.bonusStatus)
			{
				//printf("Vai haver Bonus\n");
				if(level.bonusType == 1)
					sprite = bonusSprite1;
				else if(level.bonusType == 2)
					sprite = bonusSprite2;
				else if(level.bonusType == 3)
					sprite = bonusSprite3;
				else if(level.bonusType == 4)
					sprite = bonusSprite4;
				else if(level.bonusType == 5)
					sprite = bonusSprite5;
				else if(level.bonusType == 6)
					sprite = bonusSprite6;
			}
		} else if ([item isKindOfClass:[Bg class]]) {
			sprite = backgroundSprite;
		} else if ([item isKindOfClass:[Middle class]]) {
			sprite = middleSprite;
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
}

- (void) unloadContent {
	[content unload];
}

- (void) dealloc
{
	[spriteBatch release];
	[super dealloc];
}


@end
