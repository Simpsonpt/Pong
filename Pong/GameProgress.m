//
//  GameProgress.m
//  Pong
//
//  Created by Renato Rodrigues on 1/4/11.
//  Copyright 2011 Pathon Project. All rights reserved.
//

#import "GameProgress.h"
#import "Retronator.Pong.h"

@implementation GameProgress

- (id) init
{
	self = [super init];
	if (self != nil) {
		// Unlock first opponent and level type.
		//opponentUnlocked[OpponentTypeIceman] = YES;
		levelUnlocked[LevelTypePong] = YES;
	}
	return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
	self = [super init];
	if (self != nil) {
		for (int i = 0; i < LevelTypes; i++) {
			levelUnlocked[i] = [aDecoder decodeBoolForKey:[NSString stringWithFormat:@"levelUnlocked%i", i]];
		}
		/*for (int i = 0; i < OpponentTypes; i++) {
			opponentUnlocked[i] = [aDecoder decodeBoolForKey:[NSString stringWithFormat:@"opponentUnlocked%i", i]];
		}*/
	}
	return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
	for (int i = 0; i < LevelTypes; i++) {
		[aCoder encodeBool:levelUnlocked[i] forKey:[NSString stringWithFormat:@"levelUnlocked%i", i]];
	}
}

+ (NSNumber *) loadProgress:(int)option
{
	// Load game progress from file.
	NSNumber *progress = nil;
	NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	printf("Entrei e a option é: %i",option);
	if(option==1)
	{
		NSString *archivePath = [rootPath stringByAppendingPathComponent:[Constants progressFilePathSingle]];		
		progress = [NSKeyedUnarchiver unarchiveObjectWithFile:archivePath];
	}else if(option==2)
	{
		NSString *archivePath = [rootPath stringByAppendingPathComponent:[Constants progressFilePathMulti]];		
		progress = [NSKeyedUnarchiver unarchiveObjectWithFile:archivePath];
	}
	if(!progress)
		return 0;

	return progress;
}

+ (void) deleteProgress:(int)option 
{
	// Delete game progress file.
	if(option==1)
	{
		NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
		NSString *archivePath = [rootPath stringByAppendingPathComponent:[Constants progressFilePathSingle]];
		NSError *error;
		[[NSFileManager defaultManager] removeItemAtPath:archivePath error:&error];
	}
	else if(option==2)
	{
		NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
		NSString *archivePath = [rootPath stringByAppendingPathComponent:[Constants progressFilePathMulti]];
		NSError *error;
		[[NSFileManager defaultManager] removeItemAtPath:archivePath error:&error];
	}
}

+ (void) saveProgress:(int)points option:(int)op 
{
	// Save game progress to file.
	NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	if(op==1)
	{
		NSString *archivePath = [rootPath stringByAppendingPathComponent:[Constants progressFilePathSingle]];
		[NSKeyedArchiver archiveRootObject:[NSNumber numberWithInt:points] toFile:archivePath];
	} else if(op==2)
	{
		NSString *archivePath = [rootPath stringByAppendingPathComponent:[Constants progressFilePathMulti]];
		[NSKeyedArchiver archiveRootObject:[NSNumber numberWithInt:points] toFile:archivePath];
	}
}

- (BOOL) isLevelUnlocked:(LevelType)type {
	return levelUnlocked[type];
}

/*- (BOOL) isOpponentUnlocked:(OpponentType)type {
	return opponentUnlocked[type];
}*/

/*- (void) unlockLevel:(LevelType)type {
	levelUnlocked[type] = YES;
	[self saveProgress];
}*/

/*- (void) unlockOpponent:(OpponentType)type {
	opponentUnlocked[type] = YES;
	[self saveProgress];
}*/

@end

