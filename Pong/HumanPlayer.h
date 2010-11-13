//
//  HumanPlayer.h
//  friHockey
//
//  Created by Renato Rodrigues on 11/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface HumanPlayer : Player {
	Rectangle *inputArea;
	BOOL grabbed;
	Vector2 *touchOffset;
	BOOL bonusCheck;
}

- (id) initWithPad:(Pad *)thePad scene:(id <IScene>)theScene position:(PlayerPosition)thePosition game:(Game*)game;

//- (BOOL) getbonusCheck;

@end
