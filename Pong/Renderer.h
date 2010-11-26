//
//  Renderer.h
//  Pong
//
//  Created by Renato Rodrigues on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Graphics.h"
#import "Retronator.Pong.classes.h"
#import "DrawableGameComponent.h"

#import "GameCore.Graphics.h"

@interface Renderer : DrawableGameComponent {
	// Resources
	ContentManager *content;
	Sprite *padSprite;
	Sprite *SpadSprite;
	Sprite *BpadSprite;
	Sprite *ballSprite;
	
	//Texture2D *background;
	
	Sprite *backgroundSprite;
	Sprite *middleSprite;
	
	/*Bonus Sprites*/
	Sprite *bonusSprite1;
	Sprite *bonusSprite2;
	Sprite *bonusSprite3;
	Sprite *bonusSprite4;
	Sprite *bonusSprite5;
	
	//Sprite *gameover;
	Sprite *bonusSprite6;
	
	//Graphics 
	SpriteBatch *spriteBatch;
	PrimitiveBatch *primitiveBatch;
	
	//Level
	Level *level;
}

- (id) initWithGame:(Game*)theGame level:(Level*)theLevel;

@end
