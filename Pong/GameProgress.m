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
	/*for (int i = 0; i < OpponentTypes; i++) {
		[aCoder encodeBool:opponentUnlocked[i] forKey:[NSString stringWithFormat:@"opponentUnlocked%i", i]];
	}*/	
}

/*+ (GameProgress *) loadProgress {
	// Load game progress from file.
	GameProgress *progress = nil;
	
	NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	NSString *archivePath = [rootPath stringByAppendingPathComponent:[Constants progressFilePath]];		
	progress = [NSKeyedUnarchiver unarchiveObjectWithFile:archivePath];
	
	// If there is no progress file, create a fresh instance.
	if (!progress) {
		progress = [[[GameProgress alloc] init] autorelease];
	}
	
	NSLog(@"Progress retain count:", [progress retainCount]);
	
	return progress;
}*/

+ (NSNumber *) loadProgress 
{
	// Load game progress from file.
	NSNumber *progress = nil;
	
	NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	NSString *archivePath = [rootPath stringByAppendingPathComponent:[Constants progressFilePath]];		
	progress = [NSKeyedUnarchiver unarchiveObjectWithFile:archivePath];
	
	// If there is no progress file, create a fresh instance.
	if (!progress) {
		progress = [[[GameProgress alloc] init] autorelease];
	}
	
	NSLog(@"Progress retain count:", [progress retainCount]);
	
	return progress;
}

+ (void) deleteProgress {
	// Delete game progress file.
	NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	NSString *archivePath = [rootPath stringByAppendingPathComponent:[Constants progressFilePath]];
	NSError *error;
	[[NSFileManager defaultManager] removeItemAtPath:archivePath error:&error];
}

/*- (void) saveProgress {
	// Save game progress to file.
	NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	NSString *archivePath = [rootPath stringByAppendingPathComponent:[Constants progressFilePath]];
	[NSKeyedArchiver archiveRootObject:self toFile:archivePath];
}*/
+ (void) saveProgress 
{
	// Save game progress to file.
	NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	NSString *archivePath = [rootPath stringByAppendingPathComponent:[Constants progressFilePath]];
	[NSKeyedArchiver archiveRootObject:[NSNumber numberWithInt:5] toFile:archivePath];
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

