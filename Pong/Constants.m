//
//  Constants.m
//  Pong
//
//  Created by FRI Multimedija on 11/17/10.
//  Copyright 2010 Pathon Project. All rights reserved.
//

#import "Constants.h"

@implementation Constants

static Constants *instance;

+ (void) initialize {
	instance = [[Constants alloc] init];
}

+ (Constants *) getInstance {
	return instance;
}

- (float) minimumBallVerticalVelocity {
	return 200;
}

- (float) maximumBallAngle {
	return M_PI / 2;
}

- (int) startPoints {
	return 0;
}

- (float) initialBallSpeed {
	return 200;
}

- (float) ballSpeedUp {
	return 1.01f;
}

- (float) levelUpBallSpeedIncrease {
	return 100;
}

- (int) magnetPower {
	return 5;
}

/*Bonus Stuff*/

- (float) bonusChance {
	return 0.2f;
}

- (NSTimeInterval) changeSizeDuration {
	return 10;
}

+ (float) velocitySmoothing {
	return 0.5;
}

//0.9
+ (float) padCoefficientOfRestitution {
	return 1;
}

/*Game Rules*/
+ (int) winScore {
	return 3;
}

+ (NSString*) progressFilePath {
	return @"PongSave";
}


@end