//
//  GameProgress.h
//  Pong
//
//  Created by Renato Rodrigues on 1/4/11.
//  Copyright 2011 Pathon Project. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Retronator.Pong.classes.h"

@interface GameProgress : NSObject <NSCoding> {
	BOOL levelUnlocked[LevelTypes];
	//BOOL opponentUnlocked[OpponentTypes];
}

//+ (GameProgress *) loadProgress;
+ (NSNumber *) loadProgress;
+ (void) deleteProgress;
+ (void) saveProgress:(int)points;

- (BOOL) isLevelUnlocked:(LevelType)type;
//- (BOOL) isOpponentUnlocked:(OpponentType)type;

/*- (void) unlockLevel:(LevelType)type;*/
//- (void) unlockOpponent:(OpponentType)type;

@end
