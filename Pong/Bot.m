//
//  Bot.m
//  Pong
//
//  Created by Renato Rodrigues on 12/8/10.
//  Copyright 2010 Pathon Project. All rights reserved.
//

#import "Bot.h"


@implementation Bot

- (void) initialize {
	[super initialize];
	
	// AI properties
	speed = 100;
	attackSpeed = 150;
	attackFactor = 500;
	
	// Gameplay data
	[quotes addObject:@"So here you're just hardcores, or what? No softies around?"];
}

@end
