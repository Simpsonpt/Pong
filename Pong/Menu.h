
//
//  Menu.h
//  Pong
//
//  Created by Renato Rodrigues on 1/4/11.
//  Copyright 2011 Pathon Project. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameCore.Mirage.h"
#import "GameCore.Scene.h"
#import "Retronator.Pong.classes.h"
#import "GameState.h"

@interface Menu : GameState 
{
	Scene *scene;	
	GuiRenderer *renderer;
	
	SpriteFont *retrotype, *fivexfive;
	Texture2D *buttonBackground;
	
	Button *back;
}

@end
