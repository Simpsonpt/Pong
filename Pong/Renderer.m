//
//  Renderer.m
//  Pong
//
//  Created by Renato Rodrigues on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Renderer.h"
#import "Retronator.Pong.h"

@implementation Renderer

- (id) initWithGame:(Game *)theGame level:(Level *)theLevel {
	if (self = [super initWithGame:theGame]) {
		level = theLevel;
	}
	return self;
}

- (void) initialize {
	
	[super initialize];
}

- (void) loadContent {
	spriteBatch = [[SpriteBatch alloc] initWithGraphicsDevice:self.graphicsDevice];
	
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
	
	//Players Pad
	padSprite = [[Sprite alloc] init];
	padSprite.texture = [self.game.content load:@"MyPong"];
	//padSprite.sourceRectangle = [Rectangle rectangleWithX:100 y:20 width:60 height:60];
	padSprite.sourceRectangle = [Rectangle rectangleWithX:500 y:90 width:130 height:100];
	padSprite.origin = [Vector2 vectorWithX:30 y:30];
	
	//Ball
	ballSprite = [[Sprite alloc] init];
	ballSprite.texture = [self.game.content load:@"MyPong"];
	ballSprite.sourceRectangle = [Rectangle rectangleWithX:740 y:305 width:40 height:40];
	ballSprite.origin = [Vector2 vectorWithX:20 y:20];
	
	//Bonus
	bonusSprite = [[Sprite alloc] init];
	bonusSprite.texture = [self.game.content load:@"MyPong"];
	bonusSprite.sourceRectangle = [Rectangle rectangleWithX:640 y:305 width:40 height:40];
	bonusSprite.origin = [Vector2 vectorWithX:20 y:10];
	
	
}

- (void) drawWithGameTime:(GameTime *)gameTime {
	[self.graphicsDevice clearWithColor:[Color green]];
	
	[spriteBatch begin];
	
	for (id<NSObject> item in level.scene) {
		
		id<Position> itemWithPosition;
		if ([item conformsToProtocol:@protocol(Position)]) {
			itemWithPosition = (id<Position>)item;
		}
		
		Sprite *sprite;		
		if ([item isKindOfClass:[Pad class]]) {
			sprite = padSprite;
		} else if ([item isKindOfClass:[Ball class]]) {
			sprite = ballSprite;
		} else if ([item isKindOfClass:[Bonus class]]) {
			sprite = bonusSprite;
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
}

- (void) dealloc
{
	[spriteBatch release];
	[super dealloc];
}


@end
