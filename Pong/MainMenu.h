//
//  MainMenu.h
//  Pong
//
//  Created by Renato Rodrigues on 1/4/11.
//  Copyright 2011 Pathon Project. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Menu.h"

@interface MainMenu : Menu 
{
	Image *background;
	Button *singleplayer, *multiplayer, *options;
	Label *highS,*max;
}

@end
