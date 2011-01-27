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
}

+ (NSNumber *) loadProgress:(int)option;
+ (NSNumber *) loadOptions:(int)option;
+ (void) deleteProgress:(int)option;
+ (void) saveProgress:(int)points option:(int)op;
+ (void) saveOptions:(int)check option:(int)op;

- (BOOL) isLevelUnlocked:(LevelType)type;


@end
