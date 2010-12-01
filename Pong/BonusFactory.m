//
//  BonusFactory.m
//  Pong
//
//  Created by Renato Rodrigues on 11/29/10.
//  Copyright 2010 Pathon Project. All rights reserved.
//

#import "BonusFactory.h"
#import "Retronator.Pong.h"

@implementation BonusFactory

static Class BonusClasses[BonusTypes];
static int frequency[BonusTypes];
static int totalFrequency;
static BonusType randomTypeLookup[100];

+ (void) initialize {

	BonusClasses[_ExpandPadSizeBonus] = [ExpandPadSizeBonus class];
	BonusClasses[_ShrinkPadSizeBonus] = [ShrinkPadSizeBonus class];
	BonusClasses[_PointsBonus] = [PointsBonus class];
	BonusClasses[_MultiBallBonus] = [MultiBallBonus class];
	
	frequency[_ExpandPadSizeBonus] = 3;
	frequency[_ShrinkPadSizeBonus] = 2;
	frequency[_PointsBonus] = 2;
	frequency[_MultiBallBonus] = 1;
	
	totalFrequency = 0;
	for (int i = 0; i < BonusTypes; i++) {
		for (int j = 0; j < frequency[i]; j++) {
			randomTypeLookup[totalFrequency] = i;
			totalFrequency++;
		}
	}
}

+ (Bonus*) createBonus:(BonusType)type {
	return [[[BonusClasses[type] alloc] init] autorelease];
}

+ (Bonus*) createRandomBonus {
	int index = [Random intLessThan:totalFrequency];
	BonusType type = randomTypeLookup[index];
	return [BonusFactory createBonus:type];
}

@end