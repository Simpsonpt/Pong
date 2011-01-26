//
//  HighScores.h
//  Pong
//
//  Created by Renato Rodrigues on 1/4/11.
//  Copyright 2011 Pathon Project. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Menu.h"

@interface HighScores : Menu {
	Label *title,*maxSingle,*maxMulti,*single,*multi;
	Image *background,*hsImg;
	Button *reset;
}

@end